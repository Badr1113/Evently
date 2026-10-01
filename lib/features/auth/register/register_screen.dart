import 'package:evently/core/Widget/custom_dialog.dart';
import 'package:evently/core/Widget/custom_elevated_button.dart';
import 'package:evently/core/Widget/custom_flutter_toast.dart';
import 'package:evently/core/Widget/custom_outlined_text_feild.dart';
import 'package:evently/core/sourses/assets_manager.dart';
import 'package:evently/core/sourses/color_manager.dart';
import 'package:evently/core/sourses/routes_manager.dart';
import 'package:evently/features/auth/widgets/custom_text_button.dart';
import 'package:evently/l10n/app_localizations.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
    AppLocalizations lang = AppLocalizations.of(context)!;
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
                lang.create_your_account,
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              SizedBox(height: 24),
              Form(
                key: _formState,
                child: Column(
                  children: [
                    CustomOutlinedTextFeild(
                      validator: (name) {
                        if (name == null || name.trim().isEmpty) {
                          return AppLocalizations.of(context)!
                              .this_field_is_required;
                        }
                        if (name.length < 4) {
                          return AppLocalizations.of(context)!
                              .name_validator_msg;
                        }
                      },
                      controller: nameController,
                      hintText: lang.enter_your_name,
                      prefixIcon: Icon(Icons.person_outline_sharp),
                      maxLines: 1,
                    ),
                    SizedBox(height: 16),
                    CustomOutlinedTextFeild(
                      validator: (email) {
                        RegExp emailRegExp = RegExp(
                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
                        );
                        if (email == null || email.trim().isEmpty) {
                          return AppLocalizations.of(context)!
                              .this_field_is_required;
                        }
                        if (!emailRegExp.hasMatch(email)) {
                          return AppLocalizations.of(context)!.invalid_email;
                        }
                      },
                      controller: emailController,
                      hintText: lang.enter_your_email,
                      prefixIcon: Icon(Icons.email_outlined),
                      maxLines: 1,
                    ),
                    SizedBox(height: 16),
                    CustomOutlinedTextFeild(
                      validator: (password) {
                        RegExp passwordRegExp = RegExp(
                          r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$',
                        );
                        if (password == null || password.trim().isEmpty) {
                          return AppLocalizations.of(context)!
                              .this_field_is_required;
                        }
                        if (!passwordRegExp.hasMatch(password)) {
                          return AppLocalizations.of(context)!.invalid_password;
                        }
                      },
                      controller: passwordController,
                      hintText: lang.enter_your_password,
                      prefixIcon: Icon(Icons.lock_outline),
                      maxLines: 1,
                      suffixIcon: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.visibility_off_outlined),
                      ),
                    ),
                    SizedBox(height: 16),
                    CustomOutlinedTextFeild(
                      validator: (input) {
                        if (input == null || input.trim().isEmpty) {
                          return lang.this_field_is_required;
                        }
                        if (input != passwordController.text.toString()) {
                          return lang.not_matching;
                        }
                      },
                      controller: conformationPasswordController,
                      hintText: lang.confirm_your_password,
                      prefixIcon: Icon(Icons.lock_outline),
                      suffixIcon: Icon(Icons.visibility_off_outlined),
                      maxLines: 1,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 52),
              CustomElevatedButton(
                hintText: lang.sign_up_elevated_button,
                onPressed: () async {
                  await _createAccount(
                    email: emailController.text,
                    password: passwordController.text,
                  );
                },
              ),
              SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "${lang.already_have_an_account} ",
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                  CustomTextButton(
                    hintText: lang.login,
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
                      color: Theme.of(context).dividerColor,
                    ),
                  ),
                  Text(
                    lang.or,
                    style: Theme.of(context).textTheme.displaySmall!.copyWith(
                      decoration: TextDecoration.none,
                      fontSize: 16,
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      thickness: 1,
                      indent: 14,
                      endIndent: 16,
                      color: Theme.of(context).dividerColor,
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

  Future<void> _createAccount({
    required String email,
    required String password,
  }) async {
    if (!_formState.currentState!.validate()) {
      return;
    }
    try {
      CustomDialog.showCustomDialog(context);
      final userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      await CustomDialog.waitAndPop(context, 2);
      CustomFlutterToast.showToast(context, "Accont Has Been Created");
      Navigator.pushReplacementNamed(context, RoutesManager.loginScreen);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        await CustomDialog.waitAndPop(context, 2);
        CustomFlutterToast.showToast(
          context,
          "The password provided is too weak.",
        );
      } else if (e.code == 'email-already-in-use') {
        await CustomDialog.waitAndPop(context, 2);
        CustomFlutterToast.showToast(
          context,
          "The account already exists for that email.",
        );
      } else if (e.code == 'network-request-failed') {
        await CustomDialog.waitAndPop(context, 2);
        CustomFlutterToast.showToast(
          context,
          'Authentication network error: Please check your internet connection.',
        );
      } else {
        await CustomDialog.waitAndPop(context, 2);
        CustomFlutterToast.showToast(context, "Auth Error: ${e.message}");
      }
    } on FirebaseException catch (e) {
      if (e.code == 'unavailable') {
        await CustomDialog.waitAndPop(context, 2);
        CustomFlutterToast.showToast(
          context,
          "Firestore/Firebase service is currently unavailable. You might be offline.",
        );
      } else {
        await CustomDialog.waitAndPop(context, 2);
        CustomFlutterToast.showToast(context, "Firebase Error: ${e.message}");
      }
    } catch (e) {
      await CustomDialog.waitAndPop(context, 2);
      CustomFlutterToast.showToast(context, "Firebase Error : ${e}");
    }
  }
}
