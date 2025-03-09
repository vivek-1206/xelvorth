import 'package:flutter/material.dart';
import 'package:xelvorth/Features/mainscreen.dart';
import 'package:xelvorth/Features/profile/profile.dart';



class Kyc extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Placeholder for the illustration (Replace with actual image)
            Image.asset(
              'assets/Rectangle 10.png', // Replace with your actual asset path
              height: 250,
            ),
            const SizedBox(height: 20),
            
            // Title
            const Text(
              "KYC BEING VERIFIED",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xFF4B367C),
              ),
            ),
            const SizedBox(height: 10),
            
            // Description
            const Text(
              "The KYC review process will take approximately 2-3 days to complete. Please wait for further updates on your application.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 30),
            
            // Done Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Mainscreen()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF4B367C), // Button color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 15),
                ),
                child: const Text(
                  "Done",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
