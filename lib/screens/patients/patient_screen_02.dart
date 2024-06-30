import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:first_project/screens/patients/patient_screen_03.dart'; 


void main() {
  runApp(MaterialApp(
    home: PatientScreen2(doctorId: '12dcd912-d3e1-4a8c-b07e-be504e5d0412'), 
  ));
}
class PatientScreen2 extends StatefulWidget {
  final String doctorId;

  PatientScreen2({required this.doctorId});

  @override
  _PatientScreen2State createState() => _PatientScreen2State();
}

class _PatientScreen2State extends State<PatientScreen2> {
  final String doctorName = "Dr. Lorem Ipsum";
  final String doctorSpecialty = "Dentist (D.M.)";
  final String doctorQualification = "BDS, DDS";
  final int doctorExperience = 5; // in years
  final String doctorDescription =
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.";
  
  final Color darkBlue = Color(0xFF001F3F);
  int selectedSlotIndex = -1;
  List<String> availableSlots = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchAvailableSlots();
  }

  Future<void> fetchAvailableSlots() async {
    try {
      final response = await http.get(Uri.parse('https://sapdos-api-v2.azurewebsites.net/api/Patient/GetAvailbleSlot'));

      print('API Response Status Code: ${response.statusCode}');
      print('API Response Body: ${response.body}');

      if (response.statusCode == 200) {
        final List<dynamic> slotData = json.decode(response.body);

        // Print the structure of each item in the list
        slotData.forEach((slot) => print(slot.toString()));

        // Extract slots from the response data
        if (slotData is List) {
          setState(() {
            availableSlots = slotData.map((slot) => slot.toString()).toList();
            isLoading = false;
          });
        } else {
          throw Exception("Unexpected response format");
        }
      } else {
        throw Exception("Failed to load available slots");
      }
    } catch (e) {
      // Log the error for debugging
      print("Error fetching available slots: $e");

      setState(() {
        isLoading = false;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to load available slots')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Doctor Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    'https://tse1.mm.bing.net/th?id=OIP.L1mnXm4v2-AS1tMDAoUgRgHaLH&pid=Api&rs=1&c=1&qlt=95&w=74&h=112',
                    height: 100.0,
                    width: 100.0,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: 16.0),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        doctorName,
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(doctorSpecialty),
                      Text(doctorQualification),
                      Text('$doctorExperience Years'),
                      Row(
                        children: [
                          Icon(Icons.star, color: Colors.orange),
                          Icon(Icons.star, color: Colors.orange),
                          Icon(Icons.star, color: Colors.orange),
                          Icon(Icons.star_half, color: Colors.orange),
                          Icon(Icons.star_border, color: Colors.orange),
                          Text('(512)'),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            Text(
              doctorDescription,
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: 16.0),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                color: darkBlue,
                padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                child: Row(
                  children: [
                    Icon(Icons.access_time, color: Colors.white),
                    SizedBox(width: 8.0),
                    Text(
                      'Available Slots',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Spacer(),
                    Icon(Icons.calendar_today, color: Colors.white),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16.0),
            isLoading 
              ? Center(child: CircularProgressIndicator())
              : Expanded(
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 3,
                      crossAxisSpacing: 8.0,
                      mainAxisSpacing: 8.0,
                    ),
                    itemCount: availableSlots.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedSlotIndex = index;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: selectedSlotIndex == index ? darkBlue : Colors.white,
                            borderRadius: BorderRadius.circular(8.0),
                            border: Border.all(color: darkBlue),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            availableSlots[index],
                            style: TextStyle(
                              fontSize: 16,
                              color: selectedSlotIndex == index ? Colors.white : darkBlue,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: selectedSlotIndex != -1
                  ? () {
                      // Handle book appointment logic and navigate to PatientScreen3
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Appointment booked for ${availableSlots[selectedSlotIndex]}')));
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PatientScreen3()),
                      );
                    }
                  : null,
              child: Text('Book Appointment'),
            ),
          ],
        ),
      ),
    );
  }
}

