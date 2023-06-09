import 'package:flutter/material.dart';
import 'package:hemodialysis_csci305/backend/shared_variables.dart';

import '../pages/intial_page.dart';

dynamic snackBar(String message, BuildContext context,
    {int duration = 2000, double fontSize = 16}) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      duration: Duration(milliseconds: duration),
      content: Text(
        message,
        style: TextStyle(fontSize: fontSize),
      ),
      behavior: SnackBarBehavior.floating,
    ),
  );
}

dynamic loadingIndecatorContext(BuildContext context,
    {bool dismissible = false}) {
  return showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) => WillPopScope(
      onWillPop: () {
        return Future.value(dismissible);
      },
      child: const Center(child: CircularProgressIndicator()),
    ),
  );
}

dynamic loadingIndecator() {
  return const Center(child: CircularProgressIndicator());
}

void logout(BuildContext context) {
  for (var key in stringKeys) {
    box.put(key, "");
  }
  for (var key in boolKeys) {
    box.put(key, false);
  }
  for (var key in intKeys) {
    box.put(key, 0);
  }
  Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (context) => const IntialPage(),
      ),
      (Route<dynamic> route) => false);
}

class AboutUsButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback pressFunction;
  const AboutUsButton(
      {super.key,
      required this.text,
      required this.icon,
      required this.pressFunction});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextButton(
        onPressed: pressFunction,
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0, bottom: 8, top: 8),
          child: Row(
            children: [
              Icon(
                color: iconColor,
                icon,
                size: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Text(
                  text,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class AboutUsButtonV2 extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback pressFunction;
  final VoidCallback longPressFunction;
  const AboutUsButtonV2(
      {super.key,
      required this.text,
      required this.icon,
      required this.pressFunction,
      required this.longPressFunction});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextButton(
        onLongPress: longPressFunction,
        onPressed: pressFunction,
        style: const ButtonStyle(
          alignment: Alignment.centerLeft,
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 3),
              child: Icon(
                color: Colors.lightBlue[500],
                icon,
                size: 30,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text(
                text,
                style: const TextStyle(color: Color.fromARGB(255, 6, 115, 179)),
              ),
            )
          ],
        ),
      ),
    );
  }
}

void close(BuildContext context) {
  Navigator.of(context).pop();
}
