import 'package:clean_a/customer/providers/customerProviders.dart';
import 'package:flutter/material.dart';
import 'package:clean_a/Drawer/sidemenupage.dart';
import 'package:clean_a/dashboard/presentation/pages/header_page.dart';
import 'package:clean_a/shared/utility/responsiveDrawer.dart';
import 'package:provider/provider.dart';
class AddAuthorizedCompany extends StatefulWidget {
  const AddAuthorizedCompany({super.key});

  @override
  State<AddAuthorizedCompany> createState() => _AddAuthorizedCompanyState();
}

class _AddAuthorizedCompanyState extends State<AddAuthorizedCompany> {
  bool showSideMenu = false;
  final TextEditingController companyContactController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController companyController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController paymentTermsController = TextEditingController();
  final TextEditingController creditLimitController = TextEditingController();
  final TextEditingController policyNumberController = TextEditingController();
  final TextEditingController emergencyContactController = TextEditingController();
  final TextEditingController medicalProviderController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth < 600;

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
                          child: SingleChildScrollView(
                            child: isMobile
                                ? buildMobileLayout()
                                : buildDesktopLayout(),
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

  Widget buildMobileLayout() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Add Authorized Company',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            fontFamily: 'Poppins.regular',
          ),
        ),
        const SizedBox(height: 7),
        const Text(
          'You can add new corporate company here',
          style: TextStyle(fontFamily: 'Poppins.regular'),
        ),
        const SizedBox(height: 20),
        InputFields(
          companyController: companyController,
          companyContactController: companyContactController,
          emailController: emailController,
          addressController: addressController,
          paymentTermsController: paymentTermsController,
          creditLimitController: creditLimitController,
          phoneController: phoneController,
          medicalProviderController: medicalProviderController,
          emergencyContactController: emergencyContactController,
          policyNumberController: policyNumberController,
          descriptionController: descriptionController,
        ),
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
          'Add Authorized Company',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            fontFamily: 'Poppins.regular',
          ),
        ),
        const SizedBox(height: 7),
        const Text(
          'You can add new corporate company here',
          style: TextStyle(fontFamily: 'Poppins.regular'),
        ),

        Column(
          children: [
            buildTextField('Company Name', companyController),
                    const SizedBox(height: 20),
            buildTextField('Contact Name', companyContactController),
            const SizedBox(height: 20),
            buildTextField('Contact Email', emailController),
                    const SizedBox(height: 20),
            buildTextField('Company Address', addressController),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildDesktopInputRow([
                      buildTextField('Payment Terms', paymentTermsController),
                      buildTextField('Credit Limit', creditLimitController, TextInputType.number),
                      buildTextField('Phone', phoneController),
                    ]),
                    _buildDesktopInputRow([
                      buildTextField('Medical Insurance Provider', medicalProviderController),
                      buildTextField('Emergency Contact', emergencyContactController),
                      buildTextField('Policy Number', policyNumberController),
                    ]),
                    _buildDesktopInputRow([
                      buildTextField('Description', descriptionController, TextInputType.multiline),
                    ]),
                    buildAddCreditUsersButton(context),
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

  Widget buildDescriptionAndButton() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          controller: descriptionController,
          maxLines: 5,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Enter additional notes here...',
          ),
        ),
        const SizedBox(height: 20),
        Align(
          alignment: Alignment.centerRight,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0),
              ),
              backgroundColor: const Color.fromARGB(236, 27, 228, 4),
              minimumSize: const Size(130, 40),
            ),
            onPressed: () async {
              // Add button action
              final empData = Provider.of<employeeData>(context, listen: false).emplData;
              final customerProvider = Provider.of<CustomerProvider>(context, listen: false);
              await customerProvider.addCustomer(
                companyName: companyController.text,
                companyContact: companyContactController.text,
                companyEmail: emailController.text,
                companyPhone: phoneController.text,
                companyAddress: addressController.text,
                paymentTerms: paymentTermsController.text,
                creditLimit: double.tryParse(creditLimitController.text) ?? 0.0,
                medicalInsuranceProvider: medicalProviderController.text,
                policyNumber: policyNumberController.text,
                emergencyContact: emergencyContactController.text,
                details: descriptionController.text,
                empData: empData,
              );
            },
            child: const Text(
              'Submit',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDesktopInputRow(List<Widget> children) {
    return Row(
      children: children
          .map((widget) => Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: widget,
                ),
              ))
          .toList(),
    );
  }

  Widget buildTextField(String label, TextEditingController controller, [TextInputType inputType = TextInputType.text, int maxLines = 1]) {
    return TextField(
      controller: controller,
      keyboardType: inputType,
      maxLines: maxLines,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: label,
      ),
    );
  }

  Widget buildAddCreditUsersButton(BuildContext context) {
    return TextButton(
      onPressed: () async {
        final empData = Provider.of<employeeData>(context, listen: false);
        await empData.getEmployee();
      },
      child: const Text('Add Credit Users', style: TextStyle(fontSize: 12)),
    );
  }
}

class InputFields extends StatelessWidget {
  final TextEditingController companyContactController;
  final TextEditingController phoneController;
  final TextEditingController companyController;
  final TextEditingController emailController;
  final TextEditingController addressController;
  final TextEditingController paymentTermsController;
  final TextEditingController creditLimitController;
  final TextEditingController policyNumberController;
  final TextEditingController emergencyContactController;
  final TextEditingController medicalProviderController;
  final TextEditingController descriptionController;

  InputFields({
    super.key,
    required this.companyContactController,
    required this.phoneController,
    required this.companyController,
    required this.emailController,
    required this.addressController,
    required this.paymentTermsController,
    required this.creditLimitController,
    required this.policyNumberController,
    required this.emergencyContactController,
    required this.medicalProviderController,
    required this.descriptionController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildTextField('Company Name', companyController),
        const SizedBox(height: 22.0),
        buildTextField('Contact Name', companyContactController),
        const SizedBox(height: 22.0),
        buildTextField('Contact Email', emailController),
        const SizedBox(height: 22.0),
        buildTextField('Company Address', addressController),
        const SizedBox(height: 22.0),
        Row(
          children: [
            Expanded(
              child: buildTextField('Payment Terms', paymentTermsController),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: buildTextField('Credit Limit', creditLimitController, TextInputType.number),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            Expanded(
              child: buildTextField('Phone', phoneController),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: buildTextField('Medical Insurance Provider', medicalProviderController),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            Expanded(
              child: buildTextField('Emergency Contact', emergencyContactController),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: buildTextField('Policy Number', policyNumberController),
            ),
          ],
        ),
        const SizedBox(height: 20),
        buildTextField('Description', descriptionController, TextInputType.multiline),
        const SizedBox(height: 20),
        buildAddCreditUsersButton(context),
      ],
    );
  }

  Widget buildTextField(String label, TextEditingController controller, [TextInputType inputType = TextInputType.text, int maxLines = 1]) {
    return TextField(
      controller: controller,
      keyboardType: inputType,
      maxLines: maxLines,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: label,
      ),
    );
  }

  Widget buildAddCreditUsersButton(BuildContext context) {
    return TextButton(
      onPressed: () async {
        final empData = Provider.of<employeeData>(context, listen: false);
        await empData.getEmployee();
      },
      child: const Text('Add Credit Users', style: TextStyle(fontSize: 12)),
    );
  }
}


void main() {
  runApp(const MaterialApp(
    home: AddAuthorizedCompany(),
  ));
}
