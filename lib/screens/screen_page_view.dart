// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/controllers/page_view_controller.dart';

class ScreenPageView extends StatefulWidget {
  const ScreenPageView({Key? key}) : super(key: key);

  @override
  State<ScreenPageView> createState() => _ScreenPageViewState();
}

class _ScreenPageViewState extends State<ScreenPageView> {
  final PageViewController pageViewController = Get.put(PageViewController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: PageView.builder(
            itemCount: 2,
            controller: pageViewController.pageController,
            itemBuilder: (context, int i) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  children: [
                    Text(
                      "This is Title By Todo Branch",
                      style: TextStyle(
                        fontSize: 23,
                        color: Colors.orange,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "This is Sub-Title By Todo Branch",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      // height: 100,
                      child: Image.network(
                          "https://images.pexels.com/photos/3551252/pexels-photo-3551252.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
