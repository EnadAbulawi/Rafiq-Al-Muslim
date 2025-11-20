import 'package:flutter/material.dart';
import 'package:rafiq_muslim/core/utils/app_fonts.dart';

class QuranView extends StatelessWidget {
  const QuranView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'ورد القرآن',
          style: AppFonts.ibmMedium.copyWith(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: EdgeInsets.all(24),
              child: Column(
                children: [
                  Text(
                    'التقدم في الختمة',
                    style: AppFonts.ibmMedium.copyWith(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      SizedBox(
                        width: 150,
                        height: 150,
                        child: CircularProgressIndicator(
                          value: 15,
                          strokeWidth: 12,
                          backgroundColor: Colors.red[300],
                        ),
                      ),
                      Column(
                        children: [
                          Text(
                            '132',
                            style: TextStyle(
                              fontSize: 36,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'من 604',
                            style: TextStyle(fontSize: 14, color: Colors.grey),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Text(
                    '406',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 16),
          Card(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'الورد اليومي',
                    style: AppFonts.ibmMedium.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('عدد الصفحات:', style: AppFonts.ibmMedium),
                      Row(
                        children: [
                          IconButton(
                            icon: Icon(Icons.remove_circle_outline),
                            onPressed: () {},
                          ),
                          Text(
                            '5',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          IconButton(
                            icon: Icon(Icons.add_circle_outline),
                            onPressed: () => null,
                          ),
                        ],
                      ),
                    ],
                  ),
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('تقدم اليوم:', style: AppFonts.ibmMedium),
                      Text(
                        '55 / 604',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 16),
          ElevatedButton.icon(
            onPressed: () => null,
            icon: Icon(Icons.add),
            label: Text(
              'أضف صفحة',
              style: AppFonts.ibmMedium.copyWith(fontSize: 16),
            ),
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          SizedBox(height: 12),
          Card(
            color: Colors.green[50],
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Icon(Icons.emoji_events, color: Colors.amber, size: 32),
                      SizedBox(height: 8),
                      Text(
                        'الختمات',
                        style: AppFonts.ibmMedium.copyWith(
                          fontSize: 12,
                          color: Colors.lightBlueAccent,
                        ),
                      ),
                      Text(
                        '1',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.lightBlueAccent,
                        ),
                      ),
                    ],
                  ),
                  Container(width: 1, height: 50, color: Colors.grey),
                  Column(
                    children: [
                      Icon(Icons.calendar_today, color: Colors.blue, size: 32),
                      SizedBox(height: 8),
                      Text(
                        'الأيام المتبقية',
                        style: AppFonts.ibmMedium.copyWith(
                          fontSize: 12,
                          color: Colors.lightBlueAccent,
                        ),
                      ),
                      Text(
                        '${((604 - 150) / 2).ceil()}',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.lightBlueAccent,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
