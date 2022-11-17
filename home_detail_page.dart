import 'package:flutter/material.dart';
import 'package:flutter_new_app/pages/home_widgets/_addtocart.dart';
import 'package:flutter_new_app/pages/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';
import 'widgets/models/catalogmodel.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catalog;

  const HomeDetailPage({
    Key? key,
    required this.catalog,
  })  : assert(catalog != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Colors.white,
      bottomNavigationBar: ButtonBar(
        alignment: MainAxisAlignment.spaceBetween,
        children: [
          "\$${catalog.price}".text.bold.xl4.red800.make(),
          AddToCart(catalog: catalog)
        ],
      ).p16(),
      body: SafeArea(
          child: Column(
        children: [
          Hero(
              tag: Key(catalog.id.toString()),
              child: Image.network(
                catalog.image,
              ).p64()),
          Expanded(
            child: VxArc(
                height: 10,
                arcType: VxArcType.CONVEY,
                edge: VxEdge.TOP,
                child: Container(
                  color: Color.fromARGB(255, 255, 255, 255),
                  width: context.screenWidth,
                  child: Column(
                    children: [
                      catalog.name.text.xl2
                          .color(MyTheme.darkBluishcolor)
                          .bold
                          .make(),
                      10.heightBox,
                      "We’re offering all our customers 80% additional ad credits on their wallet amount for every wallet load of Rs. 10,000 and above. In addition, redeem creative credits to get customised creatives designed by our experts. Avail our offer today to build brand awareness, generate leads, and boost sales with higher return on investment."
                          .text
                          .textStyle(context.captionStyle)
                          .make()
                          .px1()
                    ],
                  ).px32(),
                )),
          ),
        ],
      )),
    );
  }
}
