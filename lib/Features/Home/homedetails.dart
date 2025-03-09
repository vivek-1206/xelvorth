import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:google_fonts/google_fonts.dart';


import 'package:latlong2/latlong.dart';
import 'package:xelvorth/Features/Home/home1/homescreen1.dart';
import 'package:xelvorth/Features/Home/home2/homescreen2.dart';
import 'package:xelvorth/Features/kyc/cart_screen.dart';
import 'package:xelvorth/Features/mainscreen.dart';

class Homedetails extends StatefulWidget {
  const Homedetails({ Key? key }) : super(key: key);

  @override
  _HomedetailsState createState() => _HomedetailsState();
}

class _HomedetailsState extends State<Homedetails> {
  final MapController _mapController = MapController();
  final double _zoomLevel = 12.0;

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
      body: Stack(
        children: [
          SingleChildScrollView(
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
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Mainscreen()));
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
                            "\$20,000.00 /shares",
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
                        "We are Hostelgeeks, the premium brand awarding hostels to become 5 Star Hostels the premium brand awarding hostels to become 5 Star Hostels...",
                        style: GoogleFonts.poppins(fontSize: 14, color: Colors.grey[600]),
                      ),
                      SizedBox(height: 10),
                      Text("Photos", style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.bold)),
                     SizedBox(
                        height: 100,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount:
                              photoAssets.length, 
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
          height: 200,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                blurRadius: 5,
                spreadRadius: 2,
              ),
            ],
          ),
          child: LineChart(
            LineChartData(
              minX: 0,
              maxX: 3,
              minY: 0,
              maxY: 10,
              titlesData: FlTitlesData(
                leftTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 30,
                    interval: 5,
                    getTitlesWidget: (value, meta) {
                      return Text(
                        value.toInt().toString(),
                        style: GoogleFonts.poppins(fontSize: 12, color: Colors.grey),
                      );
                    },
                  ),
                ),
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 30,
                    getTitlesWidget: (value, meta) {
                      switch (value.toInt()) {
                        case 0:
                          return Text("Sep", style: GoogleFonts.poppins(fontSize: 12));
                        case 1:
                          return Text("Oct", style: GoogleFonts.poppins(fontSize: 12));
                        case 2:
                          return Text("Nov", style: GoogleFonts.poppins(fontSize: 12));
                        case 3:
                          return Text("Dec", style: GoogleFonts.poppins(fontSize: 12));
                        default:
                          return Text("");
                      }
                    },
                  ),
                ),
                topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
              ),
              gridData: FlGridData(
                show: true,
                drawHorizontalLine: true,
                drawVerticalLine: false,
                getDrawingHorizontalLine: (value) {
                  if (value == 5) {
                    return FlLine(color: Colors.grey.withOpacity(0.3), strokeWidth: 2);
                  }
                  return FlLine(color: Colors.grey.withOpacity(0.3), strokeWidth: 1);
                },
              ),
              borderData: FlBorderData(
                show: true,
                border: Border.all(color: Colors.grey.withOpacity(0.3)),
              ),
              lineBarsData: [
                LineChartBarData(
                  spots: [
                    FlSpot(0, 1),
                    FlSpot(0.5, 2),
                    FlSpot(1, 2.5),
                    FlSpot(1.5, 5),
                    FlSpot(2, 5.5),
                    FlSpot(2.5, 8),
                    FlSpot(3, 10),
                  ],
                  isCurved: true,
                  color: Colors.green,
                  barWidth: 3,
                  isStrokeCapRound: true,
                  belowBarData: BarAreaData(
                    show: true,
                    color: Colors.green.withOpacity(0.2),
                  ),
                  dotData: FlDotData(show: true), // ✅ Shows dots at each point
                ),
              ],
              lineTouchData: LineTouchData(
                touchTooltipData: LineTouchTooltipData(
                 // tooltipBgColor: Colors.black87,
                  tooltipRoundedRadius: 8,
                  fitInsideHorizontally: true,
                  fitInsideVertically: true,
                  getTooltipItems: (List<LineBarSpot> touchedSpots) {
                    return touchedSpots.map((spot) {
                      return LineTooltipItem(
                        "\$${(spot.y * 1000).toInt()}",
                        GoogleFonts.poppins(
                            fontSize: 14, color: Colors.white, fontWeight: FontWeight.bold),
                      );
                    }).toList();
                  },
                ),
                touchCallback: (FlTouchEvent event, LineTouchResponse? touchResponse) {
                  if (event is FlTapUpEvent && touchResponse != null) {
                    final touchedSpot = touchResponse.lineBarSpots?.first;
                    if (touchedSpot != null) {
                      print("Touched Spot: X=${touchedSpot.x}, Y=${touchedSpot.y}");
                    }
                  }
                },
                touchSpotThreshold: 10, // ✅ Improves touch accuracy
                handleBuiltInTouches: true, // ✅ Enables touch functionality
              ),
            ),
          ),
              ),
              SizedBox(height: 20,),
          Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {},
                        child: Text("Price Graph"),
                        style: OutlinedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(255, 55, 36, 102),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text("ROI Graph"),
                        style: ElevatedButton.styleFrom(
                          foregroundColor: const Color.fromARGB(255, 55, 36, 102),
                          side: BorderSide(color: const Color.fromARGB(255, 55, 36, 102)),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                        ),
                      ),
                    ),
                  ],
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
                          color: const Color.fromARGB(255, 55, 36, 102),
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
                                fontWeight: FontWeight.w500,
                                color: const Color.fromARGB(255, 55, 36, 102)),
                          ),
                          Text(
                            "2 Investors",
                            style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey[600]),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                   Text("Key Points", style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.bold)),
                    
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
                       Text("Location", style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.bold)),
                        SizedBox(height: 10),
             Container(
              height: 300,
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.4),
                    blurRadius: 8, // Smooth shadow effect
                    spreadRadius: 3,
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: FlutterMap(
                  mapController: _mapController,
                  options: MapOptions(
                    initialCenter: LatLng(17.3850, 78.4867), 
                    initialZoom: _zoomLevel,
                  ),
                  children: [
                    TileLayer(
                      urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                      subdomains: ['a', 'b', 'c'],
                    ),
                     MarkerLayer(
                      markers: [
                        Marker(
                          point: LatLng(17.3850, 78.4867), 
                          width: 40,
                          height: 40,
                          child: Icon(Icons.location_pin, color: const Color.fromARGB(255, 55, 36, 102), size: 40),
                        ),
                      ],
                    ),
                  ],
                ),
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
                  mainAxisSize: MainAxisSize.min,
                   
                  children: [
                    Row(
                      children: [
                        // Title
                        Expanded(
                          child: Text(
                            "Top Investor",
                            style: GoogleFonts.poppins(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                      
                        GestureDetector(
                          onTap: () {
                            
                          },
                          child: CircleAvatar(
                            radius: 18, 
                            backgroundColor: const Color.fromARGB(255, 55, 36, 102),
                            child: Icon(Icons.arrow_back_ios_new, size: 18, color: Colors.white),
                          ),
                        ),
                        SizedBox(width: 25), 
                       
                        GestureDetector(
                          onTap: () {
                            
                          },
                          child: CircleAvatar(
                            radius: 18, 
                            backgroundColor: const Color.fromARGB(255, 55, 36, 102),
                            child: Icon(Icons.arrow_forward_ios, size: 18, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        
                       Container(
                          width: 90,
                          height: 80,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            
                            color: const Color.fromARGB(255, 13, 96, 159),
                          ),
                          child: Text(
                            "BlackRock", // First letter or initials
                            style: GoogleFonts.poppins(
                                fontSize: 13, fontWeight: FontWeight.bold, color: Colors.white),
                          ),
                        ),
                        SizedBox(width: 12),
                     
                        
                       
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              
                              SizedBox(height: 5),
                              Text(
                                "BlackRock",
                                style: GoogleFonts.poppins(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Joined 1 month ago",
                                style: GoogleFonts.poppins(
                                    fontSize: 14, color: Colors.black54),
                              ),
                              SizedBox(height: 20),
                              Row(
                                children: [
                                  Icon(Icons.apartment, size: 16, color: const Color.fromARGB(255, 55, 36, 102)),
                                  SizedBox(width: 4),
                                  Text("4 Properties",
                                      style: GoogleFonts.poppins(
                                          fontSize: 14, color: Colors.black54)),
                                  SizedBox(width: 8),
                                  Icon(Icons.location_on, size: 16, color: const Color.fromARGB(255, 55, 36, 102)),
                                  SizedBox(width: 4),
                                  Text("India",
                                      style: GoogleFonts.poppins(
                                          fontSize: 14, color: Colors.black54)),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            
          
                      SizedBox(height: 20),
                      Text("Documents", style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.bold)),
                Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  3, // Generates 3 list items
                  (index) => Column(
                    children: [
                      DecoratedBox(
                        decoration: BoxDecoration(
                          border: Border.all(color: Color.fromARGB(255, 55, 36, 102), width: 1), // Add border
                          borderRadius: BorderRadius.circular(10), // Rounded edges
                        ),
                        child: ListTile(
                          leading: Icon(Icons.picture_as_pdf, color: Color.fromARGB(255, 55, 36, 102)),
                          title: Text(
                            "Investor Memo - Sky Garden",
                            style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w500,color:Color.fromARGB(255, 55, 36, 102) ),
                          ),
                          trailing: Icon(Icons.arrow_forward_ios, size: 16),
                        ),
                      ),
                      SizedBox(height: 8), // Space between each list item
                    ],
                  ),
                ),
              ),
            
            
            
                      SizedBox(height: 100),
                    ],
                  ),
                ),
              ],
            ),
            
          ),
           Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.shade300, blurRadius: 5, spreadRadius: 2),
                ],
              ),
              child: Row(
                children: [
                  /// AMOUNT BOX
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Amount",
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              color: Colors.grey[600],
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            "\$20,000.00",
                            style: GoogleFonts.poppins(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 55, 36, 102),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 10),

                  /// INVEST BUTTON
                 ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 55, 36, 102),
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(12), 
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 20),
                      minimumSize: const Size(
                          200, 60),
                      elevation: 4, 
                    ),
                    onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => CartScreen()));},
                    child: Text(
                      "Invest Now",
                      style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget detailCard(String value, String label) {
  return Container(
    padding: EdgeInsets.all(12),
    decoration: BoxDecoration(
      color: Color.fromARGB(255, 55, 36, 102),
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
          style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w500,color: Colors.white),
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
          style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w500, color: Color.fromARGB(255, 55, 36, 102)),
        ),
      ],
    ),
  );
}


