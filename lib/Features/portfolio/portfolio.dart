import 'package:flutter/material.dart';
import 'package:xelvorth/Features/portfolio/portfolio1.dart';

class Portfolio extends StatefulWidget {
  const Portfolio({ Key? key }) : super(key: key);

  @override
  _PortfolioState createState() => _PortfolioState();
}

class _PortfolioState extends State<Portfolio> {
 final List<Map<String, dynamic>> holdings = [
    {"title":"Luxury Condominium","current":"\$20,000 ", "roi":" 30% ", "returns": " +\$20,000","color": Colors.green},
    {"title":"Luxury Condominium","current":"\$20,000 ", "roi":" -2% ", "returns": " -\$2,000", "color": Colors.red},
    {"title":"Luxury Condominium","current":"\$20,000 ", "roi":" -2% ", "returns": " -\$4,000", "color": Colors.red},
    {"title":"Luxury Condominium", "current":"\$20,000 ", "roi":" 30% ", "returns": " +\$20,000","color": Colors.green},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 70),
            Text(
              "Portfolio",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: const Color.fromARGB(255, 42, 26, 70)),
            ),
            SizedBox(height: 30),
            Center(
              child: Column(
                children: [
                  Text("Current Value", style: TextStyle(fontSize: 14, color: const Color.fromARGB(255, 42, 26, 70))),
                  Text("\$4,00,000", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: const Color.fromARGB(255, 42, 26, 70))),
                ],
              ),
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InfoCard(title: "Total Investment", value: "\$3,00,000"),
                InfoCard(title: "Total Returns", value: "+ \$1,00,000", textColor: Colors.green),
              ],
            ),
            SizedBox(height: 30),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Portfolio()));
                    },
                    child: Text("My Holdings"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 42, 26, 70),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Portfolio1()));
                    },
                    child: Text("Exited"),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: const Color.fromARGB(255, 42, 26, 70),
                      side: BorderSide(color: const Color.fromARGB(255, 42, 26, 70)),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.sort, color: const Color.fromARGB(255, 237, 233, 233)),
                  label: Text("Sort", style: TextStyle(color: Colors.white)),
                  style: ElevatedButton.styleFrom(backgroundColor: const Color.fromARGB(255, 42, 26, 70)),
                ),
                Text("Current", style: TextStyle(fontWeight: FontWeight.bold)),
                Text("ROI", style: TextStyle(fontWeight: FontWeight.bold)),
                Text("Returns", style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
            
            Expanded(
              child: ListView.builder(
                itemCount: holdings.length,
                itemBuilder: (context, index) {
                  final holding = holdings[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(flex: 3, child: Text(holding["title"])),
                        Expanded(flex: 2, child: Text(holding["current"])),
                        Expanded(flex: 2, child: Text(holding["roi"])),
                        Expanded(flex: 2, child: Text(holding["returns"], style: TextStyle(color: holding["color"]))),
                      ],
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
              icon: Icon(Icons.pie_chart, color: Colors.white),
              label: Text("Portfolio", style: TextStyle(color: Colors.white)),
              style: ElevatedButton.styleFrom(backgroundColor: const Color.fromARGB(255, 42, 26, 70)),
            ),
            IconButton(icon: Icon(Icons.person, color: Colors.grey), onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
class InfoCard extends StatelessWidget {
  final String title;
  final String value;
  final Color textColor;
  InfoCard({required this.title, required this.value, this.textColor = Colors.black});
  @override
  Widget build(BuildContext context) {
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
          Text(value, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: textColor)),
        ],
      ),
    );
  }
}
class PortfolioItem extends StatelessWidget {
  final String title;
  final String current;
  final String roi;
  final String returns;
  final Color color;
  PortfolioItem({required this.title, required this.current, required this.roi, required this.returns, required this.color});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(child: Text(title, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500))),
          Text(current, style: TextStyle(fontSize: 14)),
          Text(roi, style: TextStyle(fontSize: 14, color: color, fontWeight: FontWeight.bold)),
          Text(returns, style: TextStyle(fontSize: 14, color: color, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}