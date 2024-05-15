import 'package:clean_a/sign_in/reset_password.dart';
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
      backgroundColor: const Color(0xFFFAFBF9),
      body: Form(
        key: _signInKey,
        child: Center(
          child: Container(
            width: 300,
            height: 300,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    blurRadius: 10,
                    offset: const Offset(0, 10),
                    spreadRadius: 3,
                  )
                ]),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 18),
                  child: Text("Welcome to Pharmacy Hub"),
                ),
              ),
              const Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 18),
                    child: Text(
                      "Sign in",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  )),
              Container(
                margin: const EdgeInsets.fromLTRB(15, 30, 15, 0),
                decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color(0XFF1A6291),
                    ),
                    borderRadius: BorderRadius.circular(9)),
                child: TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    hintText: "phone number or email",
                    hintStyle: TextStyle(
                      fontSize: 15.0,
                      color: Color(0xFF808080),
                    ),
                    border: InputBorder.none,
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 15, horizontal: 20),
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
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(15, 15, 15, 0),
                decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color(0XFF1A6291),
                    ),
                    borderRadius: BorderRadius.circular(9)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      controller: _passwordController,
                      //make it secure
                      obscureText: true,
                      decoration: const InputDecoration(
                        hintText: "password",
                        hintStyle: TextStyle(
                          fontSize: 15.0,
                          color: Color(0xFF808080),
                        ),
                        border: InputBorder.none,
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 20),
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
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 15, 15),
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => RestPasswordPage()));
                    },
                    child: const Text(
                      "Rest Password",
                      style: TextStyle(color: Color(0xFF1A6291), fontSize: 10),
                    ),
                  ),
                ),
              ),
              Container(
                width: 250,
                decoration: BoxDecoration(
                    color: const Color(0xFF3CC439),
                    borderRadius: BorderRadius.circular(9)),
                child: TextButton(
                    onPressed: () {
                      if (_signInKey.currentState!.validate()) {
                        debugPrint("Email: ${_emailController.text}");
                        debugPrint("Email: ${_passwordController.text}");
                      }
                    },
                    child: const Text(
                      "Sign in",
                      style: TextStyle(color: Colors.white),
                    )),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
