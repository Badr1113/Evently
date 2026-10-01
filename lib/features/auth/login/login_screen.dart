import 'package:evently/core/Widget/custom_dialog.dart';
import 'package:evently/core/Widget/custom_elevated_button.dart';
import 'package:evently/core/Widget/custom_flutter_toast.dart';
import 'package:evently/core/Widget/custom_outlined_text_feild.dart';
import 'package:evently/core/sourses/assets_manager.dart';
import 'package:evently/core/sourses/color_manager.dart';
import 'package:evently/core/sourses/routes_manager.dart';
import 'package:evently/core/sourses/validator.dart';
import 'package:evently/features/auth/widgets/custom_text_button.dart';
import 'package:evently/l10n/app_localizations.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginScreen extends StatefulWidget {
  const new({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  GlobalKey<FormState> _formstate = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;
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
              Form(
                key: _formstate,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(height: 48),
                    Text(
                      appLocalizations.login_to_your_account,
                      textAlign: TextAlign.start,
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                    SizedBox(height: 24),
                    CustomOutlinedTextFeild(
                      controller: emailController,
                      hintText: appLocalizations.enter_your_email,
                      prefixIcon: Icon(Icons.mail_outline),
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
                      maxLines: 1,
                    ),
                    SizedBox(height: 16),
                    CustomOutlinedTextFeild(
                      controller: passwordController,
                      hintText: appLocalizations.enter_your_password,
                      prefixIcon: Icon(Icons.lock_outline),
                      suffixIcon: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.visibility_off_outlined),
                      ),
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
                      maxLines: 1,
                    ),
                    SizedBox(height: 8),
                    CustomTextButton(
                      hintText: "${appLocalizations.forget_password}؟",
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          RoutesManager.forgetPasswordScreen,
                        );
                      },
                    ),
                    SizedBox(height: 48),
                    CustomElevatedButton(
                      onPressed: _login,
                      hintText: appLocalizations.login,
                    ),
                    SizedBox(height: 48),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          appLocalizations.dont_have_an_account,
                          style: Theme.of(context).textTheme.labelSmall,
                        ),
                        CustomTextButton(
                          hintText: appLocalizations.sign_up,
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
                            color: Theme.of(context).dividerColor,
                          ),
                        ),
                        Text(
                          appLocalizations.or,
                          style: Theme.of(context).textTheme.displaySmall!
                              .copyWith(
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
            ],
          ),
        ),
      ),
    );
  }

  void _login() async {
    if (!_formstate.currentState!.validate()) {
      return;
    }
    try {
      CustomDialog.showCustomDialog(context);
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
            email: emailController.text,
            password: passwordController.text,
          );
      await CustomDialog.waitAndPop(context, 2);
      CustomFlutterToast.showToast(context, "Successful Login");
      Navigator.pushReplacementNamed(context, RoutesManager.mainLayout);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-credential') {
        await CustomDialog.waitAndPop(context, 2);
        CustomFlutterToast.showToast(context, "Incorrect email or password.");
      } else if (e.code == 'user-not-found') {
        await CustomDialog.waitAndPop(context, 2);
        CustomFlutterToast.showToast(context, "No user found for that email.");
      } else if (e.code == 'wrong-password') {
        await CustomDialog.waitAndPop(context, 2);
        CustomFlutterToast.showToast(
          context,
          "Wrong password provided for that user.",
        );
      }
    } on FirebaseException catch (e) {
      await CustomDialog.waitAndPop(context, 2);
      if (e.code == 'unavailable') {
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
      CustomFlutterToast.showToast(context, "Firebase Error: ${e}");
    }
  }
}
