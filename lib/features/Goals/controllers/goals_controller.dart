import 'package:get/get.dart';
import 'package:rafiq_muslim/data/services/storage_services.dart';

class GoalsController extends GetxController {
  final storage = StorageServices.instance;
  RxList<Map<String, dynamic>> goals = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    loadGoals();
    super.onInit();
  }

  void loadGoals() {
    List<dynamic>? savedGoals = storage.read('goals');
    if (savedGoals != null) {
      goals.value = savedGoals
          .map((g) => Map<String, dynamic>.from(g))
          .toList();
    }
  }

  void addGoals(String title, String frequency) {
    goals.add({
      'id': DateTime.now().microsecondsSinceEpoch.toString(),
      'title': title,
      'frequency': frequency,
      'completed': false,
      'createdAt': DateTime.now().toString(),
    });
    storage.write('goals', goals);
  }

  void toggleGoal(String id) {
    int index = goals.indexWhere((g) => g['id'] == id);
    if (index != -1) {
      goals[index]['completed'] = !goals[index]['completed'];
      storage.write('goals', goals);
    }
  }

  void deleteGoal(String id) {
    goals.removeWhere((g) => g['id'] == id);
    storage.write('goals', goals);
  }
}
