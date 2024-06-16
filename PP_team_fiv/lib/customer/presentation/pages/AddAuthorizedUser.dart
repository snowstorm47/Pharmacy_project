import 'package:flutter/material.dart';

class AddAuthorizedUser extends StatelessWidget {
  final TextEditingController _descriptionController = TextEditingController();
  // final isMobile = Responsive.isMobile(BuildContext, context);
  // final bool isMobile = Responsive.isMobile(BuildContext, context);

  AddAuthorizedUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Add Authorized User',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'You Can Add your New authorized user information Here',
                style: TextStyle(fontSize: 20.0),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: _buildTextButton('Employee Name',
                        width: 300.0, height: 40.0),
                  ),
                  SizedBox(width: 50), // Add spacing between buttons
                  Expanded(
                    child: _buildTextButton('Phone Number',
                        width: 300.0, height: 40.0),
                  ),
                  SizedBox(width: 50),
                  Expanded(
                    child:
                        _buildTextButton('Email', width: 300.0, height: 40.0),
                  ),
                ],
              ),
              SizedBox(height: 15.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child:
                        _buildTextButton('Address', width: 300.0, height: 40.0),
                  ),
                  SizedBox(width: 50), // Add spacing between buttons
                  Expanded(
                    child: _buildTextButton('City', width: 300.0, height: 40.0),
                  ),
                  SizedBox(width: 50),
                  Expanded(
                    child: _buildTextButton('Sub City',
                        width: 300.0, height: 40.0),
                  ),
                ],
              ),
              SizedBox(height: 15.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: _buildTextButton('Role/Position',
                        width: 300.0, height: 40.0),
                  ),
                  SizedBox(width: 50), // Add spacing between buttons
                  Expanded(
                    child: _buildTextButton('Employee id',
                        width: 300.0, height: 40.0),
                  ),
                  SizedBox(width: 50),
                  Expanded(
                    child: _buildTextButton('Company Name',
                        width: 300.0, height: 40.0),
                  ),
                ],
              ),
              SizedBox(height: 15.0),
              Expanded(
                child: _buildTextButton('Description',
                    width: 665.0, height: 200.0),
              ),
              SizedBox(height: 10.0),
              Padding(
                padding: const EdgeInsets.only(
                    left: 900.0), // No padding needed here
                child: Container(
                  width: MediaQuery.of(context).size.width *
                      0.8, // Adjust width as needed
                  child: Row(
                    children: <Widget>[
                      ElevatedButton(
                        onPressed: () {
                          // Handle form submission here
                          print('Description: ${_descriptionController.text}');
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(255, 14, 196,
                              20), // Set the background color of the "Save" button
                          foregroundColor: Colors
                              .white, // Set the text color of the "Save" button
                        ),
                        child: Text('Add User'),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextButton(String title,
      {double width = 150, double height = 60}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
        SizedBox(height: 8),
        SizedBox(
          width: width,
          height: height,
          child: TextField(
            decoration: InputDecoration(
              // hintText: title,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide(
                  color: Colors.grey.shade400, // Set the border color
                  width: 1.0, // Set the border width
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
