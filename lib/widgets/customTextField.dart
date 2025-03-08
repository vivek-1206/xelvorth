import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  final bool isPassword;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;

  const CustomTextField({
    Key? key,
    required this.controller,
    required this.label,
    this.isPassword = false,
    this.keyboardType = TextInputType.text,
    this.validator, required String hintText,
  }) : super(key: key);

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = true; // Track password visibility

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // **Label Above the TextField**
        Text(
          widget.label,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
        SizedBox(height: 5), // Adds spacing between label and TextField

        // **Text Input Field**
        TextFormField(
          controller: widget.controller,
          obscureText: widget.isPassword ? _obscureText : false, // Toggle visibility
          keyboardType: widget.keyboardType,
          decoration: InputDecoration(
            hintText: 'Enter your ${widget.label}', // Placeholder text
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            // **Eye Icon for Password Toggle**
            suffixIcon: widget.isPassword
                ? IconButton(
                    icon: Icon(
                      _obscureText ? Icons.visibility_off : Icons.visibility,
                      color: Colors.grey,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscureText = !_obscureText; // Toggle state
                      });
                    },
                  )
                : null, // No suffix icon for non-password fields
          ),
          validator: widget.validator,
        ),
        SizedBox(height: 12), // Adds spacing between fields
      ],
    );
  }
}
