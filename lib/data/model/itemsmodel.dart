class ItemsModel {
  int? itemId;
  String? itemName;
  String? itemNameAr;
  String? itemDesc;
  String? itemDescAr;
  String? itemImage;
  int? itemCount;
  int? itemActive;
  double? itemPrice;
  int? itemDiscount;
  double? itemPriceDicount;
  String? itemDate;
  int? itemCat;
  int? categoriesId;
  String? categoriesName;
  String? categoriesNameAr;
  String? categoriesImage;
  String? categoriesCreationdata;
  int? favorite;

  ItemsModel({
    this.itemId,
    this.itemName,
    this.itemNameAr,
    this.itemDesc,
    this.itemDescAr,
    this.itemImage,
    this.itemCount,
    this.itemActive,
    this.itemPrice,
    this.itemDiscount,
    this.itemPriceDicount,
    this.itemDate,
    this.itemCat,
    this.categoriesId,
    this.categoriesName,
    this.categoriesNameAr,
    this.categoriesImage,
    this.categoriesCreationdata,
    this.favorite,
  });

  ItemsModel.fromJson(Map<String, dynamic> json) {
    itemId = json['item_id'];
    itemName = json['item_name'];
    itemNameAr = json['item_name_ar'];
    itemDesc = json['item_desc'];
    itemDescAr = json['item_desc_ar'];
    itemImage = json['item_image'];
    itemCount = json['item_count'];
    itemActive = json['item_active'];
    itemPrice = json['item_price'];
    itemDiscount = json['item_discount'];
    itemPriceDicount = json['itempricedicount'];
    itemDate = json['item_date'];
    itemCat = json['item_cat'];
    categoriesId = json['categories_id'];
    categoriesName = json['categories_name'];
    categoriesNameAr = json['categories_name_ar'];
    categoriesImage = json['categories_image'];
    categoriesCreationdata = json['categories_creationdata'];
    favorite = json['favorite'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['item_id'] = itemId;
    data['item_name'] = itemName;
    data['item_name_ar'] = itemNameAr;
    data['item_desc'] = itemDesc;
    data['item_desc_ar'] = itemDescAr;
    data['item_image'] = itemImage;
    data['item_count'] = itemCount;
    data['item_active'] = itemActive;
    data['item_price'] = itemPrice;
    data['item_discount'] = itemDiscount;
    data['itempricedicount'] = itemPriceDicount;
    data['item_date'] = itemDate;
    data['item_cat'] = itemCat;
    data['categories_id'] = categoriesId;
    data['categories_name'] = categoriesName;
    data['categories_name_ar'] = categoriesNameAr;
    data['categories_image'] = categoriesImage;
    data['categories_creationdata'] = categoriesCreationdata;
    data['favorite'] = favorite;
    return data;
  }
}
