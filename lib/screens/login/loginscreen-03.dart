import 'package:flutter/material.dart';
import 'package:first_project/Widgets/customtext.dart';

const Color darkBlue = Color(0xFF001F3F);

class LoginScreen03 extends StatefulWidget {
  @override
  _LoginScreen03State createState() => _LoginScreen03State();
}

class _LoginScreen03State extends State<LoginScreen03> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    if (!emailRegex.hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters long';
    }
    return null;
  }

  String? validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please confirm your password';
    }
    if (value != passwordController.text) {
      return 'Passwords do not match';
    }
    return null;
  }

  void handleSignUp() {
    if (_formKey.currentState!.validate()) {
      Navigator.pushNamed(context, '/login');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth >= 800) {
            return buildWideLayout(context);
          } else {
            return buildNarrowLayout(context);
          }
        },
      ),
    );
  }

  Widget buildWideLayout(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
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
                    'images/doc1.png', // Ensure the correct path
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            // Right side: Register Form
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
                child: buildRegisterForm(context, 300),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildNarrowLayout(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Image
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.4,
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
                    'images/doc1.png', // Ensure the correct path
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 20),
              // Register Form
              buildRegisterForm(context, double.infinity),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildRegisterForm(BuildContext context, double width) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Center(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'SAPDOS',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: darkBlue,
                  fontFamily: 'CustomFont'
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              Text(
                'Register',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: darkBlue),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              Text(
                'Enter New Account Details',
                style: TextStyle(fontSize: 14, color: Colors.grey),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              SizedBox(
                width: width,
                child: CustomTextField(
                  controller: emailController,
                  labelText: 'Email address/Phone No.',
                  icon: Icons.email,
                  labelStyle: TextStyle(color: Colors.grey),
                  validator: validateEmail,
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                width: width,
                child: CustomTextField(
                  controller: passwordController,
                  labelText: 'Password',
                  obscureText: true,
                  icon: Icons.lock,
                  suffixIcon: Icons.visibility, // Eye icon
                  labelStyle: TextStyle(color: Colors.grey),
                  validator: validatePassword,
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                width: width,
                child: CustomTextField(
                  controller: confirmPasswordController,
                  labelText: 'Confirm Password',
                  obscureText: true,
                  icon: Icons.lock,
                  suffixIcon: Icons.visibility, // Eye icon
                  labelStyle: TextStyle(color: Colors.grey),
                  validator: validateConfirmPassword,
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                width: width,
                child: ElevatedButton(
                  onPressed: handleSignUp,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: darkBlue, // background color
                    foregroundColor: Colors.white, // text color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0), // rounded corners
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 14.0), // adjust padding as needed
                    child: Text('Sign-up'),
                  ),
                ),
              ),
              SizedBox(height: 80),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already on SAPDOS?',
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(width: 5),
                  TextButton(
                    onPressed: () => Navigator.pushNamed(context, '/login'),
                    child: Text(
                      'Sign-in',
                      style: TextStyle(color: darkBlue, decoration: TextDecoration.underline),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}