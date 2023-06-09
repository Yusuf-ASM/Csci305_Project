import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

final box = Hive.box("user");

const iconColor = Color.fromARGB(255, 101, 172, 137);
const backgroundColor = Color.fromARGB(255, 218, 233, 218);
const cardColor = Color.fromARGB(255, 125, 206, 167);
const buttonColor = Color.fromARGB(255, 120, 226, 175);
final textFieldBorderColor = Colors.green.shade300;
final textFieldFocusBorderColor = Colors.green.shade800;
bool homeLoading = true;

List<List<double>> fontSize = [
  [8, 16],
  [16, 24]
];

List<String> stringKeys = [
  "firstName",
  "lastName",
  "email",
  "gender",
  "phone",
  "birthdate",
  "password",
  "username",
  "hospitalName",
  "address",
  "city",
  "area"
];
List<String> intKeys = [
  "userId",
  "hospitalId",
  "isPatient",
];
List<String> boolKeys = [
  "loged",
  "availability",
];
