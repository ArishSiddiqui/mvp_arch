import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mvp_arch/core/const/color_const.dart';

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
                  'welocme Back',
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
                            CustomLogger.p('Navigate to Registration Page.');
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
                SizedBox(
                  height: 50.0,
                  child: TextFormField(
                    decoration: InputDecoration(
                      isCollapsed: true,
                      // contentPadding: const EdgeInsets.all(15.0),
                      label: const Text('Email / Phone Num.'),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(15.0),
                    label: const Text('Password'),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 35.0,
                ),
                SizedBox(
                  height: 50.0,
                  width: double.infinity,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: ColorsConst.white,
                      backgroundColor: ColorsConst.purple,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    onPressed: () {
                      CustomLogger.p('Login');
                    },
                    child: const Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
