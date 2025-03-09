import 'package:flutter/material.dart';
import 'package:xelvorth/Features/kyc/kyc.dart';
import 'package:xelvorth/Features/kyc/kyc_screen.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: Color(0xFFF8F8F8), 
    resizeToAvoidBottomInset: false,
    body: SafeArea(
      child: SingleChildScrollView( 
        physics: BouncingScrollPhysics(), 
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20), 
              const Text(
                "Profile",
                style: TextStyle(
                  color: Color.fromARGB(255, 55, 36, 102),
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),

              // ALERT KYC Box
              GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => KycScreen()));
                  },
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.info, color: Colors.red, size: 24),
                        const SizedBox(width: 10),
                        const Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "ALERT",
                                style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                              Text(
                                "Your KYC is not completed",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 55, 36, 102),
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Icon(Icons.arrow_forward_ios,
                            color: Colors.grey, size: 18),
                      ],
                    ),
                  ),
                ),


              const SizedBox(height: 16),

              // Profile Card
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage("assets/profilee.png"),
                    ),
                    const SizedBox(width: 12),
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Roshan",
                            style: TextStyle(
                              color: Color.fromARGB(255, 55, 36, 102),
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "roshan@gmail.com",
                            style: TextStyle(color: Colors.grey, fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                    Icon(Icons.edit, color: Color.fromARGB(255, 55, 36, 102), size: 24),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              // Account Section
              sectionTitle("Account"),
              settingItem(Icons.person, "Account"),
              settingItem(Icons.verified_user, "Privacy"),
              settingItem(Icons.description, "Privacy"),

              // App Settings Section
              sectionTitle("App settings"),
              settingItem(Icons.language, "Language", trailingText: "English"),

              // Others Section
              sectionTitle("Others"),
              settingItem(Icons.info, "About us"),

              const SizedBox(height: 20), // Extra spacing at bottom
            ],
          ),
        ),
      ),
    ),
  );
}

// Section Title
  Widget sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 8),
      child: Text(
        title,
        style: const TextStyle(color: Colors.grey, fontSize: 14, fontWeight: FontWeight.w600),
      ),
    );
  }

  // Setting Item
  Widget settingItem(IconData icon, String title, {String? trailingText}) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
      margin: const EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.black54, size: 22),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.black54,
                fontSize: 16,
              ),
            ),
          ),
          if (trailingText != null)
            Text(trailingText, style: const TextStyle(color: Colors.grey, fontSize: 14)),
          Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 18),
        ],
      ),
    );
  }
}
