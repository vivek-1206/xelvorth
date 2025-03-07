import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:xelvorth/Features/Home/notifications.dart';

class Homedetails extends StatefulWidget {
  const Homedetails({ Key? key }) : super(key: key);

  @override
  _HomedetailsState createState() => _HomedetailsState();
}

class _HomedetailsState extends State<Homedetails> {
  List<String> photoAssets = [
  'assets/Detailphoto1.png',
  'assets/Detailsphoto2.png',
  'assets/Detailsphoto3.png',
  'assets/Detailphoto1.png',
  'assets/Detailsphoto2.png',
  'assets/Detailsphoto3.png',
];
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
                    onPressed: () {
                      // Navigator.push(context, MaterialPageRoute(builder: (context) => Notifications()));
                    },
                  ),
                ),
                Positioned(
                  top: 20,
                  right: 10,
                  child: Icon(Icons.favorite_border, color: Colors.white),
                ),
                Positioned(
                  bottom: 20,
                  left: 16,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Luxury Condominiums",
                        style: GoogleFonts.poppins(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "\$20,000.00 /share",
                        style: GoogleFonts.poppins(fontSize: 18, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Description", style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.bold)),
                  SizedBox(height: 2),
                  Text(
                    "We are Hostelgeeks, the premium brand awarding hostels to become 5 Star Hostels...",
                    style: GoogleFonts.poppins(fontSize: 14, color: Colors.grey[600]),
                  ),
                  SizedBox(height: 10),
                  Text("Photos", style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.bold)),
                 SizedBox(
                    height: 100,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount:
                          photoAssets.length, // Use the length of the list
                      itemBuilder: (context, i) {
                        return Padding(
                          padding: EdgeInsets.only(right: 8.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(photoAssets[i],
                                height: 100, width: 100, fit: BoxFit.cover),
                          ),
                        );
                      },
                    ),
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
                   Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          blurRadius: 5,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        detailTile("Total No. Shares", "1,00,000"),
                        detailTile("Lock in Period",icon: Icons.info_outline, "1-3 Years"),
                        detailTile("ROE", "10.42%"),
                        detailTile("Per Month Return", "\$1,000.00"),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Text("Property Details", style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.bold)),
                 // Progress Indicator
               ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: LinearProgressIndicator(
                      value: 0.78,
                      backgroundColor: Colors.grey[300],
                      color: Colors.deepPurple,
                      minHeight: 10,
                    ),
                  ),
                  SizedBox(height: 5), // Adjust spacing


                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "78% Funded",
                        style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.deepPurple),
                      ),
                      Text(
                        "2 Investors",
                        style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[600]),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),

                  SizedBox(height: 10),
                 SizedBox(
                    height: 100, 
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          detailCard("2000", "Total Volume"),
                          SizedBox(width: 10), 
                          detailCard("3 Times", "Each Share"),
                          SizedBox(width: 10),
                          detailCard("20", "Total Installments"),
                          
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: 10),
                  Text("Details", style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.bold)),
                  SizedBox(height: 10),
                   Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          blurRadius: 5,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        detailTile("Investment Type", "Installment"),
                        detailTile("Profit", "\$5,000.00"),
                        detailTile("Initial Invest Amount", "\$5,000.00"),
                        detailTile("Per Installment Amount", "\$1,000.00"),
                        detailTile("Installment Schedule", "Monthly"),
                        detailTile("Installment Late Fee","\$100.00" ),
                        detailTile("Profit Schedule", "Profit Schedule"),
                        detailTile("Capital Back", "No"),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          blurRadius: 5,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Top Investor",
                          style: GoogleFonts.poppins(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 10),
                        ListTile(
                          leading: CircleAvatar(
                              backgroundImage:
                                  AssetImage('assets/blackrock.png')),
                          title: Text(
                            "BlackRock",
                            style: GoogleFonts.poppins(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          subtitle: Row(
                            children: [
                              Text("Join 1 month ago",
                                  style: GoogleFonts.poppins(
                                      fontSize: 14, color: Colors.black54)),
                            ],
                          ),
                          
                        ),
                       Row(
                            children: [
                              Icon(Icons.apartment,
                                  size: 16,
                                  color: Colors.deepPurple), // Building icon
                              SizedBox(width: 4),
                              Text("4 Properties",
                                  style: GoogleFonts.poppins(
                                      fontSize: 14, color: Colors.black54)),
                              SizedBox(width: 8),
                              Icon(Icons.location_on,
                                  size: 16,
                                  color: Colors.deepPurple), // Location icon
                              SizedBox(width: 4),
                              Text("India",
                                  style: GoogleFonts.poppins(
                                      fontSize: 14, color: Colors.black54)),
                            ],
                          ),
                      ],
                    ),
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
}

Widget detailCard(String value, String label) {
  return Container(
    padding: EdgeInsets.all(12),
    decoration: BoxDecoration(
      color: Colors.deepPurple,
      borderRadius: BorderRadius.circular(10),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.2),
          blurRadius: 5,
          spreadRadius: 2,
          offset: Offset(0, 3),
        ),
      ],
    ),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          value,
          style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.bold,color: Colors.white),
        ),
        SizedBox(height: 4),
        Text(
          label,
          style: GoogleFonts.poppins(fontSize: 14, color: const Color.fromARGB(255, 255, 255, 255)),
          textAlign: TextAlign.center,
        ),
      ],
    ),
  );
}

Widget detailTile(String title, String value, {IconData? icon}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 4.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text(
              title,
              style: GoogleFonts.poppins(fontSize: 16, color: Colors.black54),
            ),
            if (icon != null) // Add an icon if provided
              Padding(
                padding: const EdgeInsets.only(left: 4.0),
                child: Icon(icon, size: 16, color: Colors.grey),
              ),
          ],
        ),
        Text(
          value,
          style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.deepPurple),
        ),
      ],
    ),
  );
}


