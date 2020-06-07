import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rems/models/general_preferences_model.dart';
import 'package:rems/models/navbar_model.dart';
import 'package:rems/screens/completed_reminders.dart';
import 'package:rems/screens/reminder_screen.dart';
import 'package:rems/screens/settings_screen.dart';

class MainScreen extends StatelessWidget {
  final tabs = [ReminderScreen(), CompletedReminders(), SettingsScreen()];
  final titles = ['Reminders', 'Completed', 'Settings'];

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<NavBarModel>(create: (context) => NavBarModel()),
        ChangeNotifierProvider<GeneralPreferencesModel>(create: (context) => GeneralPreferencesModel()),
      ],
      child: Consumer2<NavBarModel,GeneralPreferencesModel>(
        builder: (context, model, prefModel, child) {
          return Scaffold(
            floatingActionButton: (model.currentIndex < 2) ? FloatingActionButton.extended(onPressed: () {Navigator.pushNamed(context, '/new');}, label: Text('New Reminder'), icon: Icon(Icons.add),) : null,
            appBar: AppBar(
              title: Text(titles[model.currentIndex]),
            ),
            body: Center(
              child: tabs[model.currentIndex],
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: model.currentIndex,
              onTap: (i) {
                model.index(i);
              },
              items: [
                BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),
                BottomNavigationBarItem(icon: Icon(Icons.done_all), title: Text('Completed')),
                BottomNavigationBarItem(icon: Icon(Icons.settings), title: Text('Settings')),
              ],
              showSelectedLabels: prefModel.showMenuTitles,
              showUnselectedLabels: prefModel.showMenuTitles,
            ),
          );
        }
      ),
    );
  }
}