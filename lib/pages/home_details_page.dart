import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/catalog.dart';
import 'package:flutter_application_1/widgets/home_widgets/add_to_cart.dart';
import 'package:velocity_x/velocity_x.dart';

import '../widgets/themes.dart';
import 'home_page.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catalog;

  const HomeDetailPage({super.key, required this.catalog})
      : assert(catalog != null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      bottomNavigationBar: Container(
        color: context.cardColor,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: EdgeInsets.zero,
          children: [
            "\$${int.parse(catalog.typicalPriceRange?[0] ?? "80")}"
                .text
                .bold
                .xl4
                .red800
                .make()
                .px16(),
            AddToCart(catalog: catalog).wh(120, 50),
          ],
        ).pOnly(right: 8.0).py32(),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: context.canvasColor,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
              tag: Key(catalog.productId.toString()),
              child: Image.network(
                catalog.productPhotos![0],
              ),
            ).h32(context),
            Expanded(
              child: VxArc(
                height: 30.0,
                arcType: VxArcType.CONVEY,
                edge: VxEdge.TOP,
                child: Container(
                  color: context.cardColor,
                  width: context.screenWidth,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        30.heightBox,
                        GestureDetector(
                          onTap: () {
                            // Show a modal bottom sheet with the full product title.
                            showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return Container(
                                  padding: EdgeInsets.all(16.0),
                                  child: Text(
                                    catalog.productTitle!,
                                    style: TextStyle(
                                      fontSize:
                                          20.0, // Set the font size for the full title
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                          child: Text(
                            catalog.productTitle!,
                            maxLines: 2,
                            overflow: TextOverflow
                                .ellipsis, // Add ellipsis for product title
                            style: TextStyle(
                              fontSize: 24.0, // Set font size
                              color: MyTheme.darkBluishColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ).p12(),
                        ),
                        GestureDetector(
                          onTap: () {
                            // Show a modal bottom sheet with a scrollable product description.
                            showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return SingleChildScrollView(
                                  child: Container(
                                    padding: EdgeInsets.all(16.0),
                                    child: Text(
                                      catalog.productDescription!,
                                      style: TextStyle(
                                        fontSize:
                                            18.0, // Set the font size for the full description
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                          child: Text(
                            catalog.productDescription!,
                            maxLines: 5, // Show at least 3 lines
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize:
                                  14.0, // Set a larger font size for the ellipsed text
                            ),
                          ).p12(),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
