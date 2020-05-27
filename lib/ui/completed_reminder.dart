import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rems/data/task.dart';
import 'package:rems/models/reminder_model.dart';

class CompletedReminder extends StatelessWidget {
  final Task task;

  CompletedReminder(this.task);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(task.title),
        subtitle: Text(task.time.toString()),
        trailing: IconButton(icon: Icon(Icons.delete), onPressed: () { Provider.of<ReminderModel>(context, listen: false).bin(task);}),
      ),
    );
  }
}