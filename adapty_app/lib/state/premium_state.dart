import 'package:shared_preferences/shared_preferences.dart';

class PremiumState {
  static bool isPremium = false;

  static Future<void> loadPremiumStatus() async {
    final prefs = await SharedPreferences.getInstance();
    isPremium = prefs.getBool('isPremium') ?? false;
  }

  static Future<void> savePremiumStatus(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isPremium', value);
    isPremium = value;
  }
}
