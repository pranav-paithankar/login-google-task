import 'package:flutter/material.dart';
import 'package:login_with_google_task/provider/font-size-provider.dart';
import 'package:login_with_google_task/provider/theme-provider.dart';
import 'package:provider/provider.dart';

class SettingsDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
            ),
            child: const Text(
              'Settings',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            title: const Text('Change Font Size'),
            onTap: () {
              _showFontSizeDialog(context);
            },
          ),
          const Divider(),
          ListTile(
            title: const Text('Change Dark/Light Theme'),
            onTap: () {
              Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }

  void _showFontSizeDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: const Text('Change Font Size'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                const Text('Select the new font size:'),
                Consumer<FontSizeProvider>(
                  builder: (context, fontSizeProvider, child) {
                    return Slider(
                      value: fontSizeProvider.fontSize,
                      min: 10,
                      max: 30,
                      divisions: 20,
                      onChanged: (double value) {
                        fontSizeProvider.changeFontSize(value);
                      },
                    );
                  },
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(dialogContext).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
