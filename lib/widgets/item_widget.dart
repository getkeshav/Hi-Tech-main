import 'package:flutter/material.dart';

import '../models/catalog.dart';
import '../pages/home_page.dart';

class ItemWidget extends StatelessWidget {
  final Item item;
  const ItemWidget({super.key, required this.item}) : assert(item != null);
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () {
          print("${item.productTitle ?? 'No Title Available'} pressed");
        },
        leading: Image.network(item.productPhotos![0]),
        title: Text(item.productTitle!),
        subtitle: Text(item.productDescription?? " A cutting-edge technical product designed to enhance efficiency and convenience in modern life. This innovative device combines state-of-the-art technology with user-friendly features to deliver a seamless experience. Whether it's streamlining everyday tasks, improving connectivity, or enhancing productivity, this product is engineered to meet the demands of today's fast-paced world. With its sleek design and robust performance, it's the perfect solution for anyone seeking to embrace the future of technology."),
        trailing: Text(
          "\$${int.parse(item.typicalPriceRange![0])}",
          textScaleFactor: 1.5,
          style: TextStyle(
            color: Colors.deepPurple,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
