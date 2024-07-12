import 'package:clean_a/branch_M/Provider/branchProvides.dart';
import 'package:clean_a/branch_M/domain/entities/branch.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BranchListWidget extends StatelessWidget {
  const BranchListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<BranchProvider>(
      builder: (context, value, child) => LayoutBuilder(
        builder: (context, constraints) {
          bool isTablet = constraints.maxWidth > 600;
          double padding = isTablet ? 46.0 : 16.0;

          return Padding(
            padding: EdgeInsets.all(padding),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _buildHeader(isTablet),
                  const SizedBox(height: 20),
                  _buildButtons(isTablet),
                  const SizedBox(height: 20),
                  _buildTable(value, isTablet),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildHeader(bool isTablet) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Branch List',
          style: TextStyle(fontSize: isTablet ? 23 : 20),
        ),
        Text(
          'View and Edit Branches',
          style: TextStyle(fontSize: isTablet ? 23 : 20),
        ),
      ],
    );
  }

  Widget _buildButtons(bool isTablet) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          _buildButton(
            icon: Icons.add,
            label: 'Add Items',
            color: const Color.fromARGB(236, 27, 228, 4),
            onPressed: () {},
            isTablet: isTablet,
          ),
          const SizedBox(width: 20),
          _buildButton(
            icon: Icons.format_line_spacing_sharp,
            label: 'Filter By',
            color: const Color.fromRGBO(33, 150, 243, 1),
            onPressed: () {},
            isTablet: isTablet,
          ),
          const SizedBox(width: 20),
          _buildButton(
            icon: Icons.delete,
            label: 'Delete Items',
            color: const Color.fromARGB(255, 230, 79, 68),
            onPressed: () {},
            isTablet: isTablet,
          ),
        ],
      ),
    );
  }

  Widget _buildButton({
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback onPressed,
    required bool isTablet,
  }) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
        backgroundColor: color,
      ),
      onPressed: onPressed,
      child: Row(
        children: [
          Icon(icon, color: Colors.white, size: isTablet ? 17 : 15),
          SizedBox(width: isTablet ? 17 : 10),
          Text(label, style: const TextStyle(color: Colors.white)),
        ],
      ),
    );
  }

  Widget _buildTable(BranchProvider value, bool isTablet) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Table(
        columnWidths: {
          0: FixedColumnWidth(isTablet ? 150 : 120),
          1: FixedColumnWidth(isTablet ? 150 : 120),
          2: FixedColumnWidth(isTablet ? 150 : 120),
          3: FixedColumnWidth(isTablet ? 150 : 120),
          4: FixedColumnWidth(isTablet ? 150 : 120),
        },
        children: [
          _buildHeaderRow(isTablet),
          ...value.branches!.asMap().entries.map(
                (entry) => _buildDataRow(entry.key, entry.value, isTablet),
              ),
        ],
      ),
    );
  }

  TableRow _buildHeaderRow(bool isTablet) {
    return TableRow(
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(2.0),
      ),
      children: [
        _buildHeaderCell('Index', isTablet),
        _buildHeaderCell('Name', isTablet),
        _buildHeaderCell('Manager', isTablet),
        _buildHeaderCell('Address', isTablet),
        _buildHeaderCell('Email', isTablet),
      ],
    );
  }

  TableRow _buildDataRow(int index, Branch data, bool isTablet) {
    return TableRow(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(2.0),
      ),
      children: [
        _buildDataCell(index.toString(), isTablet),
        _buildDataCell(data.BranchName, isTablet),
        _buildDataCell(data.BranchManager, isTablet),
        _buildDataCell(data.Address, isTablet),
        _buildDataCell(data.BranchEmail, isTablet),
      ],
    );
  }

  Widget _buildHeaderCell(String text, bool isTablet) {
    return Padding(
      padding: EdgeInsets.all(isTablet ? 12.0 : 8.0),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildDataCell(String text, bool isTablet) {
    return Padding(
      padding: EdgeInsets.all(isTablet ? 12.0 : 8.0),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.black,
        ),
      ),
    );
  }
}