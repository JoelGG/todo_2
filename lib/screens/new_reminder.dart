import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rems/data/task.dart';
import 'package:rems/models/reminder_model.dart';

class NewReminder extends StatelessWidget {
  final _key = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _dateController = TextEditingController();
  final _timeController = TextEditingController(); 

  var reminder;
  var chosenDate = DateTime.now();
  var chosenTime = TimeOfDay.now();

  NewReminder();

  NewReminder.editReminder(Task t) {
    reminder = t;
    _titleController.value = TextEditingValue(text: t.title);
    _dateController.value = TextEditingValue(text: t.time.toString());
    _timeController.value = TextEditingValue(text: t.time.toString());
    chosenDate = DateTime(t.time.year, t.time.month, t.time.day);
    chosenTime = TimeOfDay(hour: t.time.hour,minute: t.time.minute);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Reminder'),
      ),
      body: Container(
        padding: EdgeInsets.all(36),
        child: Form(
          key: _key,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                controller: _titleController,
                decoration: InputDecoration(
                  labelText: 'Title',
                  icon: Icon(Icons.short_text)
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter a title';
                  } else {
                    return null;
                  }
                },
              ),
              Padding(padding: EdgeInsets.only(top: 40)),
              InkWell(
                onTap: () async {
                  chosenDate = await showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(1900), lastDate: DateTime(2100));

                  _dateController.text = chosenDate.toString();
                },
                child: IgnorePointer(
                  child: TextFormField(
                    controller: _dateController,
                    decoration: InputDecoration(
                      labelText: 'Date',
                      icon: Icon(Icons.date_range),
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter a date';
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 40)),
              InkWell(
                onTap: () async {
                  chosenTime = await showTimePicker(context: context, initialTime: TimeOfDay.now());

                  _timeController.text = chosenTime.toString();
                },
                child: IgnorePointer(
                  child: TextFormField(
                    controller: _timeController,
                    decoration: InputDecoration(
                      labelText: 'Time',
                      icon: Icon(Icons.access_time),
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter a time';
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 40)),
              Center(
                child: RaisedButton(
                  onPressed: () {
                    if (_key.currentState.validate()) {
                      Navigator.pop(context);
                      if (reminder == null) {
                        Provider.of<ReminderModel>(context, listen: false).add(Task(_titleController.text, DateTime(chosenDate.year, chosenDate.month, chosenDate.day, chosenTime.hour, chosenTime.minute)));
                      } else {
                        Provider.of<ReminderModel>(context, listen: false).replace(reminder,Task(_titleController.text, DateTime(chosenDate.year, chosenDate.month, chosenDate.day, chosenTime.hour, chosenTime.minute)));
                      }
                    }
                  },
                  child: Text('Submit'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}