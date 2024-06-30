import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:first_project/providers/authprovider.dart';
import 'package:first_project/screens/doctors/doctor_screen_02.dart';
import 'package:first_project/Widgets/appointment_card.dart'; // Assuming this widget is used in DoctorScreen02

const Color darkBlue = Color(0xFF001F3F);

class DoctorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Doctor Dashboard',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      drawer: Drawer(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.6,
          decoration: BoxDecoration(
            color: darkBlue,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(20.0),
              bottomRight: Radius.circular(20.0),
            ),
          ),
          child: Consumer<AuthProvider>(
            builder: (context, authProvider, child) {
              return ListView(
                padding: EdgeInsets.zero,
                children: [
                  DrawerHeader(
                    decoration: BoxDecoration(),
                    child: Text(
                      'SAPDOS',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'A',
                      ),
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.category, color: Colors.white),
                    title: Text(
                      'Categories',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    onTap: () {
                      // Handle categories tap
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.calendar_today, color: Colors.white),
                    title: Text(
                      'Appointment',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    onTap: () {
                      // Handle appointment tap
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.chat, color: Colors.white),
                    title: Text(
                      'Chat',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    onTap: () {
                      // Handle chat tap
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.settings, color: Colors.white),
                    title: Text(
                      'Settings',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    onTap: () {
                      // Handle settings tap
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.logout, color: Colors.white),
                    title: Text(
                      'Logout',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    onTap: () {
                      // Handle logout tap
                    },
                  ),
                ],
              );
            },
          ),
        ),
      ),
      body: FutureBuilder(
        future: Provider.of<AuthProvider>(context, listen: false).fetchDashboard(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error loading dashboard data'));
          } else {
            return Consumer<AuthProvider>(
              builder: (context, authProvider, child) {
                final dashboard = authProvider.dashboard;
                if (dashboard == null) {
                  return Center(child: Text('No dashboard data available'));
                }
                return SingleChildScrollView(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Hello! Dr. Amol',
                                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                dashboard.doctorName,
                                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                          CircleAvatar(
                            backgroundImage: AssetImage('images/dr.png'),
                            radius: 40,
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Today\'s Appointments',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Container(
                            height: 120,
                            width: 150,
                            padding: EdgeInsets.all(16.0),
                            decoration: BoxDecoration(
                              color: Colors.lightBlue[100],
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    CircularProgressIndicator(
                                      value: dashboard.pendingAppointments/40,
                                      backgroundColor: Colors.grey,
                                      color: Colors.white,
                                      strokeWidth: 5,
                                    ),
                                    Text(
                                      '${dashboard.pendingAppointments}',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10),
                                Text(
                                  'Pending\nAppointments',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 10),
                          Container(
                            height: 120,
                            width: 150,
                            padding: EdgeInsets.all(16.0),
                            decoration: BoxDecoration(
                              color: Colors.lightBlue[100],
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    CircularProgressIndicator(
                                      value: dashboard.completedAppointments / 40,
                                      backgroundColor: Colors.grey,
                                      color: Colors.white,
                                      strokeWidth: 5,
                                    ),
                                    Text(
                                      '${dashboard.completedAppointments}',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10),
                                Text(
                                  'Completed\nAppointments',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Container(
                        decoration: BoxDecoration(
                          color: darkBlue,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: Text(
                                'Wednesday, March 7',
                                style: TextStyle(fontSize: 16, color: Colors.white),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Icon(Icons.calendar_today, color: Colors.white),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      LayoutBuilder(
                        builder: (context, constraints) {
                          return Column(
                            children: List.generate(dashboard.appointments.length, (i) {
                              final appointment = dashboard.appointments[i];
                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => PatientDetailsScreen(),
                                    ),
                                  );
                                },
                                child: Row(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(right: 10, bottom: 10),
                                      padding: EdgeInsets.all(10.0),
                                      decoration: BoxDecoration(
                                        border: Border.all(color: i % 2 == 0 ? Colors.red : Colors.green),
                                        borderRadius: BorderRadius.circular(10.0),
                                      ),
                                      child: Icon(
                                        Icons.access_time,
                                        color: i % 2 == 0 ? Colors.red : Colors.green,
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(right: 10, bottom: 10),
                                      padding: EdgeInsets.all(10.0),
                                      decoration: BoxDecoration(
                                        color: Colors.lightBlue[100],
                                        border: Border.all(color: Colors.grey),
                                        borderRadius: BorderRadius.circular(10.0),
                                      ),
                                      child: Text(
                                            '10:45 AM',
                                        style: TextStyle(fontSize: 16, color: Colors.black),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        margin: EdgeInsets.only(bottom: 10),
                                        padding: EdgeInsets.all(10.0),
                                        decoration: BoxDecoration(
                                          border: Border.all(color: Colors.grey),
                                          borderRadius: BorderRadius.circular(10.0),
                                        ),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Patient Name',
                                              style: TextStyle(fontSize: 16, color: Colors.black),
                                            ),
                                            Text(
                                                'X years',
                                              style: TextStyle(fontSize: 16, color: Colors.black),
                                            ),
                                            Icon(
                                              i % 2 == 0 ? Icons.close : Icons.check,
                                              color: i % 2 == 0 ? Colors.red : Colors.green,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }),
                          );
                        },
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => PatientDetailsScreen()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.lightBlue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'View All Appointments',
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
