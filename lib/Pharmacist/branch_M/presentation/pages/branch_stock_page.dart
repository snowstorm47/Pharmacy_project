import 'package:clean_a/branch_M/Provider/branchProvides.dart';
import 'package:clean_a/branch_M/data/models/branch_stock_data.dart';
import 'package:clean_a/branch_M/presentation/widgets/branch_stock_widet.dart';
import 'package:clean_a/dashboard/presentation/pages/header_page.dart';
import 'package:clean_a/medicine/domain/entities/batch.dart';
import 'package:clean_a/medicine/domain/entities/medicine.dart';
import 'package:clean_a/medicine/providers/medicine_provider.dart';
import 'package:clean_a/shared/models/puser.dart';
import 'package:clean_a/shared/services/providers/authProvider.dart';
import 'package:clean_a/shared/utility/responsiveDrawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../Drawer/sidemenupage.dart';

class BranchStockPageP extends StatefulWidget {
  const BranchStockPageP({super.key});

  @override
  BranchStockPageState createState() => BranchStockPageState();
}

class BranchStockPageState extends State<BranchStockPageP> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool showSideMenu = false;
  bool isLoading = true;
    List<Medicine> med = [];
  List<Batch> batch = [];
  PUser? user;
   @override
  void initState() {
    super.initState();
    // Fetch data from provider
    Future.microtask(() async {
      final brprovider = Provider.of<BranchProvider>(context, listen: false);
      final provider = Provider.of<MedicineProvider>(context, listen: false);
      final userProvider = Provider.of<Authprovider>(context,listen:false);
      
      await provider.getMedicines();
      await provider.getColor();
      await brprovider.getBranches();
      setState(() {
        isLoading = false;
         med = provider.medicines ?? []; // Initialize `med`
        batch = provider.batches ?? [];
        user=userProvider.user ; // Initialize `batch`
      });
    });
  }

  @override
  Widget build(BuildContext context) {
      final provider = Provider.of<MedicineProvider>(context, listen: false);
    final userProvider = Provider.of<Authprovider>(context, listen: false);
    final med = provider.medicines ?? [];
    final batch = provider.batches ?? [];
    final medColors = provider.medColor ?? [];
    final user = userProvider.user ?? null;
    return Scaffold(
      key: _scaffoldKey,
      body: SafeArea(
        child: Stack(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (ResponsiveD.isDesktop(context))
                  Expanded(
                    child: SideMenuPharmacist(
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      HeaderPage(
                        onMenuPressed: () {
                          setState(() {
                            showSideMenu = !showSideMenu;
                          });
                          if (!ResponsiveD.isDesktop(context)) {
                            _scaffoldKey.currentState?.openDrawer();
                          }
                        },
                        isSideMenuOpen: showSideMenu,
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: BranchStockWidget(
                                data:batch,med:med,medColor:medColors,branch:user!.branch),
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
                child: SideMenuPharmacist(
                  onClose: () {
                    setState(() {
                      showSideMenu = false;
                    });
                    _scaffoldKey.currentState?.openEndDrawer();
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}
