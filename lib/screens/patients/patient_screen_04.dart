import 'package:flutter/material.dart';
import 'package:first_project/screens/login/login_screen_01.dart';

void main() {
  runApp(MaterialApp(
    home: PatientScreen4(),
    routes: {
      '/login': (context) => LoginScreen01(),
    },
  ));
}

class PatientScreen4 extends StatefulWidget {
  @override
  _PatientScreen4State createState() => _PatientScreen4State();
}

class _PatientScreen4State extends State<PatientScreen4> {
  String? selectedPaymentMethod;

  static const Color darkBlue = Color(0xFF001F3F);

  void showConfirmationDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: darkBlue,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.check_circle, size: 80.0, color: Colors.white),
              SizedBox(height: 16.0),
              Text(
                'Your booking is confirmed',
                style: TextStyle(color: Colors.white, fontSize: 24.0),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 24.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).pushNamed('/login');
                },
                child: Text('Okay'),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: darkBlue,
                  padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 32.0),
                ),
              ),
            ],
          ),
        );
      },
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
                color: darkBlue,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Booking Appointment',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: darkBlue,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Payment Method',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 8.0),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: DropdownButton<String>(
                isExpanded: true,
                underline: SizedBox(),
                hint: Text('Select the mode of payment you prefer'),
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
            Text(
              'Enter your details below',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 8.0),
            TextField(
              decoration: InputDecoration(
                labelText: 'Card Number',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 8.0),
            TextField(
              decoration: InputDecoration(
                labelText: 'Card Holder',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 8.0),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'MM/YY',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(width: 8.0),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'CVV',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            Center(
              child: ElevatedButton.icon(
                onPressed: showConfirmationDialog,
                icon: Icon(Icons.payment),
                label: Text('Pay now'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: darkBlue,
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
                    color: darkBlue,
                  ),
                ),
                SizedBox(height: 32.0),
                Text(
                  'Booking Appointment',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: darkBlue,
                  ),
                ),
                SizedBox(height: 32.0),
                Text(
                  'Payment Method',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 8.0),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: DropdownButton<String>(
                    isExpanded: true,
                    underline: SizedBox(),
                    hint: Text('Select the mode of payment you prefer'),
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
                Text(
                  'Enter your details below',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 16.0),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Card Number',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 16.0),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Card Holder',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 16.0),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: 'MM/YY',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    SizedBox(width: 16.0),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: 'CVV',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 32.0),
                ElevatedButton.icon(
                  onPressed: showConfirmationDialog,
                  icon: Icon(Icons.payment),
                  label: Text('Pay now'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: darkBlue,
                    foregroundColor: Color(0xFFFFFFFF),
                    padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 150.0),
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
