import 'package:flutter/material.dart';
import 'package:xelvorth/Features/portfolio/portfolio.dart';

class Portfolio1 extends StatefulWidget {
  const Portfolio1({ Key? key }) : super(key: key);

  @override
  _Portfolio1State createState() => _Portfolio1State();
}

class _Portfolio1State extends State<Portfolio1> {
   bool isExitedSelected = true;
  String selectedSort = "Land";
  bool isModalOpen = false;

  void _showSortByModal(BuildContext context) {
    setState(() {
      isModalOpen = true;
    });

    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Container(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Sort By", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black.withOpacity(0.7))),
              Divider(),
              _sortOption("Land"),
              _sortOption("Automobile"),
              _sortOption("Energy"),
            ],
          ),
        );
      },
    ).whenComplete(() {
      setState(() {
        isModalOpen = false;
      });
    });
  }

  Widget _sortOption(String option) {
    return ListTile(
      title: Text(option, style: TextStyle(color: Colors.black.withOpacity(0.7))),
      trailing: Radio(
        value: option,
        groupValue: selectedSort,
        onChanged: (value) {
          setState(() {
            selectedSort = value.toString();
          });
          Navigator.pop(context);
        },
      ),
    );
  }
  final List<Map<String, dynamic>> holdings = [
    {"title": "Luxury Condominium", "current": "\$20,000", "roi": "30%", "returns": "+\$20,000", "color": Colors.green},
    {"title": "Luxury Condominium", "current": "\$20,000", "roi": "-2%", "returns": "-\$2,000", "color": Colors.red},
    {"title": "Luxury Condominium", "current": "\$20,000", "roi": "-2%", "returns": "-\$4,000", "color": Colors.red},
    {"title": "Luxury Condominium", "current": "\$20,000", "roi": "30%", "returns": "+\$20,000", "color": Colors.green},
  ];
   void _showBottomSheet(BuildContext context, Map<String, dynamic> holding) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(holding["title"], style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Text("History >", style: TextStyle(color: Color.fromARGB(255, 55, 36, 102), fontWeight: FontWeight.bold)),
                ],
              ),
              SizedBox(height: 5),
              Text(holding["current"], style: TextStyle(fontSize: 16, color: const Color.fromARGB(255, 10, 10, 10))),
              SizedBox(height: 50),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        padding: EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      ),
                      child: Text("Sell", style: TextStyle(color: Colors.white, fontSize: 16)),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        padding: EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      ),
                      child: Text("Buy", style: TextStyle(color: Colors.white, fontSize: 16)),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 40),
            Text(
              "Portfolio",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 55, 36, 102))
            ),
            SizedBox(height: 10),
            Center(
              child: Column(
                children: [
                  Text("Current Value", style: TextStyle(fontSize: 14, color: Colors.grey)),
                  Text("\$4,00,000", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 55, 36,102))),
                ],
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _infoCard("Total Investment", "\$3,00,000"),
                _infoCard("Total Returns", "+ \$1,00,000", Colors.green),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Portfolio()));
                    },
                    child: Text("My Holdings"),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: const Color.fromARGB(255, 55, 36, 102),
                      side: BorderSide(color: const Color.fromARGB(255, 55, 36,102)),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                    ),
                  ),
                ),
                SizedBox(width: 50), 
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Portfolio1()));
                    },
                    child: Text("Exited"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 55, 36,102),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20), 
            SizedBox(width: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.start, 
              children: [
                ElevatedButton.icon(
                  onPressed: () => _showSortByModal(context),
                  icon: Icon(Icons.sort, size: 18, color: const Color.fromARGB(255, 237, 233, 233)), 
                  label: Text("Sort", style: TextStyle(color: Colors.white, fontSize: 14)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 55, 36,102),
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  ),
                ),
                SizedBox(width: 50),
                SizedBox(width: 90, child: Text("Current", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14))),
                SizedBox(width: 90, child: Text("ROI", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14))),
                SizedBox(width: 60, child: Text("Returns", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14))),
              ],
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: holdings.length,
                itemBuilder: (context, index) {
                  final holding = holdings[index];
                  Color roiColor = holding["roi"].contains('2%') ? Colors.red : Colors.green;
                  return GestureDetector(
                    onTap: () => _showBottomSheet(context, holding),
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 8.0),
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 4,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8), 
                        child: Row(
                          children: [
                            Expanded(flex: 3, child: Text(holding["title"], style: TextStyle(fontSize: 14))),
                            Expanded(flex: 2, child: Text(holding["current"], style: TextStyle(fontSize: 14))),
                            Expanded(flex: 2, child: Text(holding["roi"], style: TextStyle(fontSize: 14, color: holding["color"])
                            )),
                            Expanded(
                              flex: 2,
                              child: Text(holding["returns"], 
                                style: TextStyle(fontSize: 14, color: holding["color"])
                              ),
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
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 10,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(icon: Icon(Icons.home, color: Colors.grey), onPressed: () {}),
            IconButton(icon: Icon(Icons.wallet, color: Colors.grey), onPressed: () {}),
            ElevatedButton.icon(
              onPressed: () {},
              icon: Icon(Icons.show_chart, color: Colors.white),
              label: Text("Portfolio", style: TextStyle(color: Colors.white)),
              style: ElevatedButton.styleFrom(backgroundColor: const Color.fromARGB(255, 42, 26, 70)),
            ),
            IconButton(icon: Icon(Icons.person, color: Colors.grey), onPressed: () {}),
          ],
        ),
      ),
    );
  }  
  Widget _infoCard(String title, String value, [Color color = Colors.black]) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.4,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: TextStyle(fontSize: 12, color: Colors.grey)),
          SizedBox(height: 5),
          Text(value, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: color)),
        ],
      ),
    );
  }

  @override
  Widget infoCard(BuildContext context, String title, String value, [Color color = Colors.black]) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.4,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: TextStyle(fontSize: 12, color: Colors.grey)),
          SizedBox(height: 5),
          Text(value, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: color)),
        ],
      ),
    );
  }
}