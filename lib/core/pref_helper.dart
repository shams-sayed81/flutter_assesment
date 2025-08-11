
import 'package:shared_preferences/shared_preferences.dart';

class PrefHelper {
  static late SharedPreferences pref;

  static init() async{
    pref =await SharedPreferences.getInstance();

  }

  static  onboardingOpened (String key , bool value) async{
    return await pref.setBool(key ,value);
  }

  static bool? getBool(String key){
    return pref.getBool(key);
  }
}