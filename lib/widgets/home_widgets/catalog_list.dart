import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/catalog.dart';
import 'package:flutter_application_1/pages/home_details_page.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../models/catalog.dart';
import '../themes.dart';
import 'add_to_cart.dart';
import 'catalog_image.dart';
import 'package:flutter_application_1/pages/home_page.dart';

class CatalogList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int ans = CatalogModel.items.length;
    return ListView.builder(
        shrinkWrap: true,
        itemCount: CatalogModel.items.length,
        itemBuilder: (context, index) {
          final catalog = CatalogModel.items[index];
          return InkWell(
              onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeDetailPage(
                        catalog: catalog,
                      ),
                    ),
                  ),
              child: CatalogItem(catalog: catalog));
        });
  }
}

class CatalogItem extends StatelessWidget {
  final Item catalog;

  const CatalogItem({super.key, required this.catalog})
      : assert(catalog !=
            null); //assert gives warning in debugger if this thing gets null
  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: Row(
        children: [
          Hero(
            tag: Key(catalog.productId ?? " ID not available"),
            child: CatalogImage(
              image: catalog.productPhotos?[0] ??
                  "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcQ397Gzr8k8PfF_nrSTGrG6tSTi-FTSMChkfnVNS_cKuqFaZgBTlwt7xXtKCJICOaZQQhwKhTG_e42iNJBntsPlX37ZmCp4&usqp=CAE",
            ),
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              catalog.productTitle!.text
                  .size(10)
                  .maxLines(2)
                  .overflow(TextOverflow.ellipsis)
                  .color(Colors.blueGrey)
                  .bold
                  .make(),
              // catalog.desc.text.textStyle(context.captionStyle).make(),
              10.heightBox,
              ButtonBar(
                alignment: MainAxisAlignment.spaceBetween,
                buttonPadding: EdgeInsets.zero,
                children: [
                  "\$${int.parse(catalog.typicalPriceRange?[0] ?? "80")}"
                      .text
                      .bold
                      .make(),
                  AddToCart(catalog: catalog)
                ],
              ).pOnly(right: 8.0)
            ],
          ))
        ],
      ),
    ).color(context.cardColor).rounded.square(150).make().py12();
  }
}
