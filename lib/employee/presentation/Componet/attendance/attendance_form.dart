// lib/shared/reusable/attendance_form.dart

import 'package:clean_a/shared/reusable/date_picker.dart';
import 'package:flutter/material.dart';

class AttendanceForm extends StatelessWidget {
  final TextEditingController dateController;
  final TextEditingController signInController;
  final TextEditingController signOutController;
  final Function onTapSignIn;
  final Function onTapSignOut;

  const AttendanceForm({
    super.key,
    required this.dateController,
    required this.signInController,
    required this.signOutController,
    required this.onTapSignIn,
    required this.onTapSignOut,
  });

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = MediaQuery.of(context).size.width > 800;

    return Column(
      children: [
        isDesktop
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 100.0),
                      child: TextField(
                        controller: dateController,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          labelText: 'Date',
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 10.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        readOnly: true,
                        onTap: () async {
                          DateTime? pickedDate =
                              await DatePickerUtil.selectDate(context);
                          if (pickedDate != null) {
                            dateController.text =
                                "${pickedDate.toLocal()}".split(' ')[0];
                          }
                        },
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 100.0),
                      child: TextField(
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          labelText: 'Name',
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 10.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            : Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 100.0),
                    child: TextField(
                      controller: dateController,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        labelText: 'Date',
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 10.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      readOnly: true,
                      onTap: () async {
                        DateTime? pickedDate =
                            await DatePickerUtil.selectDate(context);
                        if (pickedDate != null) {
                          dateController.text =
                              "${pickedDate.toLocal()}".split(' ')[0];
                        }
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 100.0),
                    child: TextField(
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        labelText: 'Name',
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 10.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
        const SizedBox(height: 20),
        isDesktop
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 100.0),
                      child: TextField(
                        controller: signInController,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          labelText: 'Sign In',
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 10.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        readOnly: true,
                        onTap: () {
                          onTapSignIn();
                        },
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 100.0),
                      child: TextField(
                        controller: signOutController,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          labelText: 'Sign Out',
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 10.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        readOnly: true,
                        onTap: () {
                          onTapSignOut();
                        },
                      ),
                    ),
                  ),
                ],
              )
            : Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 100.0),
                    child: TextField(
                      controller: signInController,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        labelText: 'Sign In',
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 10.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      readOnly: true,
                      onTap: () {
                        onTapSignIn();
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 100.0),
                    child: TextField(
                      controller: signOutController,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        labelText: 'Sign Out',
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 10.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      readOnly: true,
                      onTap: () {
                        onTapSignOut();
                      },
                    ),
                  ),
                ],
              ),
      ],
    );
  }
}
