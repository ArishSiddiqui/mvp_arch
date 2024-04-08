import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mvp_arch/config/local_storage/app_local_prefs.dart';

import '../../../../config/navigation/navigator.dart';
import '../../../../core/const/app_const.dart';
import '../../../../injection_container.dart';
import 'login_state.dart';

class LoginStateNotifier extends StateNotifier<LoginState> {
  final AppLocalPrefs appLocalPrefs;
  LoginStateNotifier({
    required this.appLocalPrefs,
  }) : super(const LoginState());

  void checkLoggedIn() {
    final bool? isLoggedIn = appLocalPrefs.getIsLoggedIn;
    if (isLoggedIn != null && isLoggedIn) {
      Head.to(AppPages.home);
    }
  }

  Future<void> login({
    required String cred,
    required String password,
  }) async {
    state = state.copywith(
      status: ApiStatus.loading,
    );
    appLocalPrefs.storeGmail = cred;
    appLocalPrefs.storePassword = password;
    final DateTime loggedInAt = DateTime.now();
    appLocalPrefs.storeLoggedInTime = loggedInAt.toIso8601String();
    appLocalPrefs.storeIsLoggedIn = true;
    await Future.delayed(const Duration(seconds: 3));
    Head.to(AppPages.home);
    state = state.copywith(
      status: ApiStatus.success,
    );
  }
}

final loginProvider = StateNotifierProvider<LoginStateNotifier, LoginState>(
  (ref) => sl<LoginStateNotifier>(),
);
