import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:login_with_google_task/provider/font-size-provider.dart';
import 'package:login_with_google_task/views/settings-drawer.dart';
import 'package:provider/provider.dart';

class DashboardPage extends StatelessWidget {
  final GoogleSignIn googleSignIn;

  DashboardPage({required this.googleSignIn});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Profile'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundImage:
                  NetworkImage(googleSignIn.currentUser!.photoUrl ?? ''),
              radius: 50,
            ),
            const SizedBox(height: 20),
            Consumer<FontSizeProvider>(
              builder: (context, fontSizeProvider, child) {
                return Text(
                  'Name: ${googleSignIn.currentUser!.displayName ?? ''}',
                  style: TextStyle(
                    fontSize: fontSizeProvider.fontSize,
                    fontWeight: FontWeight.bold,
                  ),
                );
              },
            ),
            Consumer<FontSizeProvider>(
              builder: (context, fontSizeProvider, child) {
                return Text(
                  'Email: ${googleSignIn.currentUser!.email}',
                  style: TextStyle(
                    fontSize: fontSizeProvider.fontSize,
                    fontStyle: FontStyle.normal,
                  ),
                );
              },
            ),
            Consumer<FontSizeProvider>(
                builder: (context, fontSizeProvider, child) {
              return Text(
                'Timezone: ${DateTime.now().timeZoneName}',
                style: TextStyle(
                  fontSize: fontSizeProvider.fontSize,
                ),
              );
            }),
          ],
        ),
      ),
      drawer: SettingsDrawer(),
    );
  }
}
