import 'package:flutter/material.dart';
import '../backend/shared_variables.dart';
import '../components/shared_components.dart';
import 'login_page.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          children: [
            AboutUsButton(
              text: "Contact Us",
              icon: Icons.mail,
              pressFunction: () {},
            ),
            AboutUsButton(
              text: "Reservation History",
              icon: Icons.history,
              pressFunction: () {
                snackBar("Soon Or Maybe not :)", context);
              },
            ),
            AboutUsButton(
              text: "Medical History",
              icon: Icons.medical_information,
              pressFunction: () {
                snackBar("Soon Or Maybe not :)", context);
              },
            ),
            isLoged
                ? AboutUsButton(
                    text: "Logout",
                    icon: Icons.logout,
                    pressFunction: () {
                      logout(context);
                    },
                  )
                : AboutUsButton(
                    text: "Login",
                    icon: Icons.login,
                    pressFunction: () {
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                            builder: (context) => LoginPage(
                              loged: () {},
                            ),
                          ),
                          (Route<dynamic> route) => false);
                    },
                  ),
            AboutUsButton(
              text: "Devs",
              icon: Icons.code,
              pressFunction: () => showDialog(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  title: const Text('Developed by:'),
                  content: const Text('Wonderful devs :)'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('OK'),
                    ),
                  ],
                ),
              ),
            ),
            AboutUsButton(
              text: "Version",
              icon: Icons.info,
              pressFunction: () {
                snackBar("Beta 1", context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
