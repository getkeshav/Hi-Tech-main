
class CatalogModel {
   static List<Item> items = []; // items have list of all the Item(like list of all the products each having properties like product_id, product_title, etc )

  // Method to Get Item by ID
  Item getById(int id) =>
      items.firstWhere((element) => element.productId == id, orElse: null);
      // we want to get Item by id , where the Item's id is matching with the id which we've passed,
      // the first element/Item staisfying the condition will be returned, if the condition is not satisfied 
      // (i.e passed id doesn't match with any element/Item id then return null)
      // we'll pass the id of the element/Item which we click and it is returned by getById method

  // Get Item by position
  Item getByPosition(int pos) => items[pos];
  String? status;
  String? requestId;
  List<Item>? data;

  CatalogModel({this.status, this.requestId, this.data});

  CatalogModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    requestId = json['request_id'];
    if (json['data'] != null) {
      data = <Item>[];
      json['data'].forEach((v) {
        data!.add(new Item.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['request_id'] = this.requestId;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Item {
  String? productId;
  String? productIdV2;
  String? productTitle;
  String? productDescription;
  List<String>? productPhotos;
  ProductAttributes? productAttributes;
  double? productRating;
  String? productPageUrl;
  String? productOffersPageUrl;
  String? productSpecsPageUrl;
  String? productReviewsPageUrl;
  int? productNumReviews;
  List<String>? typicalPriceRange;
  Offer? offer;

  Item(
      {this.productId,
      this.productIdV2,
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
    productIdV2 = json['product_id_v2'];
    productTitle = json['product_title'];
    productDescription = json['product_description'];
    productPhotos = json['product_photos'].cast<String>();
    productAttributes = json['product_attributes'] != null
        ? new ProductAttributes.fromJson(json['product_attributes'])
        : null;
    productRating = json['product_rating'];
    productPageUrl = json['product_page_url'];
    productOffersPageUrl = json['product_offers_page_url'];
    productSpecsPageUrl = json['product_specs_page_url'];
    productReviewsPageUrl = json['product_reviews_page_url'];
    productNumReviews = json['product_num_reviews'];
    typicalPriceRange = json['typical_price_range'].cast<String>();
    offer = json['offer'] != null ? new Offer.fromJson(json['offer']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_id'] = this.productId;
    data['product_id_v2'] = this.productIdV2;
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
  String? department;
  String? size;
  String? material;
  String? color;
  String? closureStyle;
  String? features;
  String? style;
  String? athleticStyle;
  String? toeStyle;

  ProductAttributes(
      {this.department,
      this.size,
      this.material,
      this.color,
      this.closureStyle,
      this.features,
      this.style,
      this.athleticStyle,
      this.toeStyle});

  ProductAttributes.fromJson(Map<String, dynamic> json) {
    department = json['Department'];
    size = json['Size'];
    material = json['Material'];
    color = json['Color'];
    closureStyle = json['Closure Style'];
    features = json['Features'];
    style = json['Style'];
    athleticStyle = json['Athletic Style'];
    toeStyle = json['Toe Style'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Department'] = this.department;
    data['Size'] = this.size;
    data['Material'] = this.material;
    data['Color'] = this.color;
    data['Closure Style'] = this.closureStyle;
    data['Features'] = this.features;
    data['Style'] = this.style;
    data['Athletic Style'] = this.athleticStyle;
    data['Toe Style'] = this.toeStyle;
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
  String? originalPrice;
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
