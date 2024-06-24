import 'dart:typed_data';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
class Item { 
     String name;
     int quantity;
     double price;
     double total;
    Item(
    {
      required this.name,
     required  this.quantity,
      required this.price,
      required this.total
      }
    
   );

  String getIndex(int index) {
    switch (index) {
      case 0:
        return name;
      case 1:
        return price.toString();
      case 2:
        return quantity.toString();
      case 3:
        return total.toString();
      
    }
    return '';
  }
   
  }
class Invoicecreator{

  Future<Uint8List?> generatePdf(Map<String,dynamic> invoiceData)async{
final doc = pw.Document();
     doc.addPage(
      pw.MultiPage(
        theme: pw.ThemeData.withFont(
 // icons: await PdfGoogleFonts.materialIcons(), // this line
),
        header: (context) => _buildHeader(context, invoiceData),
        footer:(context)=> _buildFooter(context,invoiceData),
         build: (context) => [
          _contentHeader(context,invoiceData),
          _contentTable(context,invoiceData),
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
                                    "INVOICE TO",
                                    style: const pw.TextStyle(
                                      fontSize: 12.0,
                                     
                                      
                                    ),
                                  ),
                                ),
                               pw.Padding(
                                  padding: pw.EdgeInsets.only(left: 50.0),
                                  child: pw.Text(
                                    "${invoiceData['customerName']}",
                                    style: pw.TextStyle(
                                      fontSize: 20.0,
                                      
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
                                    "${invoiceData['subTotal'].toString()}",
                                    style: pw.TextStyle(
                                      
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
                                      "${invoiceData['subTotal'].toString()}",
                                      style: pw.TextStyle(
                                        
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
                  invoiceData["companyAddress"] ?? "House #65, 4328 Marion Street\nNewbury, VT 05051",
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
                color: PdfColor(0, 1, 0, 1),
             
              ),
            ),
            pw.Text(
              "INVOICE ID: ${invoiceData["invoiceId"] ?? "66k5w3"}",
              style: pw.TextStyle(fontSize: 10.0),
            ),
            pw.Text(
              "DATE: ${invoiceData["createdAt"].toString() ?? "26 Jan,2020"}",
              style: pw.TextStyle(fontSize: 10.0),
            ),
          ],
        ),
      ),
    ],
  );
}pw.Widget _contentTable(pw.Context context, Map<String, dynamic> invoiceData) {
  const tableHeaders = [
    'InvoiceID',
    'Category',
    'Price',
    'Quantity',
    'Amount'
  ];
  
  List<dynamic> items = invoiceData['items'] ;

 List<Item> getItems(items){
     final List<Item> Products=[];
    for(final item in items){
       final name=item['name']! as String;
         final price=item['price'] as double;
         final quantity=item['quantity'] as int;
         final total=item['total'] as double;
       final newItem  =  Item(
         name:name,
         price:price,
         quantity:quantity,
         total:total
       );
       Products.add(
        newItem
       );
    }
    return Products;
  }
    final products = getItems(items);

  return pw.TableHelper.fromTextArray(
    border: null,
    cellAlignment: pw.Alignment.centerLeft,
    headerDecoration: pw.BoxDecoration(
      borderRadius: const pw.BorderRadius.all(pw.Radius.circular(2)),
      color: PdfColors.amber,
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
      color: PdfColor(1, 0.14, 0.196, 0.2),
      fontSize: 10,
     
    ),
    cellStyle:  pw.TextStyle(
      color: PdfColor(0, 0, 0, 1),
      fontSize: 10,
    ),
    rowDecoration: pw.BoxDecoration(
      border: pw.Border(
        bottom: pw.BorderSide(
          color: PdfColor(0, 0, 0, 1),
          width:.5,
        ),
      ),
    ),
    headers: tableHeaders,
    data: List<List<String>>.generate(
        
        products.length,
        (row) => List<String>.generate(
          tableHeaders.length,
          (col) => products[row].getIndex(col),
        ),
      ),
    );
}