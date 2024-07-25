import 'package:clean_a/sales/provider/sales_provider.dart';
import 'package:clean_a/shared/services/providers/authProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';




class PaymentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Select Payment Method:'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _processPayment(context, PaymentMethod.Cash),
              child: Text('Pay in Cash'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => _processPayment(context, PaymentMethod.Online),
              child: Text('Pay Online'),
            ),
          ],
        ),
      ),
    );
  }

  void _processPayment(BuildContext context, PaymentMethod method) {
   // final cartProvider = context.read<CartProvider>();
    // Additional logic based on selected payment method (Cash or Online)
    if (method == PaymentMethod.Cash) {
      _confirmPayment(context, 'Cash');
    } else if (method == PaymentMethod.Online) {
      _confirmPayment(context, 'Online');
    }
  }

  void _confirmPayment(BuildContext context, String method) {
    // Perform actual payment confirmation logic here
    final TextEditingController _branchController = TextEditingController();
    final userProvider = Provider.of<Authprovider>(context,listen:false);
    final puser= userProvider.user!;
    if(puser.role == 'Admin' || puser.role =='admin'){
     showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Payment Confirmation'),
          content: Column(
            children:[ Text(
                'Payment method: $method\nTotal Amount: ${context.watch<SalesProvider>().totalPrice} birr'),
                TextField(
                  controller:_branchController,
                  decoration:InputDecoration(
                    hintText:'Insert the branch you are operating at',
                  )

                )
                ]
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () async{
                try{
                final provider = Provider.of<SalesProvider>(context,listen:false);
            final userProvider = Provider.of<Authprovider>(context,listen:false);
                final puser= userProvider.user!; 
                final  branch= _branchController.text;
                if(puser.branch!= null){
                  await provider.sellProduct(puser.branch);
                }
                else{
                  await provider.sellProduct(branch);
                }
                  
                  provider.clearCart();
                 
                       
                }catch(e){
                      print(e.toString);
                }
                context
                    .read<SalesProvider>()
                     .clearCart(); 
                  // Clear cart after payment
                Navigator.of(context).popUntil((route) =>
                    route.isFirst); // Pop all screens until the first screen
              },
              child: Text('Confirm'),
            ),
          ],
        );
      },
    );
    }
    else{
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Payment Confirmation'),
          content: Text(
              'Payment method: $method\nTotal Amount: ${context.watch<SalesProvider>().totalPrice} birr'),
          actions: <Widget>[
            TextButton(
              onPressed: () async{
                try{
                final provider = Provider.of<SalesProvider>(context,listen:false);
              final cart = provider.cart;
            final userProvider = Provider.of<Authprovider>(context,listen:false);
                final puser= userProvider.user!; 
                if(puser.branch!= null){
                  await provider.sellProduct(puser.branch);
                }
                  
                  provider.clearCart();
                 
                       
                }catch(e){
                      print(e.toString);
                }
                context
                    .read<SalesProvider>()
                     .clearCart(); 
                  // Clear cart after payment
                Navigator.of(context).popUntil((route) =>
                    route.isFirst); // Pop all screens until the first screen
              },
              child: Text('Confirm'),
            ),
          ],
        );
      },
    );
  }}
}

enum PaymentMethod {
  Cash,
  Online,
}
