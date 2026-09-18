import 'package:evently/core/Widget/custom_elevated_button.dart';
import 'package:evently/core/Widget/custom_outlined_text_feild.dart';
import 'package:evently/core/sourses/assets_manager.dart';
import 'package:evently/core/sourses/color_manager.dart';
import 'package:evently/core/sourses/routes_manager.dart';
import 'package:evently/core/sourses/validator.dart';
import 'package:evently/features/auth/widgets/custom_text_button.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late TextEditingController nameController;

  late TextEditingController emailController;

  late TextEditingController passwordController;

  late TextEditingController conformationPasswordController;

  GlobalKey<FormState> _formState = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    conformationPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    conformationPasswordController.dispose();
    super.dispose();
  }

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
              Form(
                key: _formState,
                child: Column(
                  children: [
                    CustomOutlinedTextFeild(
                      validator: Validator.validateName,
                      controller: nameController,
                      hintText: "Enter your name",
                      prefixIcon: Icon(Icons.person_outline_sharp),
                    ),
                    SizedBox(height: 16),
                    CustomOutlinedTextFeild(
                      validator: Validator.validateEmail,
                      controller: emailController,
                      hintText: "Enter your email",
                      prefixIcon: Icon(Icons.email_outlined),
                    ),
                    SizedBox(height: 16),
                    CustomOutlinedTextFeild(
                      validator: Validator.validatePassword,
                      controller: passwordController,
                      hintText: "Enter your password",
                      prefixIcon: Icon(Icons.lock_outline),
                      suffixIcon: Icon(Icons.visibility_off),
                    ),
                    SizedBox(height: 16),
                    CustomOutlinedTextFeild(
                      validator: (input) {
                        if (input == null || input.trim().isEmpty) {
                          return "This Field Is Required";
                        }
                        if (input != passwordController.text.toString()) {
                          return "Not Matching";
                        }
                      },
                      controller: conformationPasswordController,
                      hintText: "Confirm your password",
                      prefixIcon: Icon(Icons.lock_outline),
                      suffixIcon: Icon(Icons.visibility_off),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 52),
              CustomElevatedButton(
                hintText: "Sign up",
                onPressed: _createAccount,
              ),
              SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account? ",
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                  CustomTextButton(
                    hintText: "Login",
                    onTap: () {
                      Navigator.pushReplacementNamed(
                        context,
                        RoutesManager.loginScreen,
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
        ),
      ),
    );
  }

  void _createAccount() {
    if (_formState.currentState!.validate()) {
      return;
    }
  }
}
