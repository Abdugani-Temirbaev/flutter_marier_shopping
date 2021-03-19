import 'package:flutter/material.dart';
import 'package:marier_shoping/base_page.dart';
import 'package:marier_shoping/bottom_nav/category/item_page.dart';
import 'package:marier_shoping/custom_widgets/text_widget.dart';
import 'package:marier_shoping/drawer/last_viewed/items/viewed_item.dart';

class LastViewedPage extends BasePage {
  @override
  _LastViewedPageState createState() => _LastViewedPageState();
}

List<ViewedItem> list = [
  ViewedItem(
      url: "https://images.unsplash.com/photo-1502716119720-b23a93e5fe1b?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=80",
      title: "Calf-length Wrap Dress",
      details: '',
      price: 39.40,
      deliveryTime: '8-10 Nov'),
  ViewedItem(
      url: "https://images.unsplash.com/photo-1505022610485-0249ba5b3675?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=80",
      title: "Puff-sleeved Blouse",
      details: '',
      price: 39.40,
      deliveryTime: '8-10 Nov'),
];

class _LastViewedPageState extends BasePageState<LastViewedPage> with BasicPage {
  @override
  Widget body() {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextWidget('Last Viewed', weight: FontWeight.w600, size: 20.0, padding: const EdgeInsets.only(top: 8.0, bottom: 24.0)),
            for (var item in list) GestureDetector(onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ItemPage(item.url))), child: item),
          ],
        ),
      ),
    );
  }
}
