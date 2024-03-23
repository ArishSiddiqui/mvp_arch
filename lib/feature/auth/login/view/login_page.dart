import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mvp_arch/core/extensions/custom_extensions.dart';

import '../../../../config/navigation/navigator.dart';
import '../../../../core/const/color_const.dart';
import '../../../../core/custom/custom.dart';
import '../../../../core/networkChecker/internet_builder.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final GlobalKey<FormState> loginKey = GlobalKey<FormState>();

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
                              Head.to(AppPages.signUp);
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
                    name: 'Login',
                    onTap: () {
                      if (loginKey.currentState!.validate()) {}
                      return;
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
