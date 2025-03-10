import 'package:flutter/material.dart';


class ReturnScreen extends StatelessWidget {
  const ReturnScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Details",
          style: TextStyle(
            color: Color.fromRGBO(55, 36, 102, 1),
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _investmentSummary(),
              const SizedBox(height: 20),
              _specificationSection(),
              const SizedBox(height: 20),
              _historySection(),
              const SizedBox(height: 20),
              _buildBottomButtons(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _investmentSummary() {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                "Inv. Amount",
                style: TextStyle(color: Color.fromRGBO(199, 192, 188, 1), fontSize: 14),
              ),
              Text(
                "Return Amount",
                style: TextStyle(color: Color.fromRGBO(199, 192, 188, 1), fontSize: 14),
              ),
            ],
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                "\$100",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(199, 192, 188, 1)
                ),
              ),
              Icon(Icons.arrow_forward, color: Colors.green),
              Text(
                "\$10000",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(53, 212, 156, 1),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                "Returns (%)",
                style: TextStyle(color: Color.fromRGBO(199, 192, 188, 1), fontSize: 14),
              ),
              Text(
                "1D Returns (%)",
                style: TextStyle(color: Color.fromRGBO(199, 192, 188, 1), fontSize: 14),
              ),
            ],
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                "+17.45%",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(53, 212, 156, 1),
                ),
              ),
              Text(
                "+1.15%",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(53, 212, 156, 1),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

    Widget _specificationSection() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text(
        "Specification",
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
      const SizedBox(height: 10),

      Row(
        children: [
          Expanded(child: _specItem("assets/money-cash-dollar-coin--accounting-billing-payment-cash-coin-currency-money-finance.png", "Inv. Amount", "₹ 100.00", isRightAligned: false)),
          Spacer(),
          Expanded(child: _specItem("assets/money-atm-card-3--deposit-money-payment-finance-atm-withdraw.png", "Total Returns (%)", "+17.45 %", isRightAligned: false)),
        ],
      ),
      const SizedBox(height: 10),

      Row(
        children: [
          Expanded(child: _specItem("assets/time.png", "For Timing", "15 Days", isRightAligned: false)),
          const Spacer(),
          Expanded(child: _specItem("assets/idreturns.png", "1D Returns (%)", "+1.15 %", isRightAligned: false)),
        ],
      ),
      const SizedBox(height: 10),

      Row(
        children: [
          Expanded(child: _specItem("assets/calendar.png", "Return Interval", "Every Day", isRightAligned: false)),
          const Spacer(),
          Expanded(child: _specItem("assets/time.png", "Repeat Time", "90 Times", isRightAligned: false)),
        ],
      ),
    ],
  );
}

Widget _specItem(String iconPath, String title, String value, {bool isRightAligned = false}) {
  return Row(
    children: [
      Image.asset(iconPath, width: 20, height: 20, color: Color.fromRGBO(197, 190, 186, 1)),
      const SizedBox(width: 8),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 14, color: Colors.grey),
          ),
          Text(
            value,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    ],
  );
}





  Widget _historySection() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text(
        "History",
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Color.fromRGBO(0, 0, 0, 1),
        ),
      ),
      const SizedBox(height: 5),
      _historyHeader(),
      // Use a Column instead of a ListView to prevent scrolling
      Column(
        children: [
          _historyItem("266435FDRTE", "30%", "+ \$2,000", "01/01/24"),
          _historyItem("266435FDRTE", "30%", "+ \$2,000", "01/02/24"),
          _historyItem("266435FDRTE", "30%", "+ \$2,000", "01/03/24"),
          _historyItem("266435FDRTE", "30%", "+ \$2,000", "01/04/24"),
        ],
      ),
    ],
  );
}


  Widget _historyHeader() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 15),
    child: Row(
      children: [
        Expanded(
          flex: 2, // More space for TRX
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text("TRX"),
          ),
        ),
        Expanded(
          flex: 2,
          child: Align(
            alignment: Alignment.center,
            child: Padding(padding: const EdgeInsets.only(left: 20),
            child: Text("ROI"),),
            
          ),
        ),
        Expanded(
          flex: 2, 
          child: Align(
            alignment: Alignment.center,
            child: Padding(padding: const EdgeInsets.only(left: 30),
            child: Text("Returns"),),
          ),
        ),
        Expanded(
          flex: 2, // More space for Date
          child: Align(
            alignment: Alignment.centerRight,
            child: Text("Date"),
          ),
        ),
      ],
    ),
  );
}

  Widget _historyItem(String trx, String roi, String returns, String date) {
    return Card(
      color: Color.fromRGBO(255, 255, 255, 1),
      margin: const EdgeInsets.symmetric(vertical: 5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(trx, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
            Text(roi, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.green)),
            Text(returns, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.green)),
            Text(date, style: const TextStyle(fontSize: 14)),
          ],
        ),
      ),
    );
  }


  Widget _buildBottomButtons(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Color.fromRGBO(255, 255, 255, 1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromRGBO(207, 205, 205, 1),
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 25),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              )
            ),
            child: const Text("Sell", style: TextStyle(color: Color.fromRGBO(255, 255, 255, 1))),
          ),
          ElevatedButton(
            onPressed: () => {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromRGBO(103, 199, 101, 1),
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 25),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              )
            ),
            child: const Text("Buy", style: TextStyle(color: Color.fromRGBO(255, 255, 255, 1))),
          ),
        ],
      ),
    );
  }

}
