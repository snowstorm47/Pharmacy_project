import 'dart:io';

import 'package:clean_a/customer/providers/customerProviders.dart';
import 'package:clean_a/sales/provider/sales_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class CreditCustomerScreen extends StatefulWidget {
  const CreditCustomerScreen({super.key});

  @override
  State<CreditCustomerScreen> createState() => _CreditCustomerScreenState();
}

class _CreditCustomerScreenState extends State<CreditCustomerScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() async {
      final provider = Provider.of<CustomerProvider>(context, listen: false);
      await provider.getAllcustomers();
      await provider.listCustomer();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Credit Customers'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildSearchBar(context),
            SizedBox(height: 20),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: _buildCompanyList(context)),
                  SizedBox(width: 20),
                  Expanded(child: _buildCustomerList(context)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBar(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.4, // Adjust the width as needed
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Search',
          prefixIcon: Icon(Icons.search),
          contentPadding: EdgeInsets.symmetric(vertical: 12),
        ),
        onChanged: (value) {
          context.read<CustomerProvider>().filter(value);
        },
      ),
    );
  }

  Widget _buildCompanyList(BuildContext context) {
    return Consumer<CustomerProvider>(
      builder: (context, provider, child) {
        final companies = provider.customer!;
        if (companies.isEmpty) {
          return Center(child: Text('No companies available.'));
        }

        return Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: EdgeInsets.all(8),
                color: Colors.blue,
                child: Text(
                  'Company List',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(height: 8),
              Expanded(
                child: ListView.builder(
                  itemCount: companies.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: CircleAvatar(
                        child: Text(companies[index].companyName[0]),
                      ),
                      title: Text(companies[index].companyName),
                      onTap: () {
                        try{
                        Provider.of<CustomerProvider>(context,listen:false).selectCompany(companies[index]);}
                        catch(e){
                          print(e.toString());
                        }
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildCustomerList(BuildContext context) {
    return Consumer<CustomerProvider>(
      builder: (context, provider, child) {
        final customers = provider.employee!;
        if (customers.isEmpty) {
          return Center(child: Text('No customers available.'));
        }

        return Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: EdgeInsets.all(8),
                color: Colors.blue,
                child: Text(
                  'Customer List',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(height: 8),
              Expanded(
                child: ListView.builder(
                  itemCount: customers.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: CircleAvatar(
                        child: Text(
                          customers[index].firstName[0] + customers[index].lastName[0],
                        ),
                      ),
                      title: Text(customers[index].firstName + ' ' + customers[index].lastName),
                      subtitle: Text('Credit Limit: ${customers[index].credit.toString()}'),
                      onTap: () async {
                        // Logic to proceed with the selected credit customer
                        try{final salesProvider = Provider.of<SalesProvider>(context, listen: false);
                        await salesProvider.sellCredit(
                          salesProvider.cart!,
                          customers[index].employeeId,
                           customers[index].company,
                          '1',
                        );}
                        catch(e){
                          print(e.toString());
                        }
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
