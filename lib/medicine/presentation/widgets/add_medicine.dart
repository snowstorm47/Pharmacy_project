import 'package:flutter/material.dart';

class AddMed extends StatefulWidget {
  const AddMed({super.key});

  @override
  State<AddMed> createState() => _AddAutoState();
}

class _AddAutoState extends State<AddMed> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth < 600;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: isMobile ? buildMobileLayout() : buildDesktopLayout(),
        ),
      ),
    );
  }

  Widget buildMobileLayout() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Add Medicine',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            fontFamily: 'Poppins.regular',
          ),
        ),
        const SizedBox(height: 7),
        const Text(
          'You can add your new medicine here',
          style: TextStyle(fontFamily: 'Poppins.regular'),
        ),
        const SizedBox(height: 20),
        buildTextFieldsColumn(),
        const SizedBox(height: 20),
        buildDescriptionAndButton(),
      ],
    );
  }

  Widget buildDesktopLayout() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Add Medicine',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            fontFamily: 'Poppins.regular',
          ),
        ),
        const SizedBox(height: 7),
        const Text(
          'You can add your new medicine here',
          style: TextStyle(fontFamily: 'Poppins.regular'),
        ),
        const SizedBox(height: 20),
        const Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // First Column
            Flexible(
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Medicine Name',
                      ),
                    ),
                    SizedBox(height: 30),
                    TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Generic Name',
                      ),
                    ),
                    SizedBox(height: 30),
                    TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Stock',
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(width: 20), // Space between columns

            // Second Column
            Flexible(
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Medicine Id',
                      ),
                    ),
                    SizedBox(height: 30),
                    TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Supplier price',
                      ),
                    ),
                    SizedBox(height: 30),
                    TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Taxable',
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(width: 20), // Space between columns

            // Third Column
            Flexible(
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Category',
                      ),
                    ),
                    SizedBox(height: 30),
                    TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Selling Price',
                      ),
                    ),
                    SizedBox(height: 30),
                    TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Prescription Based',
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(width: 20),
            Flexible(
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'weight',
                      ),
                    ),
                    SizedBox(height: 30),
                    TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Expiry Date',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        buildDescriptionAndButton(),
      ],
    );
  }

  Widget buildTextFieldsColumn() {
    return const Column(
      children: [
        TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Medicine Name',
          ),
        ),
        SizedBox(height: 20),
        TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Generic Name',
          ),
        ),
        SizedBox(height: 20),
        TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Stock',
          ),
        ),
        SizedBox(height: 20),
        TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Medicine Id',
          ),
        ),
        SizedBox(height: 20),
        TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Supplier Price',
          ),
        ),
        SizedBox(height: 20),
        TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Taxable',
          ),
        ),
        SizedBox(height: 20),
        TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Category',
          ),
        ),
        SizedBox(height: 20),
        TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Selling Price',
          ),
        ),
        SizedBox(height: 20),
        TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Prescription Based',
          ),
        ),
        SizedBox(height: 20),
        TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Weight',
          ),
        ),
        SizedBox(height: 20),
        TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Expiry Date',
          ),
        ),
      ],
    );
  }

  Widget buildDescriptionAndButton() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TextField(
          maxLines: 5,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Details...',
          ),
        ),
        const SizedBox(height: 40),
        Align(
          alignment: Alignment.centerRight,
          child: Row(
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0)),
                  backgroundColor: const Color.fromARGB(236, 27, 228, 4),
                  minimumSize: const Size(130, 40),
                ),
                onPressed: () {
                  // Add button action
                },
                child: const Text(
                  'Add medicine',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0)),
                  backgroundColor: const Color.fromARGB(255, 237, 75, 64),
                  minimumSize: const Size(130, 40),
                ),
                onPressed: () {
                  // Add button action
                },
                child: const Text(
                  'Reset',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
