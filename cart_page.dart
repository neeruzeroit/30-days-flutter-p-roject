import 'package:flutter/material.dart';
import 'package:flutter_new_app/core/store.dart';
import 'package:flutter_new_app/pages/widgets/models/cartmodel.dart';
import 'package:flutter_new_app/pages/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.creamcolor,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 248, 246, 246),
        title: "Cart".text.color(MyTheme.darkBluishcolor).make(),
      ),
      body: Column(children: [
        CartList().p32().expand(),
        Divider(),
        _CartTotal(),
      ]),
    );
  }
}

class _CartTotal extends StatelessWidget {
  final _cart = CartModel();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          "\$${_cart.totalPrice}"
              .text
              .xl5
              .color(MyTheme.darkBluishcolor)
              .make(),
          30.widthBox,
          ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: "Buying not supported yet".text.make()));
            },
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(MyTheme.darkBluishcolor)),
            child: "Buy".text.white.make(),
          ),
        ],
      ),
    );
  }
}

class CartList extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
   final CartModel _cart = (VxState.store as MyStore).cart as CartModel;
    return _cart.items.isEmpty
        ? "Nothing to show".text.xl3.makeCentered()
        : ListView.builder(
            itemCount: _cart.items?.length,
            itemBuilder: (context, index) => ListTile(
                  leading: Icon(Icons.done),
                  trailing: IconButton(
                    icon: Icon(Icons.remove_circle_outline),
                    onPressed: () {
                      _cart.remove(_cart.items[index]);
                      
                    },
                  ),
                  title: _cart.items[index].name.text.make(),
                ));
  }
}
