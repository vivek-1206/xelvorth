import 'package:flutter/material.dart';
import 'package:xelvorth/Features/mainscreen.dart';

class WithdrawScreen extends StatefulWidget {
  @override
  _WithdrawScreenState createState() => _WithdrawScreenState();
}

class _WithdrawScreenState extends State<WithdrawScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _ifscController = TextEditingController();
  final TextEditingController _holderNameController = TextEditingController();
  final TextEditingController _accountNumberController = TextEditingController();
  final TextEditingController _bankNameController = TextEditingController();
  double _withdrawCharges = 0.00;

  void _calculateCharges(String amount) {
    double parsedAmount = double.tryParse(amount) ?? 0.0;
    setState(() {
      _withdrawCharges = parsedAmount * 0.02; // Assuming 2% charge on withdrawal
    });
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Withdrawal Successful!'),
          backgroundColor: Colors.green,
        ),
      );
      Navigator.push(context, MaterialPageRoute(builder: (context) => Mainscreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 50),
              Text(
                'Withdraw',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Gellix',
                  color: Color.fromARGB(255, 55, 36, 102),
                ),
              ),
              SizedBox(height: 30),
              Expanded(
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildLabeledTextField('Withdraw Amount', 'Enter Withdraw Amount', _amountController, TextInputType.number, _calculateCharges),
                        SizedBox(height: 8),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: RichText(
                            text: TextSpan(
                              text: 'Withdraw Charges: ',
                              style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600, fontFamily: 'Gellix'),
                              children: [
                                TextSpan(
                                  text: '₹${_withdrawCharges.toStringAsFixed(2)}',
                                  style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 8),
                        _buildLabeledTextField('Bank IFSC', 'Enter your IFSC code', _ifscController, TextInputType.text),
                        SizedBox(height: 8),
                        _buildLabeledTextField('Account Holder Name', 'Enter your Account Holder Name', _holderNameController, TextInputType.text),
                        SizedBox(height: 8),
                        _buildLabeledTextField('Bank Account Number', 'Enter your Bank Account Number', _accountNumberController, TextInputType.number),
                        SizedBox(height: 8),
                        _buildLabeledTextField('Bank Name', 'Enter your Bank Name', _bankNameController, TextInputType.text),
                        SizedBox(height: 16),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: _submitForm,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 55, 36, 102),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  child: Text('Withdraw', style: TextStyle(fontSize: 18, color: Colors.white)),
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLabeledTextField(String label, String hint, TextEditingController controller, TextInputType keyboardType, [Function(String)? onChanged]) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 16, 
            fontWeight: FontWeight.w600, 
            fontFamily: 'Gellix', 
            color: Colors.black54),
        ),
        SizedBox(height: 4),
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(
              fontSize: 16, 
              fontWeight: FontWeight.w600, 
              fontFamily: 'Gellix', 
              color: Colors.black45),
            filled: true,
            fillColor: Color(0xFFF1F1F1),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
            ),
          ),
          style: TextStyle(
            fontSize: 16, 
            fontWeight: FontWeight.w600, 
            fontFamily: 'Gellix', 
            color: Colors.black),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter ${label.toLowerCase()}';
            }
            return null;
          },
          onChanged: onChanged,
        ),
      ],
    );
  }
}