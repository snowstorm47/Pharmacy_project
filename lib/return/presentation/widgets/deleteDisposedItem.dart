import 'package:flutter/material.dart';

class DeleteDisposedItem extends StatelessWidget {
  const DeleteDisposedItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          bool isTablet = constraints.maxWidth > 600;
          double containerWidth = isTablet ? 700 : constraints.maxWidth * 0.9;
          double containerHeight = isTablet ? 300 : constraints.maxHeight * 0.5;
          double padding = isTablet ? 78.0 : 16.0;

          return Center(
            child: Container(
              width: containerWidth,
              height: containerHeight,
              decoration: const BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    spreadRadius: 2,
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.all(padding),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Are you sure?',
                      style: TextStyle(
                        fontSize: isTablet ? 20 : 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'The data will be completely erased',
                      style: TextStyle(
                        fontSize: isTablet ? 14 : 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(0),
                            ),
                            backgroundColor:
                                const Color.fromARGB(236, 27, 228, 4),
                          ),
                          onPressed: () {},
                          child: Text(
                            'Delete',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: isTablet ? 14 : 12,
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(0),
                            ),
                            backgroundColor:
                                const Color.fromARGB(255, 233, 79, 69),
                          ),
                          onPressed: () {},
                          child: Text(
                            'Cancel',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: isTablet ? 14 : 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
