import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class Homescreen2 extends StatefulWidget {
  @override
  _InvestmentScreenState createState() => _InvestmentScreenState();
}

class _InvestmentScreenState extends State<Homescreen2> {
  double lockInPeriod = 2.5;
  int stocksToBuy = 5;
  double pricePerShare = 20000.0;

  @override
  Widget build(BuildContext context) {
    double totalAmount = stocksToBuy * pricePerShare;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Back Button
              IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.black),
                onPressed: () => Navigator.pop(context),
              ),
              SizedBox(height: 10),

              // Stock Price Graph
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
              SizedBox(height: 10),

              // Price Label
              Text(
                "Luxury Condominiums",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                "\$20,000.00 /shares",
                style: TextStyle(fontSize: 22, 
                fontWeight: FontWeight.bold, color:Color.fromARGB(255, 42, 26,70)),
              ),
              SizedBox(height: 20),

              // Lock-In Period
              Text(
                "Select Lock In Period",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  Expanded(
                    child: Slider(
                      value: lockInPeriod,
                      min: 1,
                      max: 3,
                      divisions: 10,
                      activeColor: Color.fromARGB(255, 57, 31, 104),
                      inactiveColor: Colors.grey,
                      onChanged: (value) {
                        setState(() {
                          lockInPeriod = value;
                        });
                      },
                    ),
                  ),
                  SizedBox(width: 10),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      border: Border.all(color:Color.fromARGB(255, 42, 26,70)),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      lockInPeriod.toStringAsFixed(1),
                      style: TextStyle(fontSize: 16, 
                      fontWeight: FontWeight.bold, color: Color.fromARGB(255, 42, 26,70)),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),

              // Quantity and Price
              Text(
                "Quantity and Price",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Stocks to buy
                  Row(
                    children: [
                      _quantityButton("-", () {
                        setState(() {
                          if (stocksToBuy > 1) stocksToBuy--;
                        });
                      }),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          "$stocksToBuy",
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                      _quantityButton("+", () {
                        setState(() {
                          stocksToBuy++;
                        });
                      }),
                    ],
                  ),

                  // Total Amount
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      border: Border.all(color: Color.fromARGB(255, 42, 26,70)),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      "\$${totalAmount.toStringAsFixed(2)}",
                      style: TextStyle(fontSize: 16, 
                      fontWeight: FontWeight.bold, color: Color.fromARGB(255, 42, 26,70)),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 40),

              // Buy Button
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: EdgeInsets.symmetric(horizontal: 100, vertical: 16),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  onPressed: () {
                    // Implement buy functionality
                  },
                  child: Text("Buy", style: TextStyle(fontSize: 18, color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  Widget _quantityButton(String symbol, VoidCallback onPressed) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 42, 26,70),
        padding: EdgeInsets.all(10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      onPressed: onPressed,
      child: Text(symbol, style: TextStyle(fontSize: 20, color: Colors.white)),
    );
  }
}
