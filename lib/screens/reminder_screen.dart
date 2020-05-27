import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rems/models/reminder_model.dart';
import 'package:rems/ui/reminder.dart';

class ReminderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ReminderModel>(
      builder: (context, model, child) {
        return ListView.builder(itemCount: model.reminders.length, itemBuilder: (context, i) {
            return Reminder(model.reminders[i]);
        });
      }
    );
  }
}