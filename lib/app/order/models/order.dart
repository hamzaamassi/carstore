class Order {
  String name;
  int quantity;
  double discount;
  String image;
  double price;
  double totalAfterDiscount; // Non-late field

  Order({
    required this.name,
    required this.quantity,
    required this.image,
    required this.price,
    this.discount = 0.0,
  }) : totalAfterDiscount = price * quantity - discount { // Field initializer
    // Additional logic can be added here if needed
  }
}
