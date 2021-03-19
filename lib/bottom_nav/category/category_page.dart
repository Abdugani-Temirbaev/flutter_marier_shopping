import 'package:flutter/material.dart';
import 'package:marier_shoping/base_page.dart';
import 'package:marier_shoping/bottom_nav/category/item_page.dart';
import 'package:marier_shoping/bottom_nav/home/items/featured_product_item.dart';
import 'package:marier_shoping/custom_widgets/text_widget.dart';

class CategoryPage extends BasePage {
  CategoryPage(this.title);

  final String title;

  @override
  _CategoryPageState createState() => _CategoryPageState(title);
}

List<FeaturedProductItem> list = [
  FeaturedProductItem(
    url: "https://images.unsplash.com/photo-1577525179375-b870f894a365?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=300&q=80",
    title: "Puff-sleeved Dress",
    price: 39.0,
    oldPrice: 59.0,
  ),
  FeaturedProductItem(
    url: "https://images.unsplash.com/photo-1557760697-63ea4de75a7e?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=300&q=80",
    title: "Rib-knit Sweater",
    price: 49,
  ),
  FeaturedProductItem(
    url: "https://images.unsplash.com/photo-1502716119720-b23a93e5fe1b?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=300&q=80",
    title: "Hoodie",
    price: 39,
    oldPrice: 59,
  ),
  FeaturedProductItem(
    url: "https://images.unsplash.com/photo-1503342217505-b0a15ec3261c?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=300&q=80",
    title: "Faux Fur Jacket",
    price: 49,
  ),
  FeaturedProductItem(
    url: "https://images.unsplash.com/photo-1478146896981-b80fe463b330?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=300&q=80",
    title: "Hoodie",
    price: 29,
  ),
  FeaturedProductItem(
    url: "https://images.unsplash.com/photo-1499939667766-4afceb292d05?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=300&q=80",
    title: "Jacket",
    price: 40,
    oldPrice: 89,
  ),
  FeaturedProductItem(
    url: "https://images.unsplash.com/photo-1577525179375-b870f894a365?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=300&q=80",
    title: "Puff-sleeved Dress",
    price: 39.0,
    oldPrice: 59.0,
  ),
  FeaturedProductItem(
    url: "https://images.unsplash.com/photo-1557760697-63ea4de75a7e?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=300&q=80",
    title: "Rib-knit Sweater",
    price: 49,
  ),
  FeaturedProductItem(
    url: "https://images.unsplash.com/photo-1502716119720-b23a93e5fe1b?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=300&q=80",
    title: "Hoodie",
    price: 39,
    oldPrice: 59,
  ),
  FeaturedProductItem(
    url: "https://images.unsplash.com/photo-1503342217505-b0a15ec3261c?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=300&q=80",
    title: "Faux Fur Jacket",
    price: 49,
  ),
  FeaturedProductItem(
    url: "https://images.unsplash.com/photo-1478146896981-b80fe463b330?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=300&q=80",
    title: "Hoodie",
    price: 29,
  ),
  FeaturedProductItem(
    url: "https://images.unsplash.com/photo-1499939667766-4afceb292d05?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=300&q=80",
    title: "Jacket",
    price: 40,
    oldPrice: 89,
  ),
];

class _CategoryPageState extends BasePageState<CategoryPage> with BasicPage {
  _CategoryPageState(this.title);

  final String title;

  @override
  Widget body() {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: getAppBarBack(),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            TextWidget(title, weight: FontWeight.w600, size: 20.0, padding: const EdgeInsets.only(top: 8.0, left: 24.0)),
            GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 300 / 500),
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              itemCount: list.length,
              itemBuilder: (_, index) => GestureDetector(onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ItemPage(list[index].url))), child: list[index]),
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
            ),
          ],
        ),
      ),
    );
  }
}
