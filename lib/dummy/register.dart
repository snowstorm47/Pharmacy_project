

// Assuming imports for RegisterService, UserModel, and necessary providers
import 'dart:typed_data';





import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../shared/services/providers/registrationProvider.dart';




class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final firstNameController = TextEditingController();
    final lastNameController = TextEditingController();
    final branchController = TextEditingController();
    final roleController = TextEditingController();

    Uint8List? webImage;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Registration'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: emailController,
              decoration: const InputDecoration(labelText: 'Email'),
              keyboardType: TextInputType.emailAddress,
            ),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            TextField(
              controller: firstNameController,
              decoration: const InputDecoration(labelText: 'First Name'),
            ),
            TextField(
              controller: lastNameController,
              decoration: const InputDecoration(labelText: 'Last Name'),
            ),
            TextField(
              controller: branchController,
              decoration: const InputDecoration(labelText: 'Branch'),
            ),
            TextField(
              controller: roleController,
              decoration: const InputDecoration(labelText: 'Role'),
            ),
            const SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    final ImageProvider = Provider.of<imageProvider>(context, listen: false);
                    await ImageProvider.getImage();
                    webImage = ImageProvider.image;
                  },
                  child: const Text('Select Image'),
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () async {
                try {
                  final RegistrationProvider = Provider.of<registrationProvider>(context, listen: false);
                  final user = RegistrationProvider.registerUser(
                    branch: branchController.text,
                    role: roleController.text,
                    email: emailController.text,
                    password: passwordController.text,
                    FirstName: firstNameController.text,
                    LastName: lastNameController.text,
                    permission: ['add', 'delete'],
                    access: ['medicine'],
                    bytes: webImage,
                  );
                  if (user != null) {
                    // Handle successful registration (e.g., navigate to home)
                    print(user);
                  }
                } catch (e) {
                  print(e.toString()); // Log the error
                }
              },
              child: const Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}
