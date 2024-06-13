import 'package:clean_a/header.dart';
import 'package:flutter/material.dart';

class ReportPGenerate extends StatefulWidget {
  const ReportPGenerate({super.key});

  @override
  State<ReportPGenerate> createState() => _ReportPGenerateState();
}

class _ReportPGenerateState extends State<ReportPGenerate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(title: 'Report'),
      body: LayoutBuilder(
        builder: (context, constraints) {
          bool isTablet = constraints.maxWidth > 600;
          double padding = isTablet ? 108.0 : 16.0;
          double fontSizeTitle = isTablet ? 23 : 18;
          double fontSizeButton = isTablet ? 13 : 11;
          double containerWidth = isTablet ? 400 : constraints.maxWidth - 32;
          double containerHeight = isTablet ? 270 : 300;

          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(padding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Purchase Reports',
                        style: TextStyle(
                          fontSize: fontSizeTitle,
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(236, 27, 228, 4),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0),
                          ),
                        ),
                        onPressed: () {},
                        child: Text(
                          'Generate Report',
                          style: TextStyle(fontSize: fontSizeButton, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Center(
                    child: Container(
                      color: Color.fromARGB(255, 197, 194, 194),
                      width: containerWidth,
                      height: containerHeight,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Generate Report',
                                  style: TextStyle(fontSize: 17, color: Colors.black, fontWeight: FontWeight.bold),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Text(
                                    'x',
                                    style: TextStyle(fontSize: 17, color: Colors.black, fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 20),
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'From',
                                    style: TextStyle(fontSize: 17, color: Colors.black),
                                  ),
                                  Text(
                                    'To',
                                    style: TextStyle(fontSize: 17, color: Colors.black),
                                  ),
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
                                        suffixIcon: Icon(Icons.calendar_month, size: 20, color: Colors.black),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 20),
                                  Expanded(
                                    child: TextField(
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        fillColor: Colors.white,
                                        suffixIcon: Icon(Icons.calendar_month, size: 20, color: Colors.black),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 20),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
                                backgroundColor: Color.fromARGB(236, 27, 228, 4),
                              ),
                              onPressed: () {},
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
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
