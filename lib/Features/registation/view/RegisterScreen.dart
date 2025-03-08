import 'package:flutter/material.dart';
import 'package:xelvorth/widgets/CustomButton.dart';
import 'package:xelvorth/widgets/customTextField.dart';














class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  

  @override
  Widget build(BuildContext context) {
    

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // **Title**
                  Text("XELVORTH", style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: const Color.fromARGB(255, 42, 26, 70))),

                  // **Illustration**
                  Image.asset('assets/Untitled design-9 1 (1).png', height: 180),
                  SizedBox(height: 20),

                  // **Form Fields**
                  CustomTextField(controller: _usernameController, label: 'Username', hintText: '',),
                  CustomTextField(controller: _emailController, label: 'Email', keyboardType: TextInputType.emailAddress, hintText: '',),
                  CustomTextField(controller: _mobileController, label: 'Mobile', keyboardType: TextInputType.phone, hintText: '',),
                  CustomTextField(controller: _passwordController, label: 'Password', isPassword: true, hintText: '',),
                  SizedBox(height: 40),
                  // **Register Button**
                  CustomButton(text: "Register", onPressed: () { 
                    
                   },),
      
                  // **Already have an account? Login**
                  
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Already have an account?", style: TextStyle(color: Colors.black54)),
                      TextButton(onPressed: () {}, child: Text("Login", style: TextStyle(color: const Color.fromARGB(255, 42, 26, 70)))),
                    ],
                  ),
                  SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {}, // Handle Facebook Login
                    child: Image.asset(
                      'assets/google.png',
                      height: 40,
                    ),
                  ),
                  SizedBox(width: 20),
                  GestureDetector(
                    onTap: () {}, // Handle Google Login
                    child: Image.asset(
                      'assets/Group.png',
                      height: 40,
                    ),
                  ),
                  SizedBox(width: 20),
                  GestureDetector(
                    onTap: () {}, // Handle LinkedIn Login
                    child: Image.asset(
                      'assets/Group 1.png',
                      height: 40,
                    ),
                  ),
                ],
              ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
