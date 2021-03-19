import 'package:flutter/material.dart';
import 'package:marier_shoping/base_page.dart';
import 'package:marier_shoping/bottom_nav/category/category_list_page.dart';
import 'package:marier_shoping/bottom_nav/category/items/nav_category_item.dart';
import 'package:marier_shoping/custom_widgets/text_widget.dart';

class NavCategoryPage extends BasePage {
  @override
  _NavCategoryPageState createState() => _NavCategoryPageState();
}

List<NavCategoryItem> categoryList = [
  NavCategoryItem(
      url: "https://images.unsplash.com/photo-1502716119720-b23a93e5fe1b?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=80", title: "WOMAN"),
  NavCategoryItem(url: "https://images.unsplash.com/photo-1505022610485-0249ba5b3675?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=80", title: "MAN"),
  NavCategoryItem(
      url: "https://images.unsplash.com/photo-1509924603848-aca5e5f276d7?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=500&q=80", title: "KIDS"),
];

class _NavCategoryPageState extends BasePageState<NavCategoryPage> with BasicPage {
  @override
  Widget body() {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          TextWidget('Category', weight: FontWeight.w600, size: 20.0, padding: const EdgeInsets.only(top: 8.0, left: 24.0, bottom: 8.0)),
          ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            itemCount: categoryList.length,
            itemBuilder: (_, index) => GestureDetector(
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => CategoryListPage(categoryList[index].title))),
              child: categoryList[index],
            ),
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
          ),
        ],
      ),
    );
  }
}
