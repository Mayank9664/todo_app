import 'dart:convert';

class ModelPageView {
  String? title;
  String? subTitle;
  String? image;
  ModelPageView({
    this.title,
    this.subTitle,
    this.image,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'subTitle': subTitle,
      'image': image,
    };
  }

  factory ModelPageView.fromMap(Map<String, dynamic> map) {
    return ModelPageView(
      title: map['title'],
      subTitle: map['subTitle'],
      image: map['image'],
    );
  }
}
