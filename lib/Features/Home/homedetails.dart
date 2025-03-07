import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Homedetails extends StatefulWidget {
  const Homedetails({ Key? key }) : super(key: key);

  @override
  _HomedetailsState createState() => _HomedetailsState();
}

class _HomedetailsState extends State<Homedetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Image.asset('assets/luxuryroom.png', height: 250, width: double.infinity, fit: BoxFit.cover),
                Positioned(
                  top: 20,
                  left: 10,
                  child: IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () {},
                  ),
                ),
                Positioned(
                  top: 20,
                  right: 10,
                  child: Icon(Icons.favorite_border, color: Colors.white),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Luxury Condominiums",
                    style: GoogleFonts.poppins(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "\$20,000.00 /share",
                    style: GoogleFonts.poppins(fontSize: 18, color: Colors.deepPurple),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "We are Hostelgeeks, the premium brand awarding hostels to become 5 Star Hostels...",
                    style: GoogleFonts.poppins(fontSize: 14, color: Colors.grey[600]),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      for (var i = 0; i < 3; i++)
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset('assets/room$i.jpg', height: 60, width: 60, fit: BoxFit.cover),
                        ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Text("Graph", style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.bold)),
                  Container(
                    height: 150,
                    width: double.infinity,
                    color: Colors.grey[200],
                    child: Center(child: Text("Graph Placeholder")),
                  ),
                  SizedBox(height: 20),
                  Text("Property Details", style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.bold)),
                  LinearProgressIndicator(value: 0.78, backgroundColor: Colors.grey[300], color: Colors.deepPurple),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      detailCard("2000", "Total Volume"),
                      detailCard("3 Times", "Each Share"),
                      detailCard("20", "Total Installments"),
                    ],
                  ),
                  SizedBox(height: 20),
                  Text("Investment Details", style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.bold)),
                  detailTile("Investment Type", "Installment"),
                  detailTile("Profit", "\$5,000.00"),
                  detailTile("Initial Invest Amount", "\$5,000.00"),
                  detailTile("Per Installment Amount", "\$1,000.00"),
                  detailTile("Installment Schedule", "Monthly"),
                  detailTile("Capital Back", "No"),
                  SizedBox(height: 20),
                  Text("Top Investor", style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.bold)),
                  ListTile(
                    leading: CircleAvatar(backgroundImage: AssetImage('assets/blackrock.png')),
                    title: Text("BlackRock", style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.bold)),
                    subtitle: Text("4 Properties - India"),
                  ),
                  SizedBox(height: 20),
                  Text("Documents", style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.bold)),
                  for (var i = 0; i < 3; i++)
                    ListTile(
                      leading: Icon(Icons.picture_as_pdf, color: Colors.deepPurple),
                      title: Text("Investor Memo - Sky Garden"),
                      trailing: Icon(Icons.arrow_forward_ios, size: 16),
                    ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget detailCard(String value, String label) {
    return Expanded(
      child: Column(
        children: [
          Text(value, style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.bold)),
          Text(label, style: GoogleFonts.poppins(fontSize: 12, color: Colors.grey)),
        ],
      ),
    );
  }

  Widget detailTile(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: GoogleFonts.poppins(fontSize: 14, color: Colors.grey[700])),
          Text(value, style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
