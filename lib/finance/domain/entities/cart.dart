class Cart{
   List<Item> items;
   Cart({
    required this.items
   });
}
class Item{
  String medicineName;
  int quantity;
Item({
   required this.medicineName,
   required this.quantity
});
 factory Item.fromMap(Map<String,dynamic> data)=> 
  Item(
   
    medicineName:data['medicineName'] as String,
    quantity: data['quantity'] as int
    );
  
   Map<String,dynamic> toMap()=>{
   
    'medicineName':medicineName,
    'quantity':quantity
  };
}