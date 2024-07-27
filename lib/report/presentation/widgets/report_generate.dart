import 'package:flutter/material.dart';
import 'package:clean_a/Drawer/sidemenupage.dart';
import 'package:clean_a/dashboard/presentation/pages/header_page.dart';
import 'package:clean_a/shared/utility/responsiveDrawer.dart';
import 'package:clean_a/shared/reusable/date_picker.dart';
import 'package:intl/intl.dart'; // Import for date parsing
import 'package:clean_a/report/presentation/widgets/generated_sales_reports.dart'; // Import the GeneratedSReports screen

class ReportGenerate extends StatefulWidget {
  const ReportGenerate({super.key});

  @override
  State<ReportGenerate> createState() => _ReportGenerateState();
}

class _ReportGenerateState extends State<ReportGenerate> {
  bool showSideMenu = false;
  final TextEditingController _fromDateController = TextEditingController();
  final TextEditingController _toDateController = TextEditingController();

  Future<void> _selectDate(TextEditingController controller) async {
    DateTime? pickedDate = await DatePickerUtil.selectDate(context);
    if (pickedDate != null) {
      setState(() {
        controller.text = "${pickedDate.toLocal()}".split(' ')[0];
      });
    }
  }

  void _submit() {
  if (_fromDateController.text.isNotEmpty && _toDateController.text.isNotEmpty) {
    final DateTime fromDate = DateFormat('yyyy-MM-dd').parse(_fromDateController.text);
    final DateTime toDate = DateFormat('yyyy-MM-dd').parse(_toDateController.text);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => GeneratedSReports(
          fromDate: fromDate,
          toDate: toDate,
        ),
      ),
    );
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Please select both dates'),
      ),
    );
  }
}


  @override
  Widget build(BuildContext context) {
    final bool isDesktop = MediaQuery.of(context).size.width > 800;

    return Scaffold(
      backgroundColor: const Color(0xFFF3F6F0),
      body: SafeArea(
        child: Stack(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (ResponsiveD.isDesktop(context))
                  Expanded(
                    child: SideMenu(
                      onClose: () {
                        setState(() {
                          showSideMenu = false;
                        });
                      },
                    ),
                  ),
                Expanded(
                  flex: 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      HeaderPage(
                        onMenuPressed: () {
                          setState(() {
                            showSideMenu = !showSideMenu;
                          });
                        },
                        isSideMenuOpen: showSideMenu,
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              const Text(
                                'Generate Sales Report',
                                style: TextStyle(
                                  fontSize: 26,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              const SizedBox(height: 8),
                              const Text(
                                'Select date range to generate the sales report',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              const SizedBox(height: 30),
                              TextField(
                                controller: _fromDateController,
                                readOnly: true,
                                decoration: InputDecoration(
                                  hintText: 'From Date',
                                  prefixIcon: const Icon(Icons.calendar_today),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                    borderSide: BorderSide.none,
                                  ),
                                  filled: true,
                                  fillColor: Colors.white,
                                  contentPadding: const EdgeInsets.symmetric(
                                    vertical: 0.0,
                                    horizontal: 16.0,
                                  ),
                                ),
                                onTap: () => _selectDate(_fromDateController),
                              ),
                              const SizedBox(height: 16),
                              TextField(
                                controller: _toDateController,
                                readOnly: true,
                                decoration: InputDecoration(
                                  hintText: 'To Date',
                                  prefixIcon: const Icon(Icons.calendar_today),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                    borderSide: BorderSide.none,
                                  ),
                                  filled: true,
                                  fillColor: Colors.white,
                                  contentPadding: const EdgeInsets.symmetric(
                                    vertical: 0.0,
                                    horizontal: 16.0,
                                  ),
                                ),
                                onTap: () => _selectDate(_toDateController),
                              ),
                              const SizedBox(height: 30),
                              ElevatedButton(
                                onPressed: _submit,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blue,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                                child: const Text(
                                  'Generate Report',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            if (!ResponsiveD.isDesktop(context) && showSideMenu)
              Positioned(
                left: 0,
                top: 0,
                bottom: 0,
                child: SideMenu(
                  onClose: () {
                    setState(() {
                      showSideMenu = false;
                    });
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}
