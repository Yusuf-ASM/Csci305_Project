import 'package:flutter/material.dart';

dynamic customButton(
    {Color? color,
    required String text,
    required VoidCallback pressFunction,
    VoidCallback? longPressFunction}) {
  return GestureDetector(
    onLongPress: longPressFunction,
    onTap: pressFunction,
    child: Padding(
      padding: const EdgeInsets.fromLTRB(8, 0, 8, 15),
      child: Container(
          decoration: BoxDecoration(
            color: color ?? Colors.green[400],
            borderRadius: BorderRadius.circular(6),
          ),
          padding: const EdgeInsets.all(15),
          child: Center(
            child: Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
          )),
    ),
  );
}
