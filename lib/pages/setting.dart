// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _notificationsEnabled = true;
  bool _darkModeEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
        backgroundColor: Colors.black87,
      ),
      backgroundColor: Colors.black87,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Settings",
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),

            // Edit Profile Section
            ListTile(
              leading: Icon(Icons.person, color: Colors.white),
              title: Text(
                "Edit Profile",
                style: TextStyle(color: Colors.white),
              ),
              trailing: Icon(Icons.arrow_forward_ios, color: Colors.grey),
              onTap: () {
                // Implement profile editing functionality
              },
            ),
            Divider(color: Colors.grey),

            // Notifications Toggle
            SwitchListTile(
              activeColor: Colors.orange,
              title: Text(
                "Enable Notifications",
                style: TextStyle(color: Colors.white),
              ),
              value: _notificationsEnabled,
              onChanged: (value) {
                setState(() {
                  _notificationsEnabled = value;
                });
              },
            ),
            Divider(color: Colors.grey),

            // Dark Mode Toggle
            SwitchListTile(
              activeColor: Colors.orange,
              title: Text(
                "Enable Dark Mode",
                style: TextStyle(color: Colors.white),
              ),
              value: _darkModeEnabled,
              onChanged: (value) {
                setState(() {
                  _darkModeEnabled = value;
                });
              },
            ),
            Divider(color: Colors.grey),

            // Other settings option
            ListTile(
              leading: Icon(Icons.info_outline, color: Colors.white),
              title: Text(
                "About App",
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                showAboutDialog(
                  context: context,
                  applicationName: 'Todo List App',
                  applicationVersion: '1.0.0',
                  applicationLegalese: '© 2024 Rohit Kumar jha',
                  children: [
                    Text(
                        'This is a simple and effective todo list app to help you manage tasks.'),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
