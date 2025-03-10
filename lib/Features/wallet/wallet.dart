import 'package:flutter/material.dart';
import 'package:xelvorth/Features/withdraw/withdraw.dart';

class WalletScreen extends StatefulWidget {
  @override
  _WalletScreenState createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  bool isDepositSelected = true; // Track selected tab

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Add Payment",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Center(
              child: Column(
                children: const [
                  Text(
                    "Balance",
                    style: TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "\$ 4,00,000",
                    style: TextStyle(
                      color: Color.fromARGB(255, 55, 36, 102),
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(child: buildActionButton(Icons.add, "Deposit", () {})),
                SizedBox(width: 10),
                Expanded(child: buildActionButton(Icons.sync_alt, "Invest", () {})),
                SizedBox(width: 10),
                Expanded(
                    child: buildActionButton(Icons.download, "Withdraw", () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => WithdrawScreen()));
                })),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildTabButton("DEPOSIT", isDepositSelected, () {
                  setState(() {
                    isDepositSelected = true;
                  });
                }),
                const SizedBox(width: 10),
                buildTabButton("WITHDRAW", !isDepositSelected, () {
                  setState(() {
                    isDepositSelected = false;
                  });
                }),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: isDepositSelected
                    ? [
                        buildTransactionCard("Bank", "Pending", Colors.yellow.shade700, "₹5000", "TXN12345"),
                        buildTransactionCard("UPI", "Approved", Colors.green.shade700, "₹2000", "TXN67890"),
                        buildTransactionCard("UPI", "Rejected", Colors.red, "₹1500", "TXN54321"),
                      ]
                    : [
                        buildTransactionCard("Bank Transfer", "Processing", Colors.blue, "₹7000", "TXN98765"),
                        buildTransactionCard("Wallet", "Completed", Colors.green, "₹4500", "TXN45678"),
                        buildTransactionCard("UPI", "Failed", Colors.red, "₹3000", "TXN11223"),
                      ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildActionButton(IconData icon, String label, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap, // Handle tap to navigate
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 55, 36, 102),
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.white, size: 30),
            const SizedBox(height: 8),
            Text(label, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }

  Widget buildTransactionCard(String gateway, String status, Color statusColor, String amount, String txnId) {
    Color textColor = Colors.black54;

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      elevation: 3,
      shadowColor: Colors.grey.shade300,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("TRX\n$txnId", style: TextStyle(color: textColor)),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text("Initiated", style: TextStyle(color: textColor)),
                    Text("24 Mar 2024", style: TextStyle(color: textColor)),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Amount", style: TextStyle(color: textColor)),
                    Text(amount, style: TextStyle(color: textColor)),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text("Gateway", style: TextStyle(color: textColor)),
                    Text(gateway, style: TextStyle(color: textColor)),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Platform Fee\n₹100", style: TextStyle(color: textColor)),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: statusColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(status, style: const TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTabButton(String text, bool isSelected, VoidCallback onTap) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: isSelected ? Color.fromARGB(255, 55, 36, 102) : Colors.white,
            borderRadius: BorderRadius.circular(25),
            border: Border.all(color: Color.fromARGB(255, 55, 36, 102), width: 2),
          ),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                color: isSelected ? Colors.white : Color.fromARGB(255, 55, 36, 102),
              ),
            ),
          ),
        ),
      ),
    );
  }
}