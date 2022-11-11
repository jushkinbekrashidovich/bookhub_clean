class OrderBooks {
  String? userName;
  String? bookTitle;
  String? phoneNumber;
   int? postedTimestamp;

  

  OrderBooks(


      {
        this.userName,
        this.bookTitle,
      this.phoneNumber,
      this.postedTimestamp,
      });

  OrderBooks.fromJson(Map<String, dynamic> json) {
    userName = json['userName'];
    bookTitle = json['bookTitle'];
    phoneNumber = json['phoneNumber'];
    postedTimestamp = json['postedTimestamp'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
      data['userName'] = userName;
    data['bookTitle'] = bookTitle;
    data['phoneNumber'] = phoneNumber;
     data['postedTimestamp'] = postedTimestamp;
    return data;
  }
}
