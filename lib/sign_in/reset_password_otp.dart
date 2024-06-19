import 'package:clean_a/shared/utility/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ResetPasswordOtp extends StatefulWidget {
  const ResetPasswordOtp({super.key});

  @override
  State<ResetPasswordOtp> createState() => _ResetPasswordOtpState();
}

class _ResetPasswordOtpState extends State<ResetPasswordOtp> {
  final GlobalKey<FormState> _resetOtpKey = GlobalKey();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _otpController = TextEditingController();
  RegExp emailValid = RegExp(
      r"^([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$");

  @override
  Widget build(BuildContext context) {
    final responsive = context.responsive;
    return Scaffold(
      body: Center(
        child: Row(
          children: [
            if (responsive.isDesktop) ...[
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/download.jpg', //small logo
                      height: responsive.hp(10), // Adjust size as needed
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Pharmacy Hub',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Image.asset(
                      'assets/phas.jpg', //large image
                      height: responsive.hp(35),

                      fit: BoxFit.cover,
                    ),
                  ],
                ),
              ),
            ],
            Expanded(
              flex: 1,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (!responsive.isDesktop) ...[
                      const SizedBox(height: 30),
                      Image.asset(
                        'assets/download.jpg', // Replace with your logo asset path
                        height: responsive.hp(10), // Adjust size as needed
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'Pharmacy Hub',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 16),
                    ],
                    Center(
                        child: Container(
                      width: responsive.isDesktop
                          ? 350
                          : responsive.isTablet
                              ? responsive.wp(60)
                              : responsive.wp(60), //foe mobile
                      padding: const EdgeInsets.all(16),
                      constraints: BoxConstraints(
                        minHeight: responsive.isDesktop
                            ? 370
                            : responsive.isTablet
                                ? 350
                                : 300,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            blurRadius: 10,
                            offset: const Offset(0, 10),
                            spreadRadius: 3,
                          ),
                        ],
                      ),
                      child: Form(
                          key: _resetOtpKey,
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
                                ),
                              ),
                              Container(
                                margin:
                                    const EdgeInsets.fromLTRB(15, 30, 15, 0),
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
                                margin:
                                    const EdgeInsets.fromLTRB(15, 15, 15, 15),
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
                                            !RegExp(r'^[0-9]{6}$')
                                                .hasMatch(value)) {
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
                                  padding:
                                      const EdgeInsets.fromLTRB(15, 0, 15, 15),
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
                                              fontSize: 12,
                                              color: Colors.black),
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
                                width: responsive.isMobile
                                    ? responsive.wp(60)
                                    : responsive.wp(30),
                                decoration: BoxDecoration(
                                  color: const Color(0xFF3CC439),
                                  borderRadius: BorderRadius.circular(9),
                                ),
                                child: TextButton(
                                  onPressed: () {
                                    if (_resetOtpKey.currentState!.validate()) {
                                      debugPrint(
                                          "Email: ${_emailController.text}");
                                      debugPrint(
                                          "Password: ${_otpController.text}");
                                    }
                                  },
                                  child: const Text(
                                    "verify code",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ],
                          )),
                    )),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
