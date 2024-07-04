import 'package:clean_a/branch_M/presentation/pages/branch_stock_page.dart';
import 'package:clean_a/branch_M/presentation/pages/refill_request_page.dart';
import 'package:clean_a/branch_M/presentation/widgets/add_branch.dart';
import 'package:clean_a/branch_M/presentation/widgets/branch_list_widget.dart';
import 'package:clean_a/branch_M/presentation/widgets/branch_stock_widet.dart';
import 'package:clean_a/customer/Presentation/add_autho_user.dart';
import 'package:clean_a/customer/Presentation/auto_user_list.dart';
import 'package:clean_a/customer/Presentation/pages/add_autorized_company.dart';
import 'package:clean_a/employee/presentation/page/EmployeeProfilePage.dart';
import 'package:clean_a/employee/presentation/page/attendance_pages.dart';
import 'package:clean_a/employee/presentation/page/salary_list_page.dart';
import 'package:clean_a/finance/presentation/pages/invoice_details.dart';
import 'package:clean_a/medicine/presentation/pages/add_medicine_page.dart';
import 'package:clean_a/medicine/presentation/pages/medicinedetail.dart';
import 'package:clean_a/medicine/presentation/widgets/Deletemed.dart';
import 'package:clean_a/report/presentation/widgets/generated_p_eports.dart';
import 'package:clean_a/report/presentation/widgets/reportPurchase.dart';
import 'package:clean_a/return/presentation/widgets/addDisposed.dart';
import 'package:clean_a/return/presentation/widgets/deleteDisposedItem.dart';
import 'package:clean_a/return/presentation/widgets/disposedlist.dart';
import 'package:clean_a/sales/presentation/widgets/sales.dart';
import 'package:clean_a/sales/presentation/widgets/sales_page.dart';
import 'package:clean_a/stock/presentation/widgets/expired_medicines.dart';
import 'package:clean_a/stock/presentation/widgets/list_of_stock.dart';
import 'package:clean_a/stock/presentation/widgets/out_of_stock.dart';
import 'package:clean_a/stock/presentation/widgets/stock_detail.dart';
import 'package:clean_a/supplier/presentation/widgets/add_supplier.dart';
import 'package:clean_a/supplier/presentation/widgets/supplier_list.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Pharmacy Demo',
        //#####Branch###########//
       
        //########customer#########//
        home: //AddAuthorizedCompany()
          //BranchListPage(),
         //BranchStockPage(),
         BranchStockWidget(data: [])
         //RefillRequestPage(),
         //AddBranch(),
        //AddMed(),          //added sidemenu
        //DeleteMed(),
       // MedicineDetail(),
       //BranchListWidget(data: [],),???
      // AuthorizedUser(),      // sidemenu
      // AddAuthorizedUser(),
       //AttendancePage(),
       //EmployeeProfilePage(),
          //SalaryListPage()
       //GeneratedPurchaseReports(),
       //ReportPGenerate(),
      //AddDisposed(),
      //DeleteDisposedItem(),
      //DisposedList(),
      //Sales(),
//ExpiredMedicinesPage(),
//ListOfStockPage(),
//OutOfStockItemsPage(),
//StockDetailPage(),
//AddSupplier(),
//SupplierLists(),

        );
  }
}
