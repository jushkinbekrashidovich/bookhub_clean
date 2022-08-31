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
  String? authorName;
  String? type;
  

  NewBooks(
      {this.title,
      this.description,
      this.price,
      this.phoneNumber,
      this.photoUrl,
      this.order,
      //this.isExchange,
      this.authorName,
      this.type,
      this.id});

  NewBooks.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
    price = json['price'];
    phoneNumber = json['phone_number'];
    photoUrl = json['photo_url'];
    order = json['order'];
    authorName = json['authorName'];
    type = json['type'];
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
    data['authorName'] = authorName;
    data['type'] = type;
    //data['isExchange'] = isExchange;
    return data;
  }
}
