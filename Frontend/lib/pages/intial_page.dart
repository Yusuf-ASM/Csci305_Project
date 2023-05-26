import 'package:flutter/material.dart';
import 'package:hemodialysis_csci305/pages/diagnose_page.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../backend/shared_variables.dart';
import 'doctor_home_page.dart';
import 'patient_home_page.dart';
import '../pages/login_page.dart';
import '../pages/reserve_page.dart';
import 'settings_page.dart';

class IntialPage extends StatefulWidget {
  const IntialPage({super.key});

  @override
  State<IntialPage> createState() => _IntialPageState();
}

int selectedPatientPage = 0;
List<Widget> patientPages = const [
  PatientHomePage(),
  ReservePage(),
  Settings(),
];

int selectedDoctorPage = 0;
List<Widget> doctorPages = const [
  DoctorHomePage(),
  DiagnosisPage(),
  Settings(),
];

class _IntialPageState extends State<IntialPage> {
  @override
  Widget build(BuildContext context) {
    final box = Hive.box("user");
    if (box.get("loged") && box.get("isPatient")) {
      return Scaffold(
        body: patientPages[selectedPatientPage],
        bottomNavigationBar: NavigationBar(
          destinations: const [
            NavigationDestination(icon: Icon(Icons.home, color: iconColor), label: "Home"),
            NavigationDestination(icon: Icon(Icons.schedule, color: iconColor), label: "Reserve"),
            NavigationDestination(icon: Icon(Icons.settings, color: iconColor), label: "Settings"),
          ],
          onDestinationSelected: (index) {
            setState(() {
              selectedPatientPage = index;
            });
          },
          selectedIndex: selectedPatientPage,
        ),
      );
    } else if (box.get("loged") && !box.get("isPatient")) {
      return Scaffold(
        body: doctorPages[selectedDoctorPage],
        bottomNavigationBar: NavigationBar(
          destinations: const [
            NavigationDestination(icon: Icon(Icons.home, color: iconColor), label: "Home"),
            NavigationDestination(icon: Icon(Icons.schedule, color: iconColor), label: "Diagnosis"),
            NavigationDestination(icon: Icon(Icons.settings, color: iconColor), label: "Settings"),
          ],
          onDestinationSelected: (index) {
            setState(() {
              selectedDoctorPage = index;
            });
          },
          selectedIndex: selectedDoctorPage,
        ),
      );
    }
    return LoginPage(
      loged: () {
        setState(() {});
      },
    );
  }
}
