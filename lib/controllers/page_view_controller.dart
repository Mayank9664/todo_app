import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:todo_app/models/model_page_view.dart';

class PageViewController extends GetxController {
  var selectedPageNumber = 0.obs;
  var pageController = PageController();

  List<ModelPageView> pageViewList = [
    ModelPageView(
      title: "First Title",
      subTitle: "First Sub Title",
      image:
          "https://images.pexels.com/photos/3551252/pexels-photo-3551252.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
    ),
    ModelPageView(
      title: "Second Title",
      subTitle: "Second Sub Title",
      image:
          "https://images.pexels.com/photos/12238175/pexels-photo-12238175.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
    ),
  ];
}
