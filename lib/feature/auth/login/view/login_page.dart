import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../../config/navigation/navigator.dart';
import '../../../../core/const/color_const.dart';
import '../../../../core/custom/custom.dart';
import '../../../../core/networkChecker/internet_builder.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: InternetBuilder(
          noInternetWidget: const CustomNoInternetWidget(),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Welocme Back',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                RichText(
                  text: TextSpan(
                    style: const TextStyle(
                      fontSize: 12.5,
                    ),
                    children: [
                      const TextSpan(
                        text: 'New User? ',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      TextSpan(
                        text: 'Create an Account',
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Head.off(AppPages.signUp);
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
                const CustomTextField(
                  label: 'Email / Mobile No',
                ),
                const SizedBox(
                  height: 20.0,
                ),
                const CustomTextField(
                  label: 'Password',
                ),
                const SizedBox(
                  height: 35.0,
                ),
                CustomButton(
                  name: 'Login',
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
