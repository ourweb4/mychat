import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';

class settingsPage extends StatefulWidget {
  const settingsPage({super.key});

  @override
  State<settingsPage> createState() => _settingsPageState();
}

class _settingsPageState extends State<settingsPage> {
    bool isDark = false;
  // get saved theme mode
  void getSavedThemeMode() async {
    final savedThemeMode = await AdaptiveTheme.getThemeMode();
    if (savedThemeMode == AdaptiveThemeMode.dark) {
      
    setState(() {
      isDark = true;
    });
    } else {
      setState(() {
        isDark = false;
      });
    } 
  }

  @override
  void initState() {
    getSavedThemeMode();
    // TODO: implement initState
    super.initState();
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Center(
      child:  Card(
        child: SwitchListTile(
          title: Text('Change Mode'),
          secondary: Container(
            height: 30,
            width: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: isDark ? Colors.black : Colors.white,
            ),
            child: Icon(
              isDark ? Icons.nightlight_round : Icons.wb_sunny,
              color: isDark ? Colors.white : Colors.black,
            ),
          ),
          value: isDark ,
          onChanged: (value) {
            setState(() {
              isDark = value;
              AdaptiveTheme.of(context).setThemeMode(
                isDark ? AdaptiveThemeMode.dark : AdaptiveThemeMode.light,
              );
            });
          },
        ),
      ),
    )
    );
  }
}