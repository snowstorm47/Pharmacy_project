import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ResetPasswordOtp extends StatefulWidget {
  const ResetPasswordOtp({
    super.key,
  });

  @override
  State<ResetPasswordOtp> createState() => _ResetPasswordOtpState();
}

class _ResetPasswordOtpState extends State<ResetPasswordOtp> {
  //define key to check the field is valid
  final GlobalKey<FormState> _signInKey = GlobalKey();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _otpController = TextEditingController();
  RegExp emailValid = RegExp(
      r"^([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFBF9),
      body: Form(
        key: _signInKey,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // //const Image(
              //   image: AssetImage('assets/images.jpg'),
              // ),
              Container(
                width: 300,
                padding: const EdgeInsets.all(16),
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
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 18),
                            child: Text(
                              "Reset Password",
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
                            hintText: "Email or Phone Number",
                            hintStyle: TextStyle(
                              fontSize: 15.0,
                              color: Color(0xFF808080),
                            ),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 15, horizontal: 20),
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
                        margin: const EdgeInsets.fromLTRB(15, 15, 15, 15),
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: const Color(0XFF1A6291),
                            ),
                            borderRadius: BorderRadius.circular(9)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextFormField(
                              controller: _otpController,
                              //make it secure
                              // obscureText: true,

                              inputFormatters: [
                                LengthLimitingTextInputFormatter(6),
                                FilteringTextInputFormatter.digitsOnly,
                              ],

                              decoration: const InputDecoration(
                                hintText: "Authentication code",
                                hintStyle: TextStyle(
                                  fontSize: 15.0,
                                  color: Color(0xFF808080),
                                ),
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 20),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Please enter the authentication code";
                                } else if (value.length != 6 ||
                                    !RegExp(r'^[0-9]{6}$').hasMatch(value)) {
                                  return "Authentication code must be exactly 6 digits";
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
                          padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
                          child: TextButton(
                            onPressed: () {
                              // Navigator.of(context).push(MaterialPageRoute(
                              //     builder: (context) => const RestPasswordPage()));
                            },
                            child: Row(
                              children: [
                                const Text(
                                  "Didn’t receive code?",
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.black),
                                ),
                                TextButton(
                                  onPressed: () {},
                                  child: const Text(
                                    "Resend code",
                                    style: TextStyle(
                                      color: Color(0xFF1A6291),
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ],
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
                                debugPrint("Email: ${_otpController.text}");
                              }
                            },
                            child: const Text(
                              "Verify code",
                              style: TextStyle(color: Colors.white),
                            )),
                      )
                    ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
