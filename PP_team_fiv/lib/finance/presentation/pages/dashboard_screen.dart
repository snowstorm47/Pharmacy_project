import 'package:clean_a/finance/presentation/pages/invoice_details.dart';
import 'package:flutter/material.dart';

class DashBoardScreenFinance extends StatelessWidget {
  const DashBoardScreenFinance({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Container(color: Colors.grey),
            ),
            Expanded(
              flex: 10,
              child: Invoice_details(),
            ),
          ],
        ),
      ),
    );
  }
}
