
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_new_app/core/store.dart';
import 'package:flutter_new_app/pages/widgets/models/cartmodel.dart';
import 'package:flutter_new_app/pages/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

import '../widgets/models/catalogmodel.dart';

class AddToCart extends StatelessWidget {
  final Item catalog;
   AddToCart({
    Key? key,
    required this.catalog,
  }) : super(key: key);

   
  @override
  Widget build(BuildContext context) {

    final CartModel _cart = (VxState.store as MyStore).cart as CartModel;
     bool isIncart = _cart.items.contains(catalog)?? false;
    return ElevatedButton(
        onPressed: () {
          if(!isIncart){
             isIncart = isIncart.toggle();
          final _catalog = CatalogModel();
           final _cart = CartModel();
           _cart.catalog = _catalog;
          _cart.add(catalog);
          
          }
        },
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(MyTheme.darkBluishcolor),
            shape: MaterialStateProperty.all(const StadiumBorder())),
        child: isIncart ? Icon(Icons.done) : Icon(CupertinoIcons.cart_badge_plus));
  }
}
