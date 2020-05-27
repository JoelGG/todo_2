import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rems/models/theme_model.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24),
      child: Column(
        children: [
          Row(children: [
            Text('Use System Theme', style: TextStyle(fontSize: 20),),
            Align(alignment: Alignment.centerRight,child: Switch(value: Provider.of<ThemeModel>(context, listen: true).useSystemTheme, onChanged: (value) {Provider.of<ThemeModel>(context, listen: false).toggleSystemTheme();})),
          ]),
          Row(children: [
            Text('Theme', style: TextStyle(fontSize: 20),),
            Align(
              alignment: Alignment.centerRight,
              child: Consumer<ThemeModel>(
                builder: (context, model, child) {
                  return DropdownButton<String>(
                    value: model.themeAsString(),
                    items: <String>[
                      'Light: Blue',
                      'Light: Green',
                      'Dark: Deep Black',
                    ].map<DropdownMenuItem<String>>((e) => DropdownMenuItem(value: e, child: Text(e),)).toList(),

                    onChanged: (value) {
                      model.setTheme(value);
                    }
                  );
                }
              ),
            ),
          ]),
        ],
      ),
    );
  }
}