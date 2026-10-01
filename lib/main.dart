import 'package:evently/config/theme/theme_manager.dart';
import 'package:evently/core/local_storage/prefs_manager.dart';
import 'package:evently/core/provider/lang_provider.dart';
import 'package:evently/core/provider/theme_provider.dart';
import 'package:evently/core/sourses/routes_manager.dart';
import 'package:evently/l10n/app_localizations.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PrefsManager.init();
  
await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeProvider>(
          create: (context) => ThemeProvider(),
        ),
        ChangeNotifierProvider<LangProvider>(
          create: (context) => LangProvider(),
        ),
      ],
      child: Evently(),
    ),
  );
}

class Evently extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();
    LangProvider langProvider = Provider.of<LangProvider>(context);
    return MaterialApp(
      routes: RoutesManager.routes,
      initialRoute: RoutesManager.loginScreen,
      theme: ThemeManager.light,
      darkTheme: ThemeManager.dark,
      themeMode: themeProvider.currentTheme,
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      locale: langProvider.currentLan,
    );
  }
}