import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String labelText;
  final IconData icon;
  final bool obscureText;
  final IconData? suffixIcon; 
  final TextStyle? labelStyle;
  final double width; // Added width parameter
  final TextEditingController? controller; // Added controller parameter
  final String? Function(String?)? validator; // Added validator parameter

  const CustomTextField({
    Key? key,
    required this.labelText,
    required this.icon,
    this.obscureText = false,
    this.suffixIcon, 
    this.labelStyle,
    this.width = double.infinity, 
    this.controller, // Added controller
    this.validator, // Added validator
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey),
        ),
        child: TextFormField(
          controller: controller, 
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            labelText: labelText,
            prefixIcon: Icon(icon),
            suffixIcon: suffixIcon != null ? Icon(suffixIcon) : null, 
            border: InputBorder.none, 
            labelStyle: labelStyle,
          ),
          obscureText: obscureText,
          validator: validator, 
        ),
      ),
    );
  }
}

