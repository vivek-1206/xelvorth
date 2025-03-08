import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:xelvorth/widgets/CustomButton.dart';
import 'package:xelvorth/widgets/customTextField.dart';





// class LoginScreen extends StatefulWidget {
//   const LoginScreen({super.key});

//   @override
//   _LoginScreenState createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();

//   void _login() async {
//     final authViewModel = Provider.of<AuthViewModel>(context, listen: false);
//     await authViewModel.login(
//       _emailController.text.trim(),
//       _passwordController.text.trim(),
//     );

//     if (authViewModel.errorMessage != null) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text(authViewModel.errorMessage!)),
//       );
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Login Successful!')),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final authViewModel = Provider.of<AuthViewModel>(context);

//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             CustomTextField(
//               controller: _emailController,
//               label: 'Email',
//               keyboardType: TextInputType.emailAddress,
//             ),
//             CustomTextField(
//               controller: _passwordController,
//               label: 'Password',
//               isPassword: true,
//             ),
//             SizedBox(height: 20),
//             CustomButton(
//               text: "Login",
//               onPressed: _login,
//               isLoading: authViewModel.isLoading,
//             ),
//             TextButton(
//               onPressed: () {}, // Navigate to Register Screen
//               child: Text("Don't have an account? Register"),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }






class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  

  @override
  Widget build(BuildContext context) {
    

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // App Title
              Text(
                "XELVORTH",
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: const Color.fromARGB(255, 42, 26, 70)),
              ),

              // Illustration Image
              Image.asset(
                'assets/Untitled design-9 1.png',
                height: 180,
              ),
              SizedBox(height: 20),

              // Email Input
              CustomTextField(
                controller: _emailController,
                label: 'Username or Email',
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) return "Please enter an email";
                  if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) return "Enter a valid email";
                  return null;
                }, hintText: '',
              ),

              // Password Input
              CustomTextField(
                controller: _passwordController,
                label: 'Password',
                isPassword: true,
                validator: (value) {
                  if (value == null || value.isEmpty) return "Please enter a password";
                  if (value.length < 6) return "Password must be at least 6 characters";
                  return null;
                }, hintText: '',
              ),

              // Forgot Password
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {}, // Forgot Password
                  child: Text("Forget Password ?", style: TextStyle(color: const Color.fromARGB(255, 42, 26, 70))),
                ),
              ),

              // Login Button
              CustomButton(
                text: "Login", onPressed: () { 

                 },
                
                
              ),

              // Register Section in One Line
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account?", style: TextStyle(color: Colors.black54)),
                    SizedBox(width: 5),
                    GestureDetector(
                      onTap: () {}, // Navigate to Register Page
                      child: Text(
                        "Register",
                        style: TextStyle(color: const Color.fromARGB(255, 42, 26, 70), fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),

              // Social Media Login Icons (Google, Facebook, LinkedIn)
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () async {
                      const facebookUrl = "https://www.google.com";
                    if (await canLaunchUrl(Uri.parse(facebookUrl))) {
                      await launchUrl(Uri.parse(facebookUrl),
                          mode: LaunchMode.externalApplication);
                    } else {
                      print("Could not launch $facebookUrl");
                    }
                    }, // Handle Facebook Login
                    child: Image.asset(
                      'assets/google.png',
                      height: 40,
                    ),
                  ),
                  SizedBox(width: 20),
                  GestureDetector(
                    onTap: () async{
                      const facebookUrl = "https://www.facebook.com";
                    if (await canLaunchUrl(Uri.parse(facebookUrl))) {
                      await launchUrl(Uri.parse(facebookUrl),
                          mode: LaunchMode.externalApplication);
                    } else {
                      print("Could not launch $facebookUrl");
                    }
                    }, // Handle Google Login
                    child: Image.asset(
                      'assets/Group.png',
                      height: 40,
                      
                    ),
                  ),
                  SizedBox(width: 20),
                  GestureDetector(
                    onTap: () async {
                      const facebookUrl = "https://www.linkedin.com";
                    if (await canLaunchUrl(Uri.parse(facebookUrl))) {
                      await launchUrl(Uri.parse(facebookUrl),
                          mode: LaunchMode.externalApplication);
                    } else {
                      print("Could not launch $facebookUrl");
                    }
                    }, // Handle LinkedIn Login
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
    );
  }
}