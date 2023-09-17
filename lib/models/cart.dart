import 'package:flutter_application_1/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

import '../core/store.dart';

class CartModel {
  // //catalog field
  late CatalogModel _catalog;
  // Collection of IDs - store Ids of each item
  final List<int> _itemIds = [];

  //Get Catalog
  CatalogModel get catalog => _catalog;
  //Set Catalog
  set catalog(CatalogModel newCatalog) {
    assert(newCatalog != null);
    _catalog = newCatalog;
  }

  //Get items in the cart
  List<Item> get items => _itemIds
      .map((id) => _catalog.getById(id))
      .toList(); // we'll get all the items in the cart from here

  num get totalPrice => items.fold(
      0, (total, current) => total + int.parse(current.typicalPriceRange?[0] ?? "80")); // if any Item have typicalPriceRange as null set it 80 as default value
}

class AddMutation extends VxMutation<MyStore> {
  final Item item;
  AddMutation(this.item);
  @override
  perform() {
    final numericPart = item.productId!.replaceAll(RegExp(r'[^0-9]'), '');
    final trimmedNumericPart = numericPart.substring(0, 4);
    store?.cart._itemIds.add(int.parse(trimmedNumericPart));
  }
}

class RemoveMutation extends VxMutation<MyStore> {
  final Item item;
  RemoveMutation(this.item);
  @override
  perform() {
    final numericPart = item.productId!.replaceAll(RegExp(r'[^0-9]'), '');
    final trimmedNumericPart = numericPart.substring(0, 4);
    store?.cart._itemIds.remove(int.parse(trimmedNumericPart));
  }
}
