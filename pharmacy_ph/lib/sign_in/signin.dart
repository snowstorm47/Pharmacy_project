import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pharmacy Demo',
      home: MySignInPage(),
    );
  }
}

class MySignInPage extends StatefulWidget {
  const MySignInPage({
    super.key,
  });

  @override
  State<MySignInPage> createState() => _MySignInPageState();
}

class _MySignInPageState extends State<MySignInPage> {
  //define key to check the field is valid
  final GlobalKey<FormState> _signInKey = GlobalKey();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  RegExp emailValid = RegExp(
      r"^([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _signInKey,
        child: Column(children: [
          TextFormField(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              hintText: "Phone number or Email",
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please enter an Email";
              } //REGular expression
              else if (!emailValid.hasMatch(value)) {
                return 'Please enter a valid email';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _passwordController,
            //make it secure
            obscureText: true,
            decoration: const InputDecoration(
              hintText: "Password",
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please enter a password";
              } else if (value.length < 6) {
                return "Password must be at least 6 characters";
              }
              return null;
            },
          ),
          ElevatedButton(
              onPressed: () {
                if (_signInKey.currentState!.validate()) {
                  debugPrint("Email: ${_emailController.text}");
                  debugPrint("Email: ${_passwordController.text}");
                }
              },
              child: const Text("Sign in"))
        ]),
      ),
    );
  }
}
