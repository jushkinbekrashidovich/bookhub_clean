class NewBooks {
  String? id;
  String? title;
  String? description;
  String? ownerName;
  String? price;
  String? phoneNumber;
  String? photoUrl;
  int? order;
  String? category;

  NewBooks(
      {this.title,
      this.description,
      this.price,
      this.phoneNumber,
      this.photoUrl,
      this.order,
      this.ownerName,
      this.category,
      //this.isExchange,
      this.id});

  NewBooks.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
    ownerName = json['ownerName'];
    price = json['price'];
    phoneNumber = json['phone_number'];
    photoUrl = json['photo_url'];
    order = json['order'];
    category = json['category'];
    //isExchange = json['isExchange'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['title'] = title;
    data['description'] = description;
    data['price'] = price;
    data['phone_number'] = phoneNumber;
    data['photo_url'] = photoUrl;
    data['order'] = order;
    data['ownerName'] = ownerName;
    data['category'] = category;
    //data['isExchange'] = isExchange;
    return data;
  }
}
