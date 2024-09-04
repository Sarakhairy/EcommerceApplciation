class UserFavoriteItems {
  int? itemId;
  String? itemName;
  String? itemNameAr;
  String? itemDesc;
  String? itemDescAr;
  String? itemImage;
  int? itemCount;
  int? itemActive;
  int? itemPrice;
  int? itemDiscount;
  String? itemDate;
  int? itemCat;
  int? favoriteId;
  int? favoriteUserid;
  int? favoriteItemid;
  int? userId;

  UserFavoriteItems(
      {this.itemId,
      this.itemName,
      this.itemNameAr,
      this.itemDesc,
      this.itemDescAr,
      this.itemImage,
      this.itemCount,
      this.itemActive,
      this.itemPrice,
      this.itemDiscount,
      this.itemDate,
      this.itemCat,
      this.favoriteId,
      this.favoriteUserid,
      this.favoriteItemid,
      this.userId});

  UserFavoriteItems.fromJson(Map<String, dynamic> json) {
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
    itemDate = json['item_date'];
    itemCat = json['item_cat'];
    favoriteId = json['favorite_id'];
    favoriteUserid = json['favorite_userid'];
    favoriteItemid = json['favorite_itemid'];
    userId = json['user_id'];
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
    data['item_date'] = itemDate;
    data['item_cat'] = itemCat;
    data['favorite_id'] = favoriteId;
    data['favorite_userid'] = favoriteUserid;
    data['favorite_itemid'] = favoriteItemid;
    data['user_id'] = userId;
    return data;
  }
}
