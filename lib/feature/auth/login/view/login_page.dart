import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/const/app_const.dart';
import '../../../../core/extensions/custom_extensions.dart';
import '../../../../config/navigation/navigator.dart';
import '../../../../core/const/color_const.dart';
import '../../../../core/custom/custom.dart';
import '../../../../core/networkChecker/internet_builder.dart';
import '../presentor/login_riverpod.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final GlobalKey<FormState> loginKey = GlobalKey<FormState>();
  final TextEditingController credController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(loginProvider.notifier).checkLoggedIn();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: InternetBuilder(
          noInternetWidget: const CustomNoInternetWidget(),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Form(
              key: loginKey,
              child: Consumer(builder: (context, ref, _) {
                final login = ref.watch(loginProvider);
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Welocme Back',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: ColorsConst.white,
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        style: const TextStyle(
                          fontSize: 12.5,
                          color: ColorsConst.white,
                        ),
                        children: [
                          const TextSpan(
                            text: 'New User? ',
                          ),
                          TextSpan(
                            text: 'Create an Account',
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Head.to(
                                  AppPages.signUp,
                                  arguments: 'XYZ',
                                );
                              },
                            style: const TextStyle(
                              color: ColorsConst.purple,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 45.0,
                    ),
                    CustomTextField(
                      controller: credController,
                      label: 'Email / Mobile No',
                      validator: (val) {
                        if (val == null) {
                          return 'Please enter Email or Mobile Number';
                        }
                        if (val.isValidMobileNum() || val.isValidEmail()) {
                          return null;
                        }
                        return 'Please enter valid Email or Mobile Number';
                      },
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    CustomTextField(
                      controller: passwordController,
                      label: 'Password',
                      validator: (val) {
                        if (val == null) {
                          return 'Please enter Password';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 35.0,
                    ),
                    CustomButton(
                      disable: login.status == ApiStatus.loading,
                      name: 'Login',
                      onTap: () {
                        if (loginKey.currentState!.validate()) {
                          ref.read(loginProvider.notifier).login(
                                cred: credController.text,
                                password: passwordController.text,
                              );
                        }
                        return;
                      },
                    ),
                  ],
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}
