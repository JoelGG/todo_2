import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rems/models/theme_model.dart';
import 'package:rems/screens/main_screen.dart';
import 'package:rems/screens/new_reminder.dart';

import 'models/reminder_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ReminderModel>(create: (context) => ReminderModel()),
        ChangeNotifierProvider<ThemeModel>(create: (context) => ThemeModel()),
      ],
      child: MyChildApp()
    );
  }
}

class MyChildApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: Provider.of<ThemeModel>(context, listen: true).themePreset,
      title: 'Reminders',
      initialRoute: '/',
      routes: {
        '/': (context) => MainScreen(),
        '/new': (context) => NewReminder(),
      }
    );
  }
}