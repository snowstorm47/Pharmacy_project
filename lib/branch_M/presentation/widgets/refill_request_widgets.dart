import 'package:clean_a/branch_M/Provider/branchProvides.dart';
import 'package:clean_a/branch_M/data/models/refill_request_data.dart';
import 'package:clean_a/shared/utility/responsiveDrawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RefillRequestContent extends StatelessWidget {
  const RefillRequestContent({super.key});

  @override
  Widget build(BuildContext context) {
    final branchProvider = Provider.of<BranchProvider>(context);

    return FutureBuilder(
      future: branchProvider.getRefills(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }

        final data = branchProvider.refills ?? [];

        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Refill requests',
              style: TextStyle(
                fontSize: ResponsiveD.isDesktop(context) ? 23 : 20,
              ),
            ),
            Text(
              'List of refill requests',
              style: TextStyle(
                fontSize: ResponsiveD.isDesktop(context) ? 23 : 20,
              ),
            ),
            SizedBox(height: ResponsiveD.isDesktop(context) ? 40 : 20),
            SizedBox(
              width: 200,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Color.fromARGB(236, 27, 228, 4)),
                onPressed: () {
                  _showAddRefillDialog(context, branchProvider);
                },
                child: Text('Add Refiller', style: TextStyle(color: Colors.white)),
              ),
            ),
            SizedBox(height: ResponsiveD.isDesktop(context) ? 40 : 20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Column(
                children: [
                  _buildHeaderRow(ResponsiveD.isDesktop(context)),
                  Column(
                    children: data
                        .map(
                          (item) => _buildDataRow(
                            item as RefillRequestData,
                            ResponsiveD.isDesktop(context),
                            () => branchProvider.deleteRefill(item.id),
                          ),
                        )
                        .toList(),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  void _showAddRefillDialog(BuildContext context, BranchProvider branchProvider) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        final branchNameController = TextEditingController();
        final refillRequestController = TextEditingController();
        final requestDateController = TextEditingController();
        final requestedByController = TextEditingController();

        return AlertDialog(
          title: Text('Add Refill Request'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: branchNameController,
                decoration: InputDecoration(labelText: 'Branch Name'),
              ),
              TextField(
                controller: refillRequestController,
                decoration: InputDecoration(labelText: 'Refill Request'),
              ),
              TextField(
                controller: requestDateController,
                decoration: InputDecoration(labelText: 'Request Date'),
              ),
              TextField(
                controller: requestedByController,
                decoration: InputDecoration(labelText: 'Requested By'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () async {
                await branchProvider.addRefill(
                  branchName: branchNameController.text,
                  refillRequest: refillRequestController.text,
                  requestDate: requestDateController.text,
                  requestedBy: requestedByController.text,
                );
                Navigator.of(context).pop();
              },
              child: Text('Add'),
            ),
          ],
        );
      },
    );
  }

  Widget _buildHeaderRow(bool isDesktop) {
    return Container(
      color: const Color.fromARGB(255, 236, 243, 236),
      padding: EdgeInsets.symmetric(vertical: isDesktop ? 15 : 8),
      child: Row(
        children: [
          _buildHeaderCell('Branch Name', isDesktop),
          _buildHeaderCell('Refill Request', isDesktop),
          _buildHeaderCell('Request Date', isDesktop),
          _buildHeaderCell('Requested By', isDesktop),
          _buildHeaderCell('Actions', isDesktop),
        ],
      ),
    );
  }

  Widget _buildHeaderCell(String label, bool isDesktop) {
    return Container(
      width: isDesktop ? 200 : 120,
      alignment: Alignment.center,
      child: Text(
        label,
        style: TextStyle(
          fontSize: isDesktop ? 20 : 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildDataRow(RefillRequestData refillRequest, bool isDesktop, VoidCallback onDelete) {
    return Container(
      color: const Color.fromARGB(255, 255, 255, 255),
      padding: EdgeInsets.symmetric(vertical: isDesktop ? 15 : 8),
      child: Row(
        children: [
              _buildDataCell(refillRequest.branchId, isDesktop),
          _buildDataCell(refillRequest.name, isDesktop),
          _buildDataCell(refillRequest.request, isDesktop),
          _buildDataCell(refillRequest.date, isDesktop),
          _buildDataCell(refillRequest.requestedBy, isDesktop),
          Container(
            width: isDesktop ? 200 : 120,
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    // Add edit functionality here
                  },
                ),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: onDelete,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDataCell(String label, bool isDesktop) {
    return Container(
      width: isDesktop ? 200 : 120,
      alignment: Alignment.center,
      child: Text(
        label,
        style: TextStyle(fontSize: isDesktop ? 18 : 14),
      ),
    );
  }
}
