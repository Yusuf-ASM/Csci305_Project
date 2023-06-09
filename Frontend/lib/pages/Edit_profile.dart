import 'package:flutter/material.dart';
import 'package:hemodialysis_csci305/backend/shared_variables.dart';

import '../backend/api_connection.dart';
import '../components/login/button.dart';
import '../components/login/text_field.dart';
import '../components/shared_components.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController birthdate = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  // TextEditingController username = TextEditingController();
  // TextEditingController password = TextEditingController();
  // TextEditingController passwordConfirmation = TextEditingController();
  TextEditingController gender = TextEditingController();
  TextEditingController available = TextEditingController();

  @override
  Widget build(BuildContext context) {
    firstName.text = box.get("firstName");
    lastName.text = box.get("lastName");
    email.text = box.get("email");
    gender.text = box.get("gender");
    phoneNumber.text = box.get("phone");
    available.text = box.get("availability").toString();
    birthdate.text = box.get("birthdate");

    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Profile"),
      ),
      resizeToAvoidBottomInset: false,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              textFieldLable(labelText: "First Name:"),
              loginTextField(
                hintText: "Your First Name",
                obscureText: false,
                controller: firstName,
                keyboardType: TextInputType.name,
              ),
              textFieldLable(labelText: "Last Name:"),
              loginTextField(
                hintText: "Your Last Name",
                obscureText: false,
                controller: lastName,
                keyboardType: TextInputType.name,
              ),
              textFieldLable(labelText: "Email:"),
              loginTextField(
                hintText: "Your Email",
                obscureText: false,
                controller: email,
                keyboardType: TextInputType.emailAddress,
              ),
              textFieldLable(labelText: "Phone Number:"),
              loginTextField(
                  hintText: "Your Phone Number",
                  obscureText: false,
                  controller: phoneNumber,
                  keyboardType: TextInputType.phone),
              if (box.get("isPatient") == 0)
                textFieldLable(labelText: "Birthdate:"),
              if (box.get("isPatient") == 0)
                dateField(
                    controller: birthdate,
                    hintText: "Your Birthdate",
                    obscureText: false,
                    context: context),
              textFieldLable(labelText: "Gender:"),
              genderField(
                  controller: gender,
                  hintText: "Your Gender",
                  obscureText: false,
                  context: context),
              if (box.get("isPatient") == 1)
                textFieldLable(labelText: "Availability:"),
              if (box.get("isPatient") == 1)
                availabilityField(
                    controller: available,
                    hintText: "Your Availability",
                    obscureText: false,
                    context: context),
              customButton(
                text: "Update",
                color: Colors.green[600],
                pressFunction: () async {
                  if (email.text.isNotEmpty &&
                      firstName.text.isNotEmpty &&
                      lastName.text.isNotEmpty &&
                      phoneNumber.text.isNotEmpty &&
                      email.text.isNotEmpty &&
                      gender.text.isNotEmpty) {
                    if (box.get("isPatient") == 0 &&
                        birthdate.text.isNotEmpty) {
                      final result = await editUserInfo(
                        firstName: firstName.text,
                        birthdate: birthdate.text,
                        email: email.text,
                        lastName: lastName.text,
                        phoneNumber: phoneNumber.text,
                        hospitalId: box.get("hospitalId"),
                        password: box.get("password"),
                        username: box.get("username"),
                        userId: box.get("userId"),
                        gender: gender.text[0].toLowerCase(),
                      );
                      if (result[0] == 200) {
                        box.put("birthdate", birthdate.text);
                        box.put("firstName", firstName.text);
                        box.put("lastName", lastName.text);
                        box.put("email", email.text);
                        box.put("gender", gender.text[0].toLowerCase());
                        box.put("phone", phoneNumber.text);
                        snackBar("Done :)", context);
                      } else {
                        snackBar("Try again, Error ${result[0]}", context);
                      }
                      Navigator.pop(context);
                    } else if (box.get("isPatient") == 1 &&
                        available.text.isNotEmpty) {}
                    // if (password.text == passwordConfirmation.text) {
                    loadingIndecatorContext(context);
                    final result = await editUserInfo(
                      firstName: firstName.text,
                      email: email.text,
                      lastName: lastName.text,
                      phoneNumber: phoneNumber.text,
                      hospitalId: box.get("hospitalId"),
                      password: box.get("password"),
                      username: box.get("username"),
                      userId: box.get("userId"),
                      availability: box.get("availability"),
                      gender: gender.text[0].toLowerCase(),
                    );
                    if (result[0] == 200) {
                      box.put("availability",
                          available.text == "true" ? true : false);
                      box.put("firstName", firstName.text);
                      box.put("lastName", lastName.text);
                      box.put("email", email.text);
                      box.put("gender", gender.text[0].toLowerCase());
                      box.put("phone", phoneNumber.text);
                      snackBar("Done :)", context);
                    } else {
                      snackBar("Try again, Error ${result[0]}", context);
                    }
                    Navigator.pop(context);
                  } else {
                    snackBar("Fill The Missing Field(s)", context);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
