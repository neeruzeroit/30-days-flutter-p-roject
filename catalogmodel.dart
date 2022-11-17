import 'dart:core';

class CatalogModel {
  static List<Item>? items;


//get item by id
  Item getById(int id) =>
    items!.firstWhere((element) => element.id==id,orElse:null);

// get item by position
   Item getByPosition(int pos) => items![pos];
}

class Item {
  final int id;
  final String name;
  final num price;
  final String color;
  final String image;

  Item(
      {required this.id,
      required this.name,
      required this.price,
      required this.color,
      required this.image});

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      id: map["id"],
      name: map["name"],
      price: map["price"],
      color: map["color"],
      image: map["image"],
    );
  }

  toMap() => {
        "id": id,
        "name": name,
        "price": price,
        "color": color,
        "image": image,
      };

}