import 'package:flutter/material.dart';
import 'package:xelvorth/Features/Home/homedetails.dart';
import 'package:xelvorth/Features/Home/homedetails2.dart';
import 'package:xelvorth/Features/Home/notifications.dart';

class Homescreen1 extends StatefulWidget {
  const Homescreen1({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _RealEstateScreenState createState() => _RealEstateScreenState();
}

class _RealEstateScreenState extends State<Homescreen1> {
  int selectedCategory = 0;
  List<String> categories = ["All", "Shortlisted", "Invested"];
  int selectedFilter = 0; 
  List<String> filters = ["Land", "Automobiles", "Energy"];

void showFilterSheet() {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true, // Makes the sheet full width
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) {
      return Stack(
        clipBehavior: Clip.none, // Allows button to be positioned outside
        children: [
          /// The Bottom Sheet UI
          Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                /// Title
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Filter",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 20),

                /// First Row: Land & Automobiles
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    filterOption("Land", 0),
                    SizedBox(width: 12),
                    filterOption("Automobiles", 1),
                  ],
                ),
                SizedBox(height: 12),

                /// Second Row: Energy (Centered)
                Align(
                  alignment: Alignment.center,
                  child: filterOption("Energy", 2),
                ),

                SizedBox(height: 20),
              ],
            ),
          ),

          /// Close Button Positioned Outside the Sheet
          Positioned(
            top: -30, // Move it above the sheet
            left: 0,
            right: 0,
            child: Center(
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 22,
                  child: Icon(Icons.close, color: Colors.black, size: 24),
                ),
              ),
            ),
          ),
        ],
      );
    },
  );
}

/// Custom Filter Option Widget
Widget filterOption(String label, int index) {
  bool isSelected = selectedFilter == index;
  return SizedBox(
    width: 150, // Ensuring all buttons have the same width
    child: GestureDetector(
      onTap: () {
        setState(() {
          selectedFilter = index;
        });
        Navigator.pop(context); // Close on selection
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? const Color.fromARGB(255, 55, 36, 102) : Colors.white,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
            color: const Color.fromARGB(255, 55, 36, 102),
            width: 2,
          ),
        ),
        alignment: Alignment.center,
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : const Color.fromARGB(255, 55, 36, 102),
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ),
  );
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text("Hello, Roshan",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black)),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications, color: Color.fromARGB(255, 42, 26, 70)),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => Notifications()));
            },
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: "Search the property",
                prefixIcon: Icon(Icons.search),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none),
                suffixIcon: IconButton(
                  icon: Icon(Icons.tune, color: const Color.fromARGB(255, 55, 36, 102),),
                  onPressed:  showFilterSheet,
                ),
              ),
            ),
            SizedBox(height: 20),
            Text("Categories", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(categories.length, (index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedCategory = index;
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    decoration: BoxDecoration(
                      color: selectedCategory == index ? const Color.fromARGB(255, 55, 36, 102) : Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      categories[index],
                      style: TextStyle(
                        color: selectedCategory == index ? Colors.white : Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              }),
            ),
            SizedBox(height: 20),
       Expanded(
  child: ListView.builder(
    itemCount: 3,
    itemBuilder: (context, index) {
      bool isFavorite = false;

      return GestureDetector(
        onTap: () {
          // Navigate to different screens based on index
          switch (index) {
            case 0:
              Navigator.push(context, MaterialPageRoute(builder: (context) => Homedetails2()));
              break;
            case 1:
              Navigator.push(context, MaterialPageRoute(builder: (context) => Homedetails()));
              break;
            case 2:
              Navigator.push(context, MaterialPageRoute(builder: (context) => Homedetails()));
              break;
          }
        },
        child: Card(
          color: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          margin: EdgeInsets.symmetric(vertical: 10),
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              children: [
                /// **Image Stack**
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        "assets/image35.png",
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                    ),

                    /// **Location Tag**
                    Positioned(
                      top: 8,
                      left: 8,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.black54,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.location_on, color: Colors.white, size: 14),
                            SizedBox(width: 4),
                            Text(
                              'IND/WB/KOL',
                              style: TextStyle(color: Colors.white, fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                    ),

                    /// **Upcoming Tag (Centered Only for First Item)**
                    if (index == 0)
                      Positioned.fill(
                        child: Align(
                          alignment: Alignment.center,
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                            decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.8), // Slight transparency
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              "Upcoming",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
                
                SizedBox(width: 10),

                /// **Details Column**
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Luxury Condominium", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                      SizedBox(height: 5),
                      Text("Total Value: \$130,800.00", style: TextStyle(color: Colors.grey)),
                      SizedBox(height: 5),
                      LinearProgressIndicator(value: 0.9, color: const Color.fromARGB(255, 55, 36, 102)),
                      SizedBox(height: 5),

                      /// **Tags (Return & Energy)**
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text("~12.51%", style: TextStyle(color: Colors.white)),
                          ),
                          SizedBox(width: 10),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 18, vertical: 4),
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 55, 36, 102),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text("Energy", style: TextStyle(color: Colors.white)),
                          ),
                        ],
                      ),
                      SizedBox(height: 5),

                      /// **Price per Share**
                      Text("\$2,000.00 /share", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue)),
                    ],
                  ),
                ),

                /// **Favorite Icon**
                IconButton(
                  icon: Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: isFavorite ? Colors.red : Colors.grey,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      );
    },
  ),
),


          ],
        ),
      ),
    );
  }
}