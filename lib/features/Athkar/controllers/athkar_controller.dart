import 'package:get/state_manager.dart';
import 'package:rafiq_muslim/data/services/storage_services.dart';

class AthkarController extends GetxController {
  final storage = StorageServices.instance;
  RxBool morningDone = false.obs;
  RxBool eveningDone = false.obs;
  RxBool sleepDone = false.obs;
  RxBool wakeupDone = false.obs;
  RxInt athkarStreak = 0.obs;

  @override
  void onInit() {
    loaddData();
    super.onInit();
  }

  void loaddData() {
    String today = DateTime.now().toString().split(' ')[0];
    morningDone.value = storage.read('morning_$today') ?? false;
    eveningDone.value = storage.read('evening_$today') ?? false;
    sleepDone.value = storage.read('sleep_$today') ?? false;
    wakeupDone.value = storage.read('wakeup_$today') ?? false;
    athkarStreak.value = storage.read('athkarStreak') ?? 0;
  }

  void toggleAthkar(String type) {
    String today = DateTime.now().toString().split(' ')[0];
    switch (type) {
      case 'morning':
        morningDone.value = !morningDone.value;
        storage.write('morning_$today', morningDone.value);
        break;
      case 'evening':
        eveningDone.value = !eveningDone.value;
        storage.write('evening_$today', eveningDone.value);
        break;

      case 'sleep':
        sleepDone.value = !sleepDone.value;
        storage.write('sleep_$today', sleepDone.value);
        break;

      case 'wakeup':
        wakeupDone.value = !wakeupDone.value;
        storage.write('wakeup_$today', wakeupDone.value);
        break;
    }
    checkStreak();
  }

  void checkStreak() {
    if (morningDone.value && eveningDone.value) {
      athkarStreak.value++;
      storage.write('athkarStreak', athkarStreak.value);
    }
  }
}
