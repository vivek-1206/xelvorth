import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class OtpInput extends StatelessWidget {
  final TextEditingController controller;
  final Function(String) onCompleted;

  const OtpInput({Key? key, required this.controller, required this.onCompleted}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // **Label for OTP Input**
        Text(
          "Enter your OTP",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black87),
        ),
        SizedBox(height: 8),

        // **OTP Input Field with Equal Spacing**
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween, // ✅ Equal Spacing
          children: List.generate(5, (index) => 
            Container(
              width: 50,
              height: 50,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black26),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Pinput(
                length: 1, // ✅ One digit per box
                controller: controller,
                onCompleted: onCompleted,
                defaultPinTheme: PinTheme(
                  width: 50,
                  height: 50,
                  textStyle: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black26),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                focusedPinTheme: PinTheme(
                  width: 50,
                  height: 50,
                  textStyle: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.purple),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
