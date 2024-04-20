import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../config/navigation/navigator.dart';
import '../../../../core/const/app_const.dart';
import '../../../../core/const/color_const.dart';
import '../../../../core/custom/custom.dart';
import '../../../../core/networkChecker/internet_builder.dart';
import '../presentor/sign_up_riverpod.dart';

class SignUpPage extends StatelessWidget {
  final String eamilOrNumber;
  const SignUpPage({
    required this.eamilOrNumber,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    CustomLogger.p(eamilOrNumber);
    return Scaffold(
      body: SafeArea(
        child: InternetBuilder(
          noInternetWidget: const CustomNoInternetWidget(),
          child: SingleChildScrollView(
            child: SizedBox(
              height: pendingScreenHeight,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Consumer(builder: (context, ref, _) {
                  final signUp = ref.watch(signUpProvider);
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Sign Up',
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
                          ),
                          children: [
                            const TextSpan(
                              text: 'Already have an account? ',
                              style: TextStyle(
                                color: ColorsConst.white,
                              ),
                            ),
                            TextSpan(
                              text: 'Login',
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Head.back();
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
                        label: 'Name',
                      ),
                      const SizedBox(
                        height: 20.0,
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
                        height: 20.0,
                      ),
                      const CustomTextField(
                        label: 'Re-enter Password',
                      ),
                      const SizedBox(
                        height: 35.0,
                      ),
                      Row(
                        children: [
                          Checkbox(
                            side: const BorderSide(
                              color: ColorsConst.disabledGrey,
                              width: 2.0,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            value: signUp.isAccepted,
                            onChanged: (value) => ref
                                .read(signUpProvider.notifier)
                                .updateAccepted(value),
                          ),
                          RichText(
                            text: const TextSpan(
                              style: TextStyle(
                                fontSize: 12.0,
                                color: ColorsConst.white,
                              ),
                              children: [
                                TextSpan(
                                  text: 'I accept all ',
                                ),
                                TextSpan(
                                  text: 'Terms',
                                  style: TextStyle(
                                    color: ColorsConst.purple,
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                                TextSpan(
                                  text: ' and ',
                                ),
                                TextSpan(
                                  text: 'Conditions',
                                  style: TextStyle(
                                    color: ColorsConst.purple,
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      CustomButton(
                        disable: !signUp.isAccepted,
                        name: 'Sign Up',
                        onTap: () {},
                      ),
                    ],
                  );
                }),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
