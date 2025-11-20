import 'package:get/get.dart';
import 'package:rafiq_muslim/data/services/storage_services.dart';

class PrayerController extends GetxController {
  final storage = StorageServices.instance;
  var prayers = <String, bool>{}.obs;
  var streak = 0.obs;
  var totalPrayers = 0.obs;

  final List<String> prayerNames = [
    'الفجر',
    'الظهر',
    'العصر',
    'المغرب',
    'العشاء',
  ];

  @override
  void onInit() {
    super.onInit();
    loadData();
    checkNewDay();
  }

  void loadData() {
    String today = DateTime.now().toString().split(' ')[0];
    prayers.value = Map<String, bool>.from(
      storage.read('prayers_$today') ?? {for (var p in prayerNames) p: false},
    );
    streak.value = storage.read('streak') ?? 0;
    totalPrayers.value = storage.read('totalPrayers') ?? 0;
  }

  void checkNewDay() {
    String lastDate = storage.read('lastDate') ?? '';
    String today = DateTime.now().toString().split(' ')[0];

    if (lastDate != today && lastDate.isNotEmpty) {
      var yesterdayPrayers = Map<String, bool>.from(
        storage.read('prayers_$lastDate') ??
            {for (var p in prayerNames) p: false},
      );
      bool allComplete = yesterdayPrayers.values.every((v) => v == true);

      if (allComplete) {
        streak.value++;
      } else {
        streak.value = 0;
      }
      storage.write('streak', streak.value);
    }
    storage.write('lastDate', today);
  }

  void togglePrayer(String prayer) {
    prayers[prayer] = !(prayers[prayer] ?? false);
    String today = DateTime.now().toString().split(' ')[0];
    storage.write('prayers_$today', prayers);

    if (prayers[prayer] == true) {
      totalPrayers.value++;
      storage.write('totalPrayers', totalPrayers.value);
    } else {
      totalPrayers.value--;
      storage.write('totalPrayers', totalPrayers.value);
    }
  }

  int getTodayCount() {
    return prayers.values.where((v) => v == true).length;
  }
}
