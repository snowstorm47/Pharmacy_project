/*import 'package:flutter/material.dart';

class DeleteMedicine extends StatelessWidget {
  const DeleteMedicine({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          bool isTablet = constraints.maxWidth > 600;
          double containerWidth = isTablet ? 800 : constraints.maxWidth * 0.9;
          double containerHeight = isTablet ? 490 : constraints.maxHeight * 0.8;
          double padding = isTablet ? 36.0 : 16.0;
          double textFieldWidth = isTablet ? 300 : constraints.maxWidth * 0.8;

          return Center(
            child: Container(
              width: containerWidth,
              height: containerHeight,
              padding: EdgeInsets.all(padding),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: isTablet
                  ? Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Delete Medicines',
                                style: TextStyle(fontSize: 23),
                              ),
                              const SizedBox(height: 30),
                              SizedBox(
                                width: textFieldWidth,
                                height: 40,
                                child: TextField(
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    labelText: 'Medicine Name',
                                  ),
                                ),
                              ),
                              const SizedBox(height: 40),
                              SizedBox(
                                width: textFieldWidth,
                                height: 40,
                                child: TextField(
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    labelText: 'Reason',
                                  ),
                                ),
                              ),
                              const SizedBox(height: 40),
                              SizedBox(
                                width: textFieldWidth,
                                height: 100,
                                child: const TextField(
                                  maxLines: 5,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText:
                                        'Enter additional description here...',
                                  ),
                                ),
                              ),
                              const Spacer(),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      backgroundColor: const Color.fromARGB(
                                          255, 245, 58, 44),
                                    ),
                                    onPressed: () {},
                                    child: const Text('Delete Medicine',
                                        style: TextStyle(color: Colors.white)),
                                  ),
                                  const SizedBox(width: 12),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      backgroundColor: Colors.blue,
                                    ),
                                    onPressed: () {},
                                    child: const Text('Cancel',
                                        style: TextStyle(color: Colors.white)),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          flex: 2,
                          child: Padding(
                            padding: const EdgeInsets.all(60.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: textFieldWidth,
                                  height: 40,
                                  child: TextField(
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      labelText: 'Category',
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 40),
                                SizedBox(
                                  width: textFieldWidth,
                                  height: 40,
                                  child: TextField(
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      labelText: 'Stock/Box',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Delete Medicines',
                          style: TextStyle(fontSize: 20),
                        ),
                        const SizedBox(height: 30),
                        SizedBox(
                          width: textFieldWidth,
                          height: 40,
                          child: TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              labelText: 'Medicine Name',
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        SizedBox(
                          width: textFieldWidth,
                          height: 40,
                          child: TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              labelText: 'Reason',
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        SizedBox(
                          width: textFieldWidth,
                          height: 40,
                          child: TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              labelText: 'Category',
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        SizedBox(
                          width: textFieldWidth,
                          height: 40,
                          child: TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              labelText: 'Stock/Box',
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        SizedBox(
                          width: textFieldWidth,
                          height: 100,
                          child: const TextField(
                            maxLines: 5,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Enter additional description here...',
                            ),
                          ),
                        ),
                        const Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                backgroundColor:
                                    const Color.fromARGB(255, 245, 58, 44),
                              ),
                              onPressed: () {},
                              child: const Text('Delete Medicine',
                                  style: TextStyle(color: Colors.white)),
                            ),
                            const SizedBox(width: 12),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                backgroundColor: Colors.blue,
                              ),
                              onPressed: () {},
                              child: const Text('Cancel',
                                  style: TextStyle(color: Colors.white)),
                            ),
                          ],
                        )
                      ],
                    ),
            ),
          );
        },
      ),
    );
  }
}*/
