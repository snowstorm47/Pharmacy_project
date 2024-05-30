
import 'package:clean_a/header.dart';
import 'package:flutter/material.dart';
class reportPGenerate extends StatefulWidget {
  const reportPGenerate({super.key});

  @override
  State<reportPGenerate> createState() => _reportPGenerateState();
}

class _reportPGenerateState extends State<reportPGenerate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
appBar: Header(title: 'Report'),

      body: Padding(
        padding: const EdgeInsets.all(108.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Purchase Reports',
                  style: TextStyle(
                    fontSize: 23,
                  ),
                ),
                SizedBox(
                  width: 200,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(236, 27, 228, 4),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0),
                      )),
                  onPressed: () {},
                  child: Text(
                    'Generate Report',
                    style: TextStyle(fontSize: 13, color: Colors.white),
                  ),
                ),
              ],
            ),
SizedBox(height: 49,),
            Column(
              children: [
                Container(
                  color: Color.fromARGB(255, 197, 194, 194),
                  width: 400,
                  height: 270,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                          Text('Generate Report',   style: TextStyle(fontSize: 17, color: Colors.black,fontWeight: FontWeight.bold),),
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Text('x',style: TextStyle(fontSize: 17, color: Colors.black,fontWeight: FontWeight.bold),),
                              ),
                           ],
                           ),
                             SizedBox(height: 37,),
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('From',style: TextStyle(fontSize: 17, color: Colors.black),),
                              
                                 Text('To',style: TextStyle(fontSize: 17, color: Colors.black),),
                              ],
                            ),
                          ),
                         
                           Padding(
                             padding: const EdgeInsets.all(12.0),
                             child: Row(
                               children: [
                               
                                 Expanded(
                                   child: TextField(
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      fillColor: Colors.white,
                                      suffixIcon:Icon(Icons.calendar_month,size: 20,color: Colors.black,),
                                      ),
                                   
                                    ),
                                 ),
                              SizedBox(width: 20,),    
                              Expanded(
                    
                                 child: TextField(
                                                           decoration: InputDecoration(border: OutlineInputBorder(),fillColor: Colors.white,
                                                                   suffixIcon:Icon(Icons.calendar_month,size: 20,color: Colors.black,),),
                                                           
                                                           ),
                               ),
                           
                               ],
                             ),
                           ),
                             SizedBox(height: 20,),
                             ElevatedButton(
                              
                              style: ElevatedButton.styleFrom(
                                
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
                                backgroundColor: Color.fromARGB(236, 27, 228, 4),
                             
                              ),
                              
                              onPressed: (){}, child: Text('Submit',style: TextStyle(color: Colors.white),))
                            
                           ],
                    ),
                  ),
                          
                
                
                ),
              ],
            )


          ],
        ),
      ),











    );
  }
}