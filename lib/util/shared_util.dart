import 'package:shared_preferences/shared_preferences.dart';

class SharedUtil {
  static Future<SharedPreferences> _initSharedUtil() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs;
  }

  static Future<void> saveData(Map<String, dynamic> data) async {
    SharedPreferences prefs = await _initSharedUtil();

    data.forEach((key, val) async {
      await prefs.setString(key, val); // 存储字符串
    });
  }

  // 读取数据
  static Future<String?> readData(String key) async {
    SharedPreferences prefs = await _initSharedUtil();
    return prefs.getString(key);
  }

  // 读取数据
  static Future<void> clear() async {
    SharedPreferences prefs = await _initSharedUtil();
    await prefs.remove('token'); // 删除单个键
    return;
  }
}
