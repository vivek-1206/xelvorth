import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:xelvorth/Features/mainscreen.dart';

class Homescreen3  extends StatefulWidget {
  @override
  _InvestmentScreenState createState() => _InvestmentScreenState();
}

class _InvestmentScreenState extends State<Homescreen3> {
  double lockInPeriod = 2.5;
  int stockCount = 5;
  double stockPrice = 20000;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.purple),
          onPressed: () {
            
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Mainscreen()));
                    
          },
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             SizedBox(
                height: 200,
                child: LineChart(
                  LineChartData(
                    titlesData: FlTitlesData(show: false),
                    gridData: FlGridData(show: false),
                    borderData: FlBorderData(show: false),
                    lineBarsData: [
                      LineChartBarData(
                        spots: [
                          FlSpot(0, 1),
                          FlSpot(1, 3),
                          FlSpot(2, 2),
                          FlSpot(3, 5),
                          FlSpot(4, 4),
                          FlSpot(5, 8),
                        ],
                        isCurved: true,
                        color: Colors.green,
                        barWidth: 3,
                        belowBarData: BarAreaData(
                          show: true,
                          // ignore: deprecated_member_use
                          color: Colors.green.withOpacity(0.3),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            SizedBox(height: 20),
            Text(
              "Luxury Condominiums",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.purple),
            ),
            SizedBox(height: 10),
            Text(
              "\$${stockPrice.toStringAsFixed(2)} /shares",
              style: TextStyle(fontSize: 20, color: Colors.purple, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Invested Amount", style: TextStyle(color: Colors.grey)),
                    Text("\$30,000", style: TextStyle(color: Colors.purple, fontWeight: FontWeight.bold)),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("ROI in %", style: TextStyle(color: Colors.grey)),
                    Text("30%", style: TextStyle(color: Colors.purple, fontWeight: FontWeight.bold)),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Profit", style: TextStyle(color: Colors.grey)),
                    Text("\$2,00,000", style: TextStyle(color: Colors.purple, fontWeight: FontWeight.bold)),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),
            Text("Select Lock In Period", style: TextStyle(fontWeight: FontWeight.bold)),
            Slider(
              value: lockInPeriod,
              min: 1,
              max: 3,
              divisions: 10,
              label: lockInPeriod.toStringAsFixed(1),
              onChanged: (value) {
                setState(() {
                  lockInPeriod = value;
                });
              },
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.purple),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(lockInPeriod.toStringAsFixed(1)),
              ),
            ),
            SizedBox(height: 20),
            Text("Quantity and Price", style: TextStyle(fontWeight: FontWeight.bold)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.remove, color: Colors.purple),
                      onPressed: () {
                        setState(() {
                          if (stockCount > 1) stockCount--;
                        });
                      },
                    ),
                    Container(
                      width: 40,
                      child: Text(
                        "$stockCount",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.add, color: Colors.purple),
                      onPressed: () {
                        setState(() {
                          stockCount++;
                        });
                      },
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.purple),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text("\\${(stockCount * stockPrice).toStringAsFixed(0)}"),
                ),
              ],
            ),
            Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                 onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Mainscreen()));
                      },
                child: Text("Sell", style: TextStyle(fontSize: 18)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
