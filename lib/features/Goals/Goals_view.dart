import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rafiq_muslim/core/utils/app_fonts.dart';
import 'package:rafiq_muslim/features/Goals/controllers/goals_controller.dart';

class GoalsView extends StatelessWidget {
  final controller = Get.find<GoalsController>();
  final TextEditingController titleController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _showAddGoalBottomSheet(context),
      ),
      appBar: AppBar(
        centerTitle: true,
        title: Text('الاهداف الدينية', style: AppFonts.ibmMedium),
      ),
      body: Obx(
        () => controller.goals.isEmpty
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.flag_outlined,
                      size: 80,
                      color: Colors.grey[400],
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'لا توجد أهداف بعد',
                      style: AppFonts.ibmMedium.copyWith(fontSize: 22),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'اضغط + لإضافة هدف جديد',
                      style: AppFonts.ibmMedium.copyWith(
                        fontSize: 14,
                        color: Colors.grey[500],
                      ),
                    ),
                  ],
                ),
              )
            : ListView.builder(
                padding: EdgeInsets.all(16),
                itemCount: controller.goals.length,
                itemBuilder: (context, index) {
                  Map<String, dynamic> goal = controller.goals[index];
                  return Card(
                    margin: EdgeInsets.only(bottom: 12),
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(12),
                    ),
                    child: ListTile(
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      title: Text(
                        goal['title'],
                        style: AppFonts.ibmMedium.copyWith(
                          decoration: goal['completed']
                              ? TextDecoration.lineThrough
                              : null,
                        ),
                      ),
                      subtitle: Text(
                        goal['frequency'],
                        style: AppFonts.ibmMedium,
                      ),
                      trailing: IconButton(
                        onPressed: () => controller.deleteGoal(goal['id']),
                        icon: Icon(Icons.delete_outline, color: Colors.red),
                      ),

                      leading: Checkbox(
                        value: goal['completed'],
                        onChanged: (_) => controller.toggleGoal(goal['id']),
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }

  void _showAddGoalBottomSheet(BuildContext context) {
    String frequency = 'يومي';
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        // height: 200,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 16),
              Text("أضف هدف جديد", style: AppFonts.ibmMedium),
              const SizedBox(height: 16),
              TextField(
                controller: titleController,
                decoration: InputDecoration(
                  hintText: 'مثال: صيام الإثنين والخميس',
                  hintStyle: AppFonts.ibmMedium,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              DropdownButtonFormField<String>(
                value: frequency,
                items: ['يومي', 'أسبوعي', 'شهري'].map((f) {
                  return DropdownMenuItem(
                    value: f,
                    child: Text(f, style: AppFonts.ibmMedium),
                  );
                }).toList(),
                onChanged: (_) {},
                decoration: InputDecoration(
                  labelText: 'التكرار',
                  labelStyle: AppFonts.ibmMedium,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () => Get.back(),
                    child: Text('الغاء', style: AppFonts.ibmMedium),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (titleController.text.trim().isNotEmpty) {
                        controller.addGoals(titleController.text, frequency);
                        titleController.clear();
                        Get.back();
                      }
                    },
                    child: Text('اضافة', style: AppFonts.ibmMedium),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
