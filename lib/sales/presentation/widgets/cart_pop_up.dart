
import 'package:clean_a/sales/provider/sales_provider.dart';
import 'package:clean_a/shared/services/providers/authProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screen/CreditCustomerSelectionScreen.dart'; // Import your credit customer screen file here

class CartPopup extends StatelessWidget {
  const CartPopup({Key? key});

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<SalesProvider>(context,listen:false);
    final cart = cartProvider.item ?? [];
    final totalPrice = cartProvider.totalPrice.toString();
 if(cart!= null){
    return Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.4,
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Cart Details',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ...cart.map((item) => ListTile(
                          title: Text(item.medicineName),
                          subtitle: Text(
                              'Qty: ${item.quantity}, Price: ${item.price}'),
                        )),
                  ],
                ),
              ),
            ),
            const Divider(),
            const SizedBox(height: 12),
            const Text(
              'Payment Details',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Text('Total Amount: total birr birr'),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () => _processPayment(context, PaymentMethod.Cash),
              child: const Text('Pay in Cash'),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () => _processPayment(context, PaymentMethod.Online),
              child: const Text('Pay Online'),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          CreditCustomerScreen()), // Navigate to CreditCustomerScreen
                );
              },
              child: const Text('Credit Customer (Company Pays)'),
            ),
            const SizedBox(height: 12),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Close'),
            ),
          ],
        ),
      ),
    );}
    else{
       return Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.4,
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Cart Details',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
             const Text(
              'Please Add an Item to the Cart',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            ]
            )
            )
            );
    }
  }

   _processPayment(BuildContext context, PaymentMethod method) {
    final cartProvider = context.read<SalesProvider>();
    // Additional logic based on selected payment method (Cash or Online)
    if (method == PaymentMethod.Cash) {
     _confirmPayment(context, 'Cash');
    } else if (method == PaymentMethod.Online) {
      _confirmPayment(context, 'Online');
    }
  }

  void _confirmPayment(BuildContext context, String method) {
    // Perform actual payment confirmation logic here
    final TextEditingController branchController = TextEditingController();
    // Example: Show confirmation dialog and clear cart on confirmation
    showDialog(
      context: context,
      builder: (BuildContext context) {
        final provider = Provider.of<Authprovider>(context,listen:false).user;
        if(provider!.role=="Admin" || provider!.role == "admin" ){
           return AlertDialog(
          title: const Text('Payment Confirmation'),
          content: Text(
              'Payment method: $method\nTotal Amount: ${context.watch<SalesProvider>().totalPrice.toString()} birr'),
          actions: <Widget>[
            TextField(
              controller:branchController,
              decoration:InputDecoration(
                hintText: 'insert the branch you are operating in'
              ) ,
            ),

            TextButton(
              onPressed: () async{
                try{
                  final Salesprovider = Provider.of<SalesProvider>(context,listen:false);

                    await Salesprovider.sellProduct(branchController.text);
                context
                    .read<SalesProvider>()
                    .clearCart(); }catch(e){
                      print(e.toString());
                    }
                    // Clear cart after payment
                Navigator.of(context).popUntil((route) =>
                    route.isFirst); // Pop all screens until the first screen
              },
              child: const Text('Confirm'),
            ),
          ],
        );
        }else{
        return AlertDialog(
          title: const Text('Payment Confirmation'),
          content: Text(
              'Payment method: $method\nTotal Amount: ${context.watch<SalesProvider>().totalPrice.toString()} birr'),
          actions: <Widget>[
            TextButton(
              onPressed: () async{
                try{
                  final Salesprovider = Provider.of<SalesProvider>(context,listen:false);
                  final user= Provider.of<Authprovider>(context,listen: false).user;
                    await Salesprovider.sellProduct(user!.branch);
                context
                    .read<SalesProvider>()
                    .clearCart(); }catch(e){
                      print(e.toString());
                    }
                    // Clear cart after payment
                Navigator.of(context).popUntil((route) =>
                    route.isFirst); // Pop all screens until the first screen
              },
              child: const Text('Confirm'),
            ),
          ],
        );}
      },
    );
  }
}

enum PaymentMethod {
  Cash,
  Online,
}
