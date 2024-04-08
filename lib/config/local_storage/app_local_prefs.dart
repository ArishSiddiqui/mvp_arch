import 'package:shared_preferences/shared_preferences.dart';

class AppLocalPrefs {
  final SharedPreferences sP;
  const AppLocalPrefs({
    required this.sP,
  });

  final String gmail = 'gmail';
  final String password = 'password';
  final String loggedInAt = 'loggedInAt';
  final String isLoggedIn = 'isLoggedIn';

  String? get getGmail => sP.getString(gmail);
  set storeGmail(String value) => sP.setString(gmail, value);

  String? get getPassword => sP.getString(password);
  set storePassword(String value) => sP.setString(password, value);

  String? get getLoggedInTime => sP.getString(loggedInAt);
  set storeLoggedInTime(String value) => sP.setString(loggedInAt, value);

  bool? get getIsLoggedIn => sP.getBool(isLoggedIn);
  set storeIsLoggedIn(bool value) => sP.setBool(isLoggedIn, value);
}
