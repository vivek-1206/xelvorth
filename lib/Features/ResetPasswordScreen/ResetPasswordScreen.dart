import 'package:flutter/material.dart';
import 'package:xelvorth/widgets/CustomPasswordField.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  _ResetPasswordScreenState createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  void _submit() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("✅ Password Reset Successful!"), backgroundColor: Colors.green),
      );
      // Navigate to login screen or perform any action after password reset
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 50),
                // **Title**
                Text("Reset Password", style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600)),
                SizedBox(height: 50),

                // **New Password Field**
                CustomPasswordField(
                  controller: _newPasswordController,
                  label: "New Password",
                  hintText: "Enter your password",
                ),
                SizedBox(height: 20),

                // **Confirm Password Field**
                CustomPasswordField(
                  controller: _confirmPasswordController,
                  label: "Confirm Password",
                  hintText: "Enter your password",
                ),
                SizedBox(height: 30),

                // **Submit Button**
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 42, 26, 70),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    ),
                    onPressed: _submit,
                    child: Text("Submit", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
