import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class new_pPage extends StatelessWidget {
  const new_pPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 205, 202, 202),
      body: SafeArea(
        child: Row(
          children: [
            Expanded(
              flex: 4,
              child: Container(
                width: 500,
                height: 500,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 2.0),
                      child: Image(
                        image: AssetImage('lib/image/hub.jpg'),
                        width: 340,
                        height: 150,
                      ),
                    ),
                   
                    Padding(
                      padding: const EdgeInsets.only(left: 128.0),
                      child: Text(
                        'Pharmacy Hub',
                        style: TextStyle(
                          fontSize: 24,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.only(left: 128.0),
                      child: Text(
                        'Lorem.....',
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 120.0),
                        child: Image(
                          image: AssetImage('lib/image/med.jpg',),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
           
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(80.0),
                child: Container(
                  height: 420,
                  width: 170,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Reset Password',
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 30),
                        Text('Enter your Email ID or mobile number',style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),),
                         SizedBox(height: 7),
                        TextField(
                          decoration: InputDecoration(
                            hintText: 'loreum@gmail.com',
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                         fillColor:  Color.fromARGB(255, 205, 202, 202),
                         filled: true
                          ),

       style: TextStyle(fontSize: 12),

                        ),
                        SizedBox(height: 10),
                        Text('Enter new password',style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),),
                        SizedBox(height: 7),
                       
                        TextField(
                          decoration: InputDecoration(
                            hintText: 'Password',
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                            
                          ),
                                 style: TextStyle(fontSize: 12),
                        ),
                        SizedBox(height: 10),
                        Text('Confirm new password',style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),),
                         SizedBox(height: 7),
                        TextField(
                          decoration: InputDecoration(
                            hintText: 'Password',
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                          ),

style: TextStyle(fontSize: 12),

                        ),
                        SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(236, 27, 228, 4),
                         
                         padding: EdgeInsets.symmetric(vertical: 20, horizontal: 100),
                          ),
                          
                          child: Text(
                            'Submit',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}