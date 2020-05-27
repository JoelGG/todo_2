import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rems/models/reminder_model.dart';
import 'package:rems/ui/completed_reminder.dart';

class CompletedReminders extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ReminderModel>(
      builder: (context, model, child) {
        return ListView.builder(itemCount: model.completed.length, itemBuilder: (context, i) {
            return CompletedReminder(model.completed[i]);
        });
      }
    );
  }
}