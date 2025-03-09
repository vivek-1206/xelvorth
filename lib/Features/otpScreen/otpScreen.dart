import 'package:flutter/material.dart';
import 'package:xelvorth/Features/ResetPasswordScreen/ResetPasswordScreen.dart';
import 'package:xelvorth/widgets/OtpInput.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final TextEditingController _otpController = TextEditingController();
  final String _correctOtp = "12345"; // ✅ Predefined OTP for local validation

  void _verifyOtp() {
    if (_otpController.text.trim() == _correctOtp) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("✅ OTP Verified Successfully!"), backgroundColor: Colors.green),
        
      );
        Navigator.push(context, MaterialPageRoute(builder: (context) => ResetPasswordScreen()));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("❌ Incorrect OTP! Try Again."), backgroundColor: Colors.red),
      );
      Navigator.push(context, MaterialPageRoute(builder: (context) => ResetPasswordScreen()));
    }
  }

  void _resendOtp() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("📩 OTP Resent!"), duration: Duration(seconds: 2)),
    );
    _otpController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30),
              // **Title**
              Text("OTP Code", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
              SizedBox(height: 20),

              // **OTP Input Field with Label**
              OtpInput(controller: _otpController, onCompleted: (otp) {}),
              SizedBox(height: 20),

              // **Resend OTP**
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: _resendOtp,
                  child: Text("Resend OTP", style: TextStyle(color: const Color.fromARGB(255, 42, 26, 70), fontWeight: FontWeight.bold)),
                ),
              ),

              SizedBox(height: 30),

              // **Verify Button**
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 42, 26, 70),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  onPressed: _verifyOtp,
                  child: Text("Verify", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
