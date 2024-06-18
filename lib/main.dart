import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mychat/main_page/home_page%20.dart';

import 'firebase_options.dart';

void main() async {
  await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);

  WidgetsFlutterBinding.ensureInitialized();
  final savedThemeMode = await AdaptiveTheme.getThemeMode();
  runApp(MyApp(savedThemeMode: savedThemeMode));
}

class MyApp extends StatelessWidget {
  const MyApp( {this.savedThemeMode});

  final AdaptiveThemeMode? savedThemeMode;
 // This widget is the root of your application.
 
  @override
  Widget build(BuildContext context) {
 return AdaptiveTheme(
      light: ThemeData.light(),
      dark: ThemeData.dark(),
 initial: savedThemeMode ?? AdaptiveThemeMode.light,
  builder: (theme, darkTheme) => MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Adaptive Theme Demo',
    theme: theme,
    darkTheme: darkTheme,
    home: HomePage( savedThemeMode: savedThemeMode  ),
  ),
);
  } 
}
