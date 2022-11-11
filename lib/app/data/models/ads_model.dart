class Ads {
  String? id;
  String? photo_url;
  String? post_url;

  Ads({
    this.photo_url,
    this.post_url,
  });

  Ads.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    photo_url = json['photo_url'];
    post_url = json['post_url'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['photo_url'] = photo_url;
    data['post_url'] = post_url;
    return data;
  }
}
