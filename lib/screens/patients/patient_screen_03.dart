import 'package:flutter/material.dart';
import 'package:first_project/screens/patients/patient_screen_04.dart';

void main() {
  runApp(MaterialApp(
    home: PatientScreen3(),
  ));
}

class PatientScreen3 extends StatefulWidget {
  @override
  _PatientScreen3State createState() => _PatientScreen3State();
}

class _PatientScreen3State extends State<PatientScreen3> {
  String? selectedPaymentMethod;

  void navigateToNextScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PatientScreen4()),
    );
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var isMobile = screenWidth < 600;

    return Scaffold(
      body: isMobile ? _buildMobileLayout() : _buildDesktopLayout(),
    );
  }

  Widget _buildMobileLayout() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                'images/doc1.png', // Local asset image
                fit: BoxFit.cover,
                height: 200,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'SAPDOS',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Color(0xFF001F3F),
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Booking Appointment',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Color(0xFF001F3F),
              ),
            ),
            SizedBox(height: 16.0),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: DropdownButton<String>(
                isExpanded: true,
                underline: SizedBox(),
                hint: Text('Select'),
                value: selectedPaymentMethod,
                items: <String>['Net Banking', 'Card', 'UPI']
                    .map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    selectedPaymentMethod = newValue;
                  });
                },
              ),
            ),
            SizedBox(height: 16.0),
            Center(
              child: ElevatedButton(
                onPressed: navigateToNextScreen,
                child: Text('Next'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF001F3F),
                  foregroundColor: Color(0xFFFFFFFF),
                  padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 50.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDesktopLayout() {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Container(
            child: Center(
              child: Image.asset(
                'images/doc1.png', // Local asset image
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'SAPDOS',
                  style: TextStyle(
                    fontSize: 32.0,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF001F3F),
                  ),
                ),
                SizedBox(height: 32.0),
                Text(
                  'Booking Appointment',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF001F3F),
                  ),
                ),
                SizedBox(height: 32.0),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: DropdownButton<String>(
                    isExpanded: true,
                    underline: SizedBox(),
                    hint: Text('Select'),
                    value: selectedPaymentMethod,
                    items: <String>['Net Banking', 'Card', 'UPI']
                        .map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedPaymentMethod = newValue;
                      });
                    },
                  ),
                ),
                SizedBox(height: 32.0),
                ElevatedButton(
                  onPressed: navigateToNextScreen,
                  child: Text('Next'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF001F3F),
                    foregroundColor: Color(0xFFFFFFFF),
                    padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 100.0),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
