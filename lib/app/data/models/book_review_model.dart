class BookReview {
  String? id;
  String? title;
  String? description;
  String? ownerName;
  String? userId;
  int? postedTimestamp;
  int? likes;

  BookReview(
      {this.title,
      this.description,
      this.userId,
      this.postedTimestamp,
      this.ownerName,
      this.likes,
      this.id});

  BookReview.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
    ownerName = json['ownerName'];
    userId = json['userId'];
    postedTimestamp = json['postedTimestamp'];
    likes = json['likes'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['title'] = title;
    data['description'] = description;
    data['userId'] = userId;
    data['postedTimestamp'] = postedTimestamp;
    data['ownerName'] = ownerName;
    data['likes'] = likes;
    return data;
  }
}
