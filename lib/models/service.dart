
enum Category {
  deepCleaning,
  maidServices,
  carCleaning,
  carpetCleaning,
}

class Service {
  const Service({
    required this.name,
    required this.time,
    required this.price,
    required this.rating,
    required this.orders,
    required this.category,
  });

final String name;
final int time;
final int price;
final double rating;
final int orders;
final Category category;
}