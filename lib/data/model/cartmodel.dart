class CartModel {
  int? itemprice;
  int? countitems;
  int? cartId;
  int? cartUserid;
  int? cartItemid;
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

  CartModel(
      {this.itemprice,
      this.countitems,
      this.cartId,
      this.cartUserid,
      this.cartItemid,
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
      this.itemDate,
      this.itemCat});

  CartModel.fromJson(Map<String, dynamic> json) {
    itemprice = json['itemprice'];
    countitems = json['countitems'];
    cartId = json['cart_id'];
    cartUserid = json['cart_userid'];
    cartItemid = json['cart_itemid'];
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
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['itemprice'] =  itemprice;
    data['countitems'] = countitems;
    data['cart_id'] =    cartId;
    data['cart_userid'] = cartUserid;
    data['cart_itemid'] = cartItemid;
    data['item_id'] =     itemId;
    data['item_name'] =   itemName;
    data['item_name_ar'] =itemNameAr;
    data['item_desc'] =   itemDesc;
    data['item_desc_ar'] = itemDescAr;
    data['item_image'] =   itemImage;
    data['item_count'] =itemCount;
    data['item_active'] = itemActive;
    data['item_price'] =  itemPrice;
    data['item_discount'] =itemDiscount;
    data['item_date'] =     itemDate;
    data['item_cat'] =      itemCat;
    return data;
  }
}