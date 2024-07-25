class Cart{
   List<Item> items;
   Cart({
    required this.items
   });
}
class Item{
  String medicineName;
  int quantity;
  double price;
Item({
   required this.medicineName,
   required this.quantity,
   required this.price
});
 factory Item.fromMap(Map<String,dynamic> data)=> 
  Item(
   
    medicineName:data['medicineName'] as String,
    quantity: data['quantity'] as int,
    price:data['price'] as double,
    );
  
   Map<String,dynamic> toMap()=>{
   
    'medicineName':medicineName,
    'quantity':quantity,
    'price':price
  };
}