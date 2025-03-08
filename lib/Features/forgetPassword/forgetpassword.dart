import 'package:flutter/material.dart';
import 'package:xelvorth/widgets/CustomButton.dart';
import 'package:xelvorth/widgets/customTextField.dart';



class ForgetPasswordScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();

  ForgetPasswordScreen({super.key});

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 50,),
            const Text(
              "Forget Password?",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            // const Text(
            //   "Username or Email",
            //   style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            // ),
            const SizedBox(height: 8),
            CustomTextField(
              hintText: "Enter your username or email",
              controller: emailController, label: 'Username or Email',
            ),
            const SizedBox(height: 20),
            CustomButton(
              text: "Send OTP",
              onPressed: () {
                // Handle OTP sending logic
                print("OTP Sent to ${emailController.text}");
              },
            ),
          ],
        ),
      ),
    );
  }
}

// Reusable Custom TextFormField
