import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:first_project/providers/authprovider.dart';
import 'package:first_project/data/mock_data.dart';
import 'package:first_project/screens/patients/patient_screen_02.dart'; // Import the PatientScreen2 page

class PatientScreen extends StatelessWidget {
  static const Color darkBlue = Color(0xFF001F3F);

  @override
  Widget build(BuildContext context) {
    final doctorName = Provider.of<AuthProvider>(context).doctorName ?? 'Unknown Doctor';
    final user = (jsonData['user'] ?? {}) as Map<String, dynamic>;
    final doctorsList = (jsonData['doctorsList'] ?? []) as List<dynamic>;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Patient Screen',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ],
      ),
      drawer: AppDrawer(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            UserInformation(user: user),
            SizedBox(height: 20),
            DoctorListHeader(),
            SizedBox(height: 20),
            DoctorGridView(doctorsList: doctorsList),
          ],
        ),
      ),
    );
  }
}

class AppDrawer extends StatelessWidget {
  static const Color darkBlue = PatientScreen.darkBlue;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.6,
        decoration: BoxDecoration(
          color: darkBlue,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20.0),
            bottomRight: Radius.circular(20.0),
          ),
        ),
        child: ListView(
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
            DrawerListTile(icon: Icons.category, title: 'Categories', onTap: () {}),
            DrawerListTile(icon: Icons.calendar_today, title: 'Appointment', onTap: () {}),
            DrawerListTile(icon: Icons.chat, title: 'Chat', onTap: () {}),
            DrawerListTile(icon: Icons.settings, title: 'Settings', onTap: () {}),
            DrawerListTile(icon: Icons.logout, title: 'Logout', onTap: () {}),
          ],
        ),
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const DrawerListTile({
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      onTap: onTap,
    );
  }
}

class UserInformation extends StatelessWidget {
  final Map<String, dynamic> user;

  const UserInformation({required this.user});

  @override
  Widget build(BuildContext context) {
    final greeting = user['greeting'] ?? 'Hello';
    final name = user['name'] ?? 'Guest';
    final avatar = user['avatar'] ?? 'https://via.placeholder.com/150';

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              greeting,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              name,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
        CircleAvatar(
          backgroundImage: NetworkImage(avatar),
          radius: 30,
        ),
      ],
    );
  }
}

class DoctorListHeader extends StatelessWidget {
  static const Color darkBlue = PatientScreen.darkBlue;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: darkBlue,
        borderRadius: BorderRadius.circular(10.0),
      ),
      padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Text(
              'Doctor\'s List',
              style: TextStyle(fontSize: 16, color: Colors.white),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Icon(Icons.arrow_circle_down, color: Colors.white),
        ],
      ),
    );
  }
}

class DoctorGridView extends StatelessWidget {
  final List<dynamic> doctorsList;

  const DoctorGridView({required this.doctorsList});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        int crossAxisCount;
        double childAspectRatio;

        if (constraints.maxWidth >= 1200) {
          crossAxisCount = 4;
          childAspectRatio = 4 / 1;
        } else if (constraints.maxWidth >= 800) {
          crossAxisCount = 2;
          childAspectRatio = 3.5 / 1;
        } else {
          crossAxisCount = 1;
          childAspectRatio = 3 / 1;
        }

        return GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: doctorsList.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
            childAspectRatio: childAspectRatio,
          ),
          itemBuilder: (context, index) {
            final doctor = doctorsList[index] as Map<String, dynamic>;
            return DoctorGridItem(doctor: doctor);
          },
        );
      },
    );
  }
}

class DoctorGridItem extends StatelessWidget {
  final Map<String, dynamic> doctor;

  const DoctorGridItem({required this.doctor});

  @override
  Widget build(BuildContext context) {
    final doctorId = doctor['doctorId'] ?? 'unknown';
    final doctorImage = doctor['doctorImage'] ?? 'https://via.placeholder.com/150';
    final doctorName = doctor['doctorName'] ?? 'Unknown Doctor';
    final specialization = doctor['specialization'] ?? 'General';
    final price = doctor['price'] ?? 'N/A';

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PatientScreen2(doctorId: doctorId),
          ),
        );
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(doctorImage),
                    radius: 30,
                  ),
                  SizedBox(width: 6.0),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          doctorName,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          specialization,
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14.0,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  children: [
                    Row(
                      children: List.generate(5, (starIndex) {
                        return Icon(
                          Icons.star,
                          color: Colors.yellow,
                          size: 18.0,
                        );
                      }),
                    ),
                    SizedBox(width: 4.0),
                    Text(
                      '$price',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14.0,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}




