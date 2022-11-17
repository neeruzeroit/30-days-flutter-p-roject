import 'package:flutter/material.dart';
import 'package:flutter_new_app/pages/home_widgets/_addtocart.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter_new_app/pages/home_detail_page.dart';
import 'package:flutter_new_app/pages/home_widgets/catalog_image.dart';
import 'package:flutter_new_app/pages/widgets/models/catalogmodel.dart';
import 'package:flutter_new_app/pages/widgets/themes.dart';

class CatalogList extends StatelessWidget {
  const CatalogList({super.key});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogModel.items?.length,
      itemBuilder: (context, index) {
        final catalog = CatalogModel.items![index];
        return InkWell(
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => HomeDetailPage(
                        catalog: catalog,
                      ))),
          child: CatalogItem(catalog: catalog),
        );
      },
    );
  }
}

class CatalogItem extends StatelessWidget {
  final Item catalog;

  const CatalogItem({
    Key? key,
    required this.catalog,
  })  : assert(catalog != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    var children2 = [
      "\$${catalog.price}".text.bold.xl.make(),
      ElevatedButton(
        onPressed: () {},
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(MyTheme.darkBluishcolor),
            shape: MaterialStateProperty.all(const StadiumBorder())),
        child: "Add to cart".text.make(),
      ),
    ];
    return VxBox(
        child: Row(
      children: [
        Hero(
          tag: Key(catalog.id.toString()),
          child: CatalogImage(image: catalog.image),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              catalog.name.text.lg.color(MyTheme.darkBluishcolor).bold.make(),
              10.heightBox,
              ButtonBar(alignment: MainAxisAlignment.spaceBetween, children: [
                "\$${catalog.price}".text.bold.xl.make(),
                AddToCart(catalog: catalog)
              ]),
            ],
          ),
        )
      ],
    )).white.rounded.square(150).make().py16();
  }
}


