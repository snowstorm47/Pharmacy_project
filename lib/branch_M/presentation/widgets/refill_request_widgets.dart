import 'package:clean_a/branch_M/Provider/branchProvides.dart';
import 'package:clean_a/branch_M/domain/entities/refill.dart';
import 'package:clean_a/shared/services/providers/authProvider.dart';
import 'package:flutter/material.dart';

import 'package:clean_a/shared/utility/responsiveDrawer.dart';
import 'package:provider/provider.dart';





// Replace with the actual import

class RefillRequestContent extends StatefulWidget {
  const RefillRequestContent({super.key});

  @override
  State<RefillRequestContent> createState() => _RefillRequestContentState();
}

class _RefillRequestContentState extends State<RefillRequestContent> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      Provider.of<BranchProvider>(context, listen: false).getRefill();
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<BranchProvider>(context, listen: false);
    final data = provider.refills ?? [];

    return Scaffold(
      body: Column(
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
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minWidth: MediaQuery.of(context).size.width,
                ),
                child: Column(
                  children: [
                    _buildHeaderRow(ResponsiveD.isDesktop(context)),
                    data.isEmpty
                        ? Center(child: Text('No refill data is found'))
                        : Column(
                            children: data
                                .map(
                                  (item) => _buildDataRow(
                                    item,
                                    ResponsiveD.isDesktop(context),
                                  ),
                                )
                                .toList(),
                          ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showCreateRefillPopup(context),
        child: Icon(Icons.add),
      ),
    );
  }

  Widget _buildHeaderRow(bool isTablet) {
    return Container(
      color: Colors.blue,
      child: Padding(
        padding: EdgeInsets.all(isTablet ? 12.0 : 8.0),
        child: Row(
          children: [
            _buildHeaderCell('Name', isTablet),
            _buildHeaderCell('Request', isTablet),
            _buildHeaderCell('Date', isTablet),
            _buildHeaderCell('Requested By', isTablet),
            _buildHeaderCell('Actions', isTablet),
          ],
        ),
      ),
    );
  }

  Widget _buildDataRow(Refill data, bool isTablet) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(2.0),
      ),
      child: Padding(
        padding: EdgeInsets.all(isTablet ? 12.0 : 8.0),
        child: Row(
          children: [
            _buildDataCell(data.branchName, isTablet),
            _buildDataCell(data.refillRequest, isTablet),
            _buildDataCell(data.requestDate.toString(), isTablet),
            _buildDataCell(data.requestedBy, isTablet),
            _buildDataCell('', isAction: true, isTablet, data: data),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderCell(String text, bool isTablet) {
    return SizedBox(
      width: isTablet ? 150 : 120,
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildDataCell(String text, bool isTablet, {bool isAction = false, Refill? data}) {
    return SizedBox(
      width: isTablet ? 150 : 120,
      child: isAction
          ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () async {
                    final provider = Provider.of<BranchProvider>(context, listen: false);
                    if (data != null) {
                      await provider.deleteRefill(data.id);
                    }
                  },
                  child: Icon(
                    Icons.delete,
                    color: Colors.red,
                    size: isTablet ? 17 : 15,
                  ),
                ),
                SizedBox(width: isTablet ? 17 : 10),
                GestureDetector(
                  onTap: () {
                    if (data != null) {
                      _showEditRefillPopup(context, data);
                    }
                  },
                  child: Icon(
                    Icons.edit,
                    color: Colors.black,
                    size: isTablet ? 17 : 15,
                  ),
                ),
              ],
            )
          : Text(
              text,
              style: TextStyle(
                color: Colors.black,
                fontSize: isTablet ? 16 : 14,
              ),
              textAlign: TextAlign.center,
            ),
    );
  }

  void _showCreateRefillPopup(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    String branchName = '';
    String refillRequest = '';
    String requestedBy = '';

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Create Refill Request'),
          content: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(labelText: 'Branch Name'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter branch name';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    branchName = value!;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Refill Request'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter refill request';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    refillRequest = value!;
                  },
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Submit'),
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  final provider = Provider.of<BranchProvider>(context, listen: false);
                  final userProvider = Provider.of<Authprovider>(context, listen: false);
                  final branch = userProvider.user!.branch;
                  final requestedBy = userProvider.user!.FirstName + " " + userProvider.user!.LastName;
                  await provider.addRefill(branchName: branch, refillRequest: refillRequest, requestedBy: requestedBy, requestDate: DateTime.now());
                  Navigator.of(context).pop();
                }
              },
            ),
          ],
        );
      },
    );
  }

  void _showEditRefillPopup(BuildContext context, Refill refill) {
    final _formKey = GlobalKey<FormState>();
    String branchName = refill.branchName;
    String refillRequest = refill.refillRequest;
    String requestedBy = refill.requestedBy;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Edit Refill Request'),
          content: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                TextFormField(
                  initialValue: branchName,
                  decoration: InputDecoration(labelText: 'Branch Name'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter branch name';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    branchName = value!;
                  },
                ),
                TextFormField(
                  initialValue: refillRequest,
                  decoration: InputDecoration(labelText: 'Refill Request'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter refill request';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    refillRequest = value!;
                  },
                ),
                TextFormField(
                  initialValue: requestedBy,
                  decoration: InputDecoration(labelText: 'Requested By'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter requester\'s name';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    requestedBy = value!;
                  },
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Submit'),
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  final provider = Provider.of<BranchProvider>(context, listen: false);
                  await provider.editRefill(id: refill.id, NewData: {
                    'branch': branchName,
                    'refillRequest': refillRequest,
                    'requestedBy': requestedBy
                  });
                  Navigator.of(context).pop();
                }
              },
            ),
          ],
        );
      },
    );
  }
}
