import 'package:evently/core/Widget/custom_elevated_button.dart';
import 'package:evently/core/Widget/custom_outlined_text_feild.dart';
import 'package:evently/core/sourses/assets_manager.dart';
import 'package:evently/core/sourses/color_manager.dart';
import 'package:evently/features/auth/widgets/custom_text_button.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(
                AssetsManager.main_logo_light,
                width: 142,
                height: 27,
              ),
              SizedBox(height: 48),
              Text(
                "Create your account",
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              SizedBox(height: 24),
              Column(
                children: [
                  CustomOutlinedTextFeild(
                    hintText: "Enter your name",
                    prefixIcon: Icon(Icons.person_outline_sharp),
                  ),
                  SizedBox(height: 16),
                  CustomOutlinedTextFeild(
                    hintText: "Enter your email",
                    prefixIcon: Icon(Icons.email_outlined),
                  ),
                  SizedBox(height: 16),
                  CustomOutlinedTextFeild(
                    hintText: "Enter your password",
                    prefixIcon: Icon(Icons.lock_outline),
                    suffixIcon: Icon(Icons.visibility_off),
                  ),
                  SizedBox(height: 16),
                  CustomOutlinedTextFeild(
                    hintText: "Confirm your password",
                    prefixIcon: Icon(Icons.lock_outline),
                    suffixIcon: Icon(Icons.visibility_off),
                  ),
                ],
              ),
              SizedBox(height: 52),
              CustomElevatedButton(hintText: "Sign up"),
              SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account? ",
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                  CustomTextButton(hintText: "Login"),
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
        ),
      ),
    );
  }
}
