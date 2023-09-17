// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:math';

import 'package:flutter/foundation.dart';

class CatalogModel {
  static List<Item> items = [];

  // Get Item by ID

  Item getById(int id) {
    return items.firstWhere((element) {
      final productId = element.productId;

      if (productId == null) {
        return false; // Handle null productId
      }

      final numericPart = productId.replaceAll(RegExp(r'[^0-9]'),
          ''); // Remove non-numeric characters from productId

      final trimmedNumericPart = numericPart.substring(0,
          4); // reducing the string length so that it does'nt exceed integer lenght when parsed in int
      final parsedProductId = int.tryParse(trimmedNumericPart ?? "");
      return parsedProductId ==
          id; // if id we're passing matches with any productId then return the first productId to which it matches
    },
        orElse: () =>
            Item()); // Return a default Item if no matching item is found
  }

  // Get Item by position
  Item getByPosition(int pos) => items[pos];
}

class Item {
  String? productId;
  String? productTitle;
  String? productDescription;
  List<String>? productPhotos;
  ProductAttributes? productAttributes;
  double? productRating;
  String? productPageUrl;
  String? productOffersPageUrl;
  String? productSpecsPageUrl;
  String? productReviewsPageUrl;
  num? productNumReviews;
  List<String>? typicalPriceRange;
  Offer? offer;

  Item(
      {this.productId,
      this.productTitle,
      this.productDescription,
      this.productPhotos,
      this.productAttributes,
      this.productRating,
      this.productPageUrl,
      this.productOffersPageUrl,
      this.productSpecsPageUrl,
      this.productReviewsPageUrl,
      this.productNumReviews,
      this.typicalPriceRange,
      this.offer});

  Item.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    productTitle = json['product_title'];
    productDescription = json['product_description'];
    productPhotos = (json['product_photos'] as List<dynamic>?)?.cast<String>();
    productAttributes = json['product_attributes'] != null
        ? ProductAttributes.fromJson(json['product_attributes'])
        : null;
    productPageUrl = json['product_page_url'];
    productOffersPageUrl = json['product_offers_page_url'];
    productSpecsPageUrl = json['product_specs_page_url'];
    productReviewsPageUrl = json['product_reviews_page_url'];

    // Handle parsing of numeric values
    if (json['product_rating'] is String) {
      final ratingString = json['product_rating'];
      productRating = double.tryParse(ratingString.replaceAll('\$', '')) ?? 0.0;
    } else {
      productRating = json['product_rating']?.toDouble() ?? 0.0;
    }

    // Handle parsing of numeric values
    if (json['product_num_reviews'] is String) {
      final numReviewsString = json['product_num_reviews'];
      productNumReviews =
          int.tryParse(numReviewsString.replaceAll('\$', '')) ?? 0;
    } else {
      productNumReviews = json['product_num_reviews']?.toInt() ?? 0;
    }

    // Remove dollar signs from typical_price_range if present
    if (json['typical_price_range'] != null) {
      typicalPriceRange = json['typical_price_range'].map<String>((value) {
        if (value is double) {
          final roundedValue = value.round();
          return roundedValue.toString(); // Convert to string after rounding.
        } else if (value is String && value.startsWith('\$')) {
          final doubleValue = double.tryParse(value.replaceAll('\$', ''));
          if (doubleValue != null) {
            final roundedValue = doubleValue.round();
            return roundedValue.toString();
          } else {
            return value;
          }
        } else {
          return value.toString();
        }
      }).toList();
    } else {
      typicalPriceRange = null;
    }

    offer = json['offer'] != null ? Offer.fromJson(json['offer']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_id'] = this.productId;
    data['product_title'] = this.productTitle;
    data['product_description'] = this.productDescription;
    data['product_photos'] = this.productPhotos;
    if (this.productAttributes != null) {
      data['product_attributes'] = this.productAttributes!.toJson();
    }
    data['product_rating'] = this.productRating;
    data['product_page_url'] = this.productPageUrl;
    data['product_offers_page_url'] = this.productOffersPageUrl;
    data['product_specs_page_url'] = this.productSpecsPageUrl;
    data['product_reviews_page_url'] = this.productReviewsPageUrl;
    data['product_num_reviews'] = this.productNumReviews;
    data['typical_price_range'] = this.typicalPriceRange;
    if (this.offer != null) {
      data['offer'] = this.offer!.toJson();
    }
    return data;
  }
}

class ProductAttributes {
  String? features;
  String? sIMSlots;
  String? operatingSystem;
  String? broadbandGeneration;
  String? lensQuantity;
  String? cellularNetwork;

  ProductAttributes(
      {this.features,
      this.sIMSlots,
      this.operatingSystem,
      this.broadbandGeneration,
      this.lensQuantity,
      this.cellularNetwork});

  ProductAttributes.fromJson(Map<String, dynamic> json) {
    features = json['Features'];
    sIMSlots = json['SIM Slots'];
    operatingSystem = json['Operating System'];
    broadbandGeneration = json['Broadband Generation'];
    lensQuantity = json['Lens Quantity'];
    cellularNetwork = json['Cellular Network'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Features'] = this.features;
    data['SIM Slots'] = this.sIMSlots;
    data['Operating System'] = this.operatingSystem;
    data['Broadband Generation'] = this.broadbandGeneration;
    data['Lens Quantity'] = this.lensQuantity;
    data['Cellular Network'] = this.cellularNetwork;
    return data;
  }
}

class Offer {
  String? storeName;
  double? storeRating;
  String? offerPageUrl;
  int? storeReviewCount;
  String? storeReviewsPageUrl;
  String? price;
  String? shipping;
  String? tax;
  bool? onSale;
  Null? originalPrice;
  String? productCondition;

  Offer(
      {this.storeName,
      this.storeRating,
      this.offerPageUrl,
      this.storeReviewCount,
      this.storeReviewsPageUrl,
      this.price,
      this.shipping,
      this.tax,
      this.onSale,
      this.originalPrice,
      this.productCondition});

  Offer.fromJson(Map<String, dynamic> json) {
    storeName = json['store_name'];
    storeRating = json['store_rating'];
    offerPageUrl = json['offer_page_url'];
    storeReviewCount = json['store_review_count'];
    storeReviewsPageUrl = json['store_reviews_page_url'];
    price = json['price'];
    shipping = json['shipping'];
    tax = json['tax'];
    onSale = json['on_sale'];
    originalPrice = json['original_price'];
    productCondition = json['product_condition'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['store_name'] = this.storeName;
    data['store_rating'] = this.storeRating;
    data['offer_page_url'] = this.offerPageUrl;
    data['store_review_count'] = this.storeReviewCount;
    data['store_reviews_page_url'] = this.storeReviewsPageUrl;
    data['price'] = this.price;
    data['shipping'] = this.shipping;
    data['tax'] = this.tax;
    data['on_sale'] = this.onSale;
    data['original_price'] = this.originalPrice;
    data['product_condition'] = this.productCondition;
    return data;
  }
}
