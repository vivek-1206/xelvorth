import 'package:flutter/material.dart';
import 'package:xelvorth/Features/Home/homedetails.dart';
import 'package:xelvorth/Features/Home/homedetails2.dart';
import 'package:xelvorth/Features/Home/homedetails3.dart';
import 'package:xelvorth/Features/Home/homedetails4.dart';
import 'package:xelvorth/Features/Home/notifications.dart';

class Homescreen1 extends StatefulWidget {
  const Homescreen1({Key? key}) : super(key: key);

  @override
  _Homescreen1State createState() => _Homescreen1State();
}

class _Homescreen1State extends State<Homescreen1> {
  int selectedCategory = 0;
  int selectedFilter = 0;
  List<String> categories = ["All", "Shortlisted", "Invested"];
  List<String> filters = ["ALL","Land", "Energy","Automobiles"];
  Set<int> favoriteIndices = {};

  final List<Map<String, dynamic>> properties = [
    {
      "name": "Luxury Villa",
      "image": "assets/luxuryroom.png",
      "category": "Land",
      "progress": 0.85,
      "value": "\$500,000.00",
      "pricePerShare": "\$5,000.00",
      "navigation": Homedetails2(),
      "location": "IND/MH/Mumbai",
      "return": "10.25%"
    },
    {
      "name": "Solar Energy Project",
      "image": "assets/solar.png",
      "category": "Energy",
      "progress": 0.90,
      "value": "\$130,800.00",
      "pricePerShare": "\$2,000.00",
      "navigation": Homedetails3(),
      "location": "IND/Hyd/Shamshabad",
      "return": "12.51%"
    },
    {
      "name": "Luxury Villa",
      "image": "assets/Rectangle 4241.png",
      "category": "Land",
      "progress": 0.85,
      "value": "\$500,000.00",
      "pricePerShare": "\$5,000.00",
      "navigation": Homedetails(),
      "location": "IND/MH/Mumbai",
      "return": "10.25%"
    },
    {
      "name": "Luxury Villa",
      "image": "assets/rooms.png",
      "category": "Land",
      "progress": 0.85,
      "value": "\$500,000.00",
      "pricePerShare": "\$5,000.00",
      "navigation": Homedetails(),
      "location": "IND/Hyd/Warangal",
      "return": "10.25%"
    },
    {
      
      "name": "Electric Car Investment",
      "image": "assets/image.png",
      "category": "Automobiles",
      "progress": 0.65,
      "value": "\$250,000.00",
      "pricePerShare": "\$2,500.00",
      "navigation": Homedetails4(),
      "location": "IND/Hyd/Hitech",
      "return": "8.75%"
    },
    {
      "name": "Luxury Villa",
      "image": "assets/rooms.png",
      "return": "10.25%",
      "category": "Land",
      "progress": 0.85,
      "value": "\$500,000.00",
      "pricePerShare": "\$5,000.00",
      "navigation": Homedetails(),
      "location": "IND/MH/Mumbai",
    },
    
  ];
  List<Map<String, dynamic>> getFilteredProperties() {
    if (selectedFilter == 0) return properties;
    String selectedCategoryName = filters[selectedFilter];
    return properties.where((p) => p["category"] == selectedCategoryName).toList();
  }
  

  void showFilterSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Filter",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      filterOption("ALL", 0),
                      SizedBox(width: 12),
                      filterOption("Lands", 1),
                    ],
                  ),
                  SizedBox(height: 12),
                   Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      filterOption("Automobiles", 2),
                      SizedBox(width: 12),
                      filterOption("Energy", 3),
                    ],
                  ),
                 
                  SizedBox(height: 20),
                ],
              ),
            ),
            Positioned(
              top: -30,
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

  Widget filterOption(String label, int index) {
    bool isSelected = selectedFilter == index;
    return SizedBox(
      width: 150,
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedFilter = index;
          });
          Navigator.pop(context);
        },
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: isSelected
                ? const Color.fromARGB(255, 55, 36, 102)
                : Colors.white,
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
              color: isSelected
                  ? Colors.white
                  : const Color.fromARGB(255, 55, 36, 102),
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
    List<Map<String, dynamic>> filteredProperties = getFilteredProperties();
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text("Hello, Roshan",
            style: TextStyle(
                fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black)),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications, color: Color.fromARGB(255, 42, 26, 70)),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Notifications()));
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
                    borderRadius: BorderRadius.circular(30), borderSide: BorderSide.none),
                suffixIcon: IconButton(
                  icon: Icon(Icons.tune, color: Color.fromARGB(255, 55, 36, 102)),
                  onPressed: showFilterSheet,
                ),
              ),
            ),
            SizedBox(height: 20),
            Text("Categories",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
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
                      color: selectedCategory == index
                          ? Color.fromARGB(255, 55, 36, 102)
                          : Colors.white,
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
            SizedBox(height: 20,width: 30),
            Expanded(
              child: ListView.builder(
                 shrinkWrap: true,
                physics: BouncingScrollPhysics(),
               itemCount: filteredProperties.length,
                itemBuilder: (context, index) {
                  final property = filteredProperties[index];

            return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => property["navigation"]));
              },
              child: Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.asset(
                              property["image"]!,
                             width: property["category"] == "Automobiles" ? 60 : 80,
                              height: 100,
                              fit: BoxFit.cover,
                            ),
                          ),
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
                                  Text(property["location"],
                                      style: TextStyle(color: Colors.white, fontSize: 12)),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 10),

                          if (index == 0)
                            Positioned.fill(
                              child: Align(
                                alignment: Alignment.center,
                                child: Container(
                                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                  decoration: BoxDecoration(
                                    color: Colors.grey.withOpacity(0.8),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Text(
                                    "UPCOMING",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 7,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),

                      SizedBox(width: 15),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              property["name"],
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(height: 5),
                            Row(
                              children: [
                                Text("Total Value: ${property["value"]}",
                                    style: TextStyle(color: Colors.grey, fontSize: 13)),
                                Spacer(),
                                Text("${(property["progress"] * 100).toInt()}%",
                                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13))
                              ],
                            ),
                            SizedBox(height: 5),
                            LinearProgressIndicator(
                              value: property["progress"],
                              backgroundColor: Colors.grey[300],
                              color: const Color.fromARGB(255, 55, 36, 102),
                              minHeight: 5,
                            ),
                            SizedBox(height: 10),

                            /// *Return & Category Tags*
                            Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                                  decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(Icons.trending_up, color: Colors.white, size: 16),
                                      SizedBox(width: 5),
                                      Text(property["return"],
                                          style: TextStyle(color: Colors.white, fontSize: 12)),
                                    ],
                                  ),
                                ),
                                SizedBox(width: 10),
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                                  decoration: BoxDecoration(
                                    color: const Color.fromARGB(255, 55, 36, 102),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(Icons.flash_on, color: Colors.white, size: 14),
                                      SizedBox(width: 5),
                                      Text(property["category"],
                                          style: TextStyle(color: Colors.white, fontSize: 12)),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10),

                            /// *Price per Share*
                            RichText(
                              text: TextSpan(
                                text: "${property["pricePerShare"]} ",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Colors.black),
                                children: [
                                  TextSpan(
                                    text: "/share upto",
                                    style: TextStyle(fontSize: 12, color: Colors.grey),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      /// *Favorite Icon*
                      IconButton(
                        icon: Icon(
                          favoriteIndices.contains(index)
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: favoriteIndices.contains(index) ? Colors.red : Colors.grey,
                          size: 32,
                        ),
                        onPressed: () {
                          setState(() {
                            if (favoriteIndices.contains(index)) {
                              favoriteIndices.remove(index);
                            } else {
                              favoriteIndices.add(index);
                            }
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
        ),
          ]
      ),
    ),);
  }
}
