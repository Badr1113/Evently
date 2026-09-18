import 'package:evently/core/Widget/custom_elevated_button.dart';
import 'package:evently/core/Widget/custom_outlined_text_feild.dart';
import 'package:evently/core/sourses/assets_manager.dart';
import 'package:evently/core/sourses/color_manager.dart';
import 'package:evently/core/sourses/routes_manager.dart';
import 'package:evently/features/auth/widgets/custom_text_button.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Image.asset(
                AssetsManager.main_logo_light,
                width: 142,
                height: 27,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 48),
                  Text(
                    "Login to your account",
                    textAlign: TextAlign.start,
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  SizedBox(height: 24),
                  CustomOutlinedTextFeild(
                    hintText: 'Enter your email',
                    prefixIcon: Icon(Icons.mail_outline),
                  ),
                  SizedBox(height: 16),
                  CustomOutlinedTextFeild(
                    hintText: 'Enter your password',
                    prefixIcon: Icon(Icons.lock_outline),
                    suffixIcon: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.visibility),
                    ),
                  ),
                  SizedBox(height: 8),
                  CustomTextButton(hintText: "Forget Password?", onTap: () {}),
                  SizedBox(height: 48),
                  CustomElevatedButton(hintText: "Login"),
                  SizedBox(height: 48),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don’t have an account ? ",
                        style: Theme.of(context).textTheme.labelSmall,
                      ),
                      CustomTextButton(
                        hintText: "Signup",
                        onTap: () {
                          Navigator.pushReplacementNamed(
                            context,
                            RoutesManager.registerScreen,
                          );
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 32),
                  Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 1,
                          indent: 14,
                          endIndent: 16,
                          color: ColorManager.offWhite,
                        ),
                      ),
                      Text(
                        "Or",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: ColorManager.primaryBlue,
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 1,
                          indent: 14,
                          endIndent: 16,
                          color: ColorManager.offWhite,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
