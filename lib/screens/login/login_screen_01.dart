import 'package:flutter/material.dart';

const Color darkBlue = Color(0xFF001F3F);

class LoginScreen01 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    var isMobile = screenWidth < 600;

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: isMobile
              ? SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Image Container
                      Flexible(
                        child: Container(
                          height: screenHeight * 0.3,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: Image.asset(
                              'images/doc1.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      // Login Container
                      Flexible(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(32.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'SAPDOS',
                                  style: TextStyle(
                                    fontSize: 36,
                                    fontWeight: FontWeight.bold,
                                    color: darkBlue,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(height: 30),
                                Text(
                                  'Login to your SAPDOS account or create one now.',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: darkBlue,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(height: 30),
                                Center(
                                  child: SizedBox(
                                    width: double.infinity,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        Navigator.pushNamed(context, '/login');
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: darkBlue, // background color
                                        padding: EdgeInsets.symmetric(vertical: 14), // adjust padding
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(4), // rounded corners
                                        ),
                                      ),
                                      child: Text(
                                        'LOGIN',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 20),
                                Center(
                                  child: SizedBox(
                                    width: double.infinity,
                                    child: OutlinedButton(
                                      onPressed: () {
                                        Navigator.pushNamed(context, '/register');
                                      },
                                      style: OutlinedButton.styleFrom(
                                        padding: EdgeInsets.symmetric(vertical: 14), // adjust padding
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(4), // rounded corners
                                        ),
                                        side: BorderSide(color: darkBlue), // border color
                                      ),
                                      child: Text(
                                        'SIGN-UP',
                                        style: TextStyle(
                                          color: darkBlue,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 30),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(context, '/doctorscreen1'); // Adjusted route
                                  },
                                  child: const Text(
                                    'Proceed as a Guest',
                                    style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      color: Colors.black,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              : Row(
                  children: [
                    // Left side: Image
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20.0),
                            bottomRight: Radius.circular(20.0),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20.0),
                            bottomRight: Radius.circular(20.0),
                          ),
                          child: Image.asset(
                            'images/doc1.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    // Right side: Login Form
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20.0),
                            bottomLeft: Radius.circular(20.0),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(32.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'SAPDOS',
                                style: TextStyle(
                                  fontSize: 36,
                                  fontWeight: FontWeight.bold,
                                  color: darkBlue,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: 30),
                              Text(
                                'Login to your SAPDOS account or create one now.',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: darkBlue,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: 30),
                              Center(
                                child: SizedBox(
                                  width: 250, // Adjust the width as needed
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.pushNamed(context, '/login');
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: darkBlue, // background color
                                      padding: EdgeInsets.symmetric(vertical: 14), // adjust padding
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(4), // rounded corners
                                      ),
                                    ),
                                    child: Text(
                                      'LOGIN',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 20),
                              Center(
                                child: SizedBox(
                                  width: 250, // Adjust the width as needed
                                  child: OutlinedButton(
                                    onPressed: () {
                                      Navigator.pushNamed(context, '/register');
                                    },
                                    style: OutlinedButton.styleFrom(
                                      padding: EdgeInsets.symmetric(vertical: 14), // adjust padding
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(4), // rounded corners
                                      ),
                                      side: BorderSide(color: darkBlue), // border color
                                    ),
                                    child: Text(
                                      'SIGN-UP',
                                      style: TextStyle(
                                        color: darkBlue,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 30),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(context, '/doctor'); // Adjusted route
                                },
                                child: const Text(
                                  'Proceed as a Guest',
                                  style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    color: Colors.black,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}

