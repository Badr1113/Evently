import 'package:evently/core/Widget/custom_elevated_button.dart';
import 'package:evently/core/sourses/assets_manager.dart';
import 'package:evently/core/sourses/color_manager.dart';
import 'package:evently/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const new({super.key});
  
  @override
  Widget build(BuildContext context) {
    AppLocalizations lang = AppLocalizations.of(context)! ;
    return Scaffold(
      appBar: _appBar(context,lang),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 16),
            Image.asset(
              AssetsManager.forgetPasswordImage,
              width: 343,
              height: 343,
            ),
            SizedBox(height: 40),
            CustomElevatedButton(hintText: lang.forget_password, onPressed: () {}),
          ],
        ),
      ),
    );
  }

  AppBar _appBar(BuildContext context,AppLocalizations lang) {
    return AppBar(
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(Icons.arrow_back_ios, color: ColorManager.primaryBlue),
      ),
      centerTitle: true,
      title: Text(lang.forget_password),
    );
  }
}
