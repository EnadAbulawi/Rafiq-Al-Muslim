import 'package:get_storage/get_storage.dart';

/// StorageServices
/// Wrapper بسيط حول GetStorage مع نمط Singleton لاستخدام موحّد في التطبيق.
class StorageServices {
  // ----------------------
  // 1) Singleton instance
  // ----------------------
  // Instance واحد جاهز للاستخدام (eager singleton)
  static final StorageServices _instance = StorageServices._internal();

  // ----------------------
  // 2) Storage object
  // ----------------------
  // كائن GetStorage الفعلي الذي يتعامل مع التخزين
  final GetStorage _storage = GetStorage();

  // ----------------------
  // 3) Private constructor
  // ----------------------
  // لمنع إنشاء نسخ خارجية — فقط _instance متاح
  StorageServices._internal();

  // ----------------------
  // 4) Public getter للوصول للـ singleton
  // ----------------------
  static StorageServices get instance => _instance;

  // ----------------------
  // 5) Initialization
  // ----------------------
  // يجب استدعاء هذا في main قبل runApp
  static Future<void> init() async {
    await GetStorage.init();
  }

  // ----------------------
  // 6) API - كتابة قيمة
  // ----------------------
  Future<void> write(String key, dynamic value) async {
    await _storage.write(key, value);
  }

  // ----------------------
  // 7) API - قراءة قيمة بال generic type
  // ----------------------
  T? read<T>(String key) {
    return _storage.read<T>(key);
  }

  // ----------------------
  // 8) API - إزالة قيمة
  // ----------------------
  Future<void> remove(String key) async {
    await _storage.remove(key);
  }

  // ----------------------
  // 9) API - مسح كل البيانات
  // ----------------------
  Future<void> clear() async {
    await _storage.erase();
  }

  // ----------------------
  // 10) API - التحقق من وجود مفتاح
  // ----------------------
  bool has(String key) {
    return _storage.hasData(key);
  }
}
