import 'dart:typed_data';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
class ExpenseInvoiceCreator{
 Future<Uint8List?> generatePdf(Map<String,dynamic> expenseData)async{
final doc = pw.Document();
     doc.addPage(
      pw.MultiPage(
        theme: pw.ThemeData.withFont(
 // icons: await PdfGoogleFonts.materialIcons(), // this line
),
        header: (context) => _buildHeader(context, expenseData),
        footer:(context)=> _buildFooter(context,expenseData),
         build: (context) => [
          _contentHeader(context,expenseData),
          _contentTable(context,expenseData),
          pw.SizedBox(height: 20),
          pw.SizedBox(height: 20),
        // _termsAndConditions(context),
        ],)
        );
        return doc.save();}
        
  }
  pw.Widget _buildHeader(pw.Context context,Map<String, dynamic> invoiceData){
    return pw.Column(
    children: [
      pw.Container(
           child: pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                              children: [
                                pw.Padding(
                                  padding: pw.EdgeInsets.only(left: 50.0),
                                  child: pw.Text(
                                    "Expense Invoice",
                                    style: pw.TextStyle(
                                      fontSize: 12.0,
                                      fontWeight: pw.FontWeight.bold,
                                    ),
                                  ),
                                ),
                               pw.Padding(
                                  padding: pw.EdgeInsets.only(left: 50.0),
                                  child: pw.Text(
                                    "${invoiceData['expenseHeader']}",
                                    style: pw.TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: pw.FontWeight.bold,
                                    ),
                                  ),
                                ),
    
    ]))
    ]
    );
  }
  pw.Widget _buildFooter(pw.Context context , Map<String, dynamic> invoiceData){
    return pw.Column(children: [
      pw. Padding(
       padding: pw.EdgeInsets.only(top: 18.0),
                      child: pw.Row(
                        mainAxisAlignment: pw.MainAxisAlignment.end,
                        children: [
                         pw.Container(
                            child: pw.Column(
                              crossAxisAlignment: pw.CrossAxisAlignment.start,
                              children: [
                                pw.Text(
                                  "Subtotal:",
                                  style: pw.TextStyle(
                                    fontWeight: pw.FontWeight.bold,
                                    fontSize: 15.0,
                                  ),
                                ),
                                pw.Text(
                                  "Processing Fee:",
                                  style: pw.TextStyle(
                                    fontSize: 12.0,
                                  ),
                                ),
                                pw.Text(
                                  "TAX",
                                  style: pw.TextStyle(
                                    fontSize: 12.0,
                                  ),
                                  )
                              ]
                              )
                              )
                              ]
                              )
                              ),
  pw.Padding(
                            padding:
                                pw.EdgeInsets.only(left: 20.0, right: 100.0),
                            child: pw.Container(
                              child: pw.Column(
                                crossAxisAlignment: pw.CrossAxisAlignment.start,
                                children: [
                                  pw.Text(
                                    "${invoiceData['subTotal']}",
                                    style: pw.TextStyle(
                                      fontWeight: pw.FontWeight.bold,
                                      fontSize: 15.0,
                                    ),
                                  ),
                                  pw.Text(
                                    "10.0",
                                    style: pw.TextStyle(
                                      fontSize: 12.0,
                                    ),
                                  ),
                                  pw.Text(
                                    "15%",
                                    style: pw.TextStyle(
                                      fontSize: 12.0,
                                    ),
                                  ),
                                  pw.Padding(
                                    padding: pw.EdgeInsets.only(top: 8.0),
                                    child: pw.Text(
                                      "${invoiceData['subTotal']}",
                                      style: pw.TextStyle(
                                        fontWeight: pw.FontWeight.bold,
                                        fontSize: 15.0,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                              );    
  }
pw.Widget _contentHeader(pw.Context context, Map<String, dynamic> invoiceData) {
  return pw.Row(
    children: [
      // Company Information (Left Side)
      pw.Expanded(
        child: pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Row(
              children: [
                // pw.Icon(
                //   Icons.location_on,
                //   color: pw.PdfColors.green,
                // ),
                pw.SizedBox(width: 10.0),
                pw.Text(
                  invoiceData["companyAddress"] ?? null,
                  style: pw.TextStyle(fontSize: 10.0),
                ),
              ],
            ),
            pw.Row(
              children: [
                // pw.Icon(
                //   PdfIcons.phone,
                //   color: PdfColors.green,
                // ),
                pw.SizedBox(width: 10.0),
                pw.Text(
                  invoiceData["companyPhone"] ?? "+012 8764 556",
                  style: pw.TextStyle(fontSize: 10.0),
                ),
              ],
            ),
          ],
        ),
      ),

      // Invoice Details (Right Side)
      pw.Expanded(
        child: pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.end,
          children: [
            pw.Text(
              "INVOICE",
              style: pw.TextStyle(
                fontSize: 20.0,
                color: PdfColors.green,
                fontWeight: pw.FontWeight.bold,
              ),
            ),
            pw.Text(
              "INVOICE ID: ${invoiceData["invoiceId"] ?? null}",
              style: pw.TextStyle(fontSize: 10.0),
            ),
            pw.Text(
              "DATE: ${invoiceData["createdAt"] ?? null}",
              style: pw.TextStyle(fontSize: 10.0),
            ),
          ],
        ),
      ),
    ],
  );
}
 pw.Widget _contentTable(pw.Context context, Map<String, dynamic> invoiceData) {
  const tableHeaders = [
    'InvoiceID',
    'Category',
    "Date", // Changed 'Catagory' to 'Category' for better spellin
    'Amount',
    'ExpenseHead',
  ];
 

  String getIndex(int index) {
    switch (index) {
      case 0:
        return invoiceData['invoiceId'];
      case 1:
        return invoiceData['catagory'];
      case 2:
        return invoiceData['createdAt'].toString();
      case 3:
        return invoiceData['amount'].toString();
      case 4:
        return invoiceData['expenseHead'];
      default:
        return ""; // Or throw an exception if an unexpected index is used
    }
  }

  return pw.TableHelper.fromTextArray(
    border: null,
    cellAlignment: pw.Alignment.centerLeft,
    headerDecoration: pw.BoxDecoration(
      borderRadius: const pw.BorderRadius.all(pw.Radius.circular(2)),
      color: PdfColor.fromHex('0xFFECEDF7'),
    ),
    headerHeight: 25,
    cellHeight: 40,
    cellAlignments: {
      0: pw.Alignment.centerLeft,
      1: pw.Alignment.centerLeft,
      2: pw.Alignment.centerRight,
      3: pw.Alignment.center,
      4: pw.Alignment.centerRight,
    },
    headerStyle: pw.TextStyle(
      color: PdfColor(255, 14, 196, 20),
      fontSize: 10,
      fontWeight: pw.FontWeight.bold,
    ),
    cellStyle: const pw.TextStyle(
      color: PdfColors.black,
      fontSize: 10,
    ),
    rowDecoration: pw.BoxDecoration(
      border: pw.Border(
        bottom: pw.BorderSide(
          color: PdfColors.black,
          width: .5,
        ),
      ),
    ),
    headers: List<String>.generate(
      tableHeaders.length,
      (col) => tableHeaders[col],
    ),
    data: List<List<String>>.generate(
      invoiceData['items'].length, // Use items.length instead of catagory.length
      (row) => List<String>.generate(
        tableHeaders.length,
        (col) => invoiceData[row].getIndex(col),
      ),
    ),
  );
}