import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rems/data/task.dart';
import 'package:rems/models/reminder_model.dart';
import 'package:rems/screens/new_reminder.dart';

class Reminder extends StatelessWidget {
  final Task task;

  Reminder(this.task);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(task.title),
        subtitle: Text(task.time.toString()),
        trailing: PopupMenuButton(
          onSelected: (result) {
            switch (result) {
              case 'Complete':
                Provider.of<ReminderModel>(context, listen: false).complete(task);
                break;
              case 'Edit':
                Navigator.push(context, MaterialPageRoute(builder: (context) => NewReminder.editReminder(task)));
                break;
              case 'Remove':
                Provider.of<ReminderModel>(context, listen: false).remove(task);
                break;
              default:
            }
          },
          itemBuilder: (context) => <PopupMenuEntry<String>>[
            const PopupMenuItem(
              child: Text('Complete'),
              value: 'Complete',
            ),
            const PopupMenuItem(
              child: Text('Edit'),
              value: 'Edit',
            ),
            const PopupMenuItem(
              child: Text('Remove'),
              value: 'Remove',
            ),
          ]
        ),
      ),
    );
  }
}