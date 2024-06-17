import 'package:flutter/material.dart';
import 'package:first_project/screens/patients/patientscreen01.dart';



const Color darkBlue = Color(0xFF001F3F);
// const Color strongerBlue = Color(0xFF004080); // A stronger blue color for better contrast

void main() {
  runApp(MaterialApp(
    home: PatientDetailsScreen(),
  ));
}

class PatientDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: darkBlue),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Patient Screen',
          style: TextStyle(color: darkBlue, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(
                    'images/patient.png',
                    width: 80,
                    height: 80,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Patient Name',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: darkBlue,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Patient age',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[600],
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Issue description',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: darkBlue,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: [
                  ExpansionTile(
                    title: Text(
                      'Patient History',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    leading: Icon(Icons.history, color: Colors.white),
                    backgroundColor: darkBlue,
                    collapsedBackgroundColor: darkBlue,
                    children: [
                      Container(
                        color: Colors.lightBlue[50], 
                        child: Column(
                          children: [
                            CustomListTile(title: 'Blood report'),
                            CustomListTile(title: 'CT Scan report'),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  ExpansionTile(
                    title: Text(
                      'Prescription',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    leading: Icon(Icons.description, color: Colors.white),
                    backgroundColor: darkBlue,
                    collapsedBackgroundColor: darkBlue,
                    children: [
                      Container(
                        color: Colors.lightBlue[50], 
                        child: Column(
                          children: [
                            CustomListTile(title: '26 March 2022'),
                            CustomListTile(title: '13 April 2022'),
                            CustomListTile(title: 'Add new', icon: Icons.add),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Center(
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PatientScreen()),
                  );
                },
                child: Text(
                  'Click here for Patient Screen',
                  style: TextStyle(
                    color: darkBlue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomListTile extends StatelessWidget {
  final String title;
  final IconData icon;

  const CustomListTile({
    Key? key,
    required this.title,
    this.icon = Icons.remove_red_eye, // Default icon
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
      padding: EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: darkBlue),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              color: darkBlue,
              fontWeight: FontWeight.bold,
            ),
          ),
          Icon(
            icon,
            color: darkBlue,
          ),
        ],
      ),
    );
  }
}

// class PatientScreen01 extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Patient Screen 01'),
//       ),
//       body: Center(
//         child: Text('Welcome to Patient Screen 01'),
//       ),
//     );
//   }
// }
