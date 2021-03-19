import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:marier_shoping/base_page.dart';
import 'package:marier_shoping/bottom_nav/category/category_page.dart';
import 'package:marier_shoping/bottom_nav/category/item_page.dart';
import 'package:marier_shoping/bottom_nav/home/items/featured_product_item.dart';
import 'package:marier_shoping/custom_widgets/text_form_field_widget.dart';
import 'package:marier_shoping/custom_widgets/text_widget.dart';
import 'package:marier_shoping/extensions.dart';

import 'items/collection_item.dart';

class NavHomePage extends BasePage {
  @override
  _NavHomePageState createState() => _NavHomePageState();
}

List<CollectionItem> collectionsList = [
  CollectionItem(url: "https://images.unsplash.com/photo-1556905055-8f358a7a47b2?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=300&q=80", title: "SPRING"),
  CollectionItem(
      url: "https://images.unsplash.com/photo-1441984904996-e0b6ba687e04?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=300&q=80", title: "CLASSIC"),
  CollectionItem(url: "https://images.unsplash.com/photo-1558769132-cb1aea458c5e?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=300&q=80", title: "AUTUMN"),
];
List<FeaturedProductItem> featuredProductsList = [
  FeaturedProductItem(
    url: "https://images.unsplash.com/photo-1581044777550-4cfa60707c03?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=300&q=80",
    title: 'Polka dot dress',
    oldPrice: 40.0,
    price: 28.0,
    sale: true,
  ),
  FeaturedProductItem(
    url: "https://images.unsplash.com/photo-1539109136881-3be0616acf4b?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=300&q=80",
    title: 'Fall in blue, Fall-Winter season',
    price: 99.9,
  ),
];

class _NavHomePageState extends BasePageState<NavHomePage> with BasicPage {
  String _search = '';

  @override
  Widget body() {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          TextFormFieldWidget(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            borderRadius: 6.0,
            enabledBorderColor: Color(0x506DCEE7),
            focusedBorderColor: Color(0xFF6DCEE7),
            hintText: 'Search',
            suffixIcon: IconButton(onPressed: () {}, icon: SvgPicture.asset('${'qr_code.svg'.getFromAssets()}', width: 20.0, height: 20.0)),
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.search,
            validator: (value) {
              if (value.isEmpty) {
                showToast('Please enter text to search');
                return '';
              }
              return null;
            },
            onSaved: (value) {
              _search = value;
              showToast(_search + ' saved');
            },
            onFieldSubmitted: (value) {
              _search = value;
              showToast(_search + ' submitted');
            },
          ),
          TextWidget('Collections', weight: FontWeight.w600, size: 20.0, padding: const EdgeInsets.only(top: 21.0, left: 24.0)),
          SizedBox(
            height: 200.0,
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              itemCount: collectionsList.length,
              itemBuilder: (_, index) =>
                  GestureDetector(onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => CategoryPage(collectionsList[index].title))), child: collectionsList[index]),
              scrollDirection: Axis.horizontal,
              shrinkWrap: false,
              physics: BouncingScrollPhysics(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 32.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextWidget('Featured Products', weight: FontWeight.w600, size: 20.0, padding: const EdgeInsets.only(left: 24.0), textAlign: TextAlign.center),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 24.0),
                  child: TextButton(
                    onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => CategoryPage('More'))),
                    child: TextWidget('More', size: 14.0, color: Color(0xFF6ECDE8)),
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<OutlinedBorder>(
                        RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.0), side: BorderSide(color: Color(0xFF00CBFF), width: 1.0)),
                      ),
                      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0)),
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 320.0,
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2 /*MediaQuery.of(context).orientation == Orientation.portrait ? 2 : 3*/),
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              itemCount: featuredProductsList.length,
              itemBuilder: (_, index) => GestureDetector(
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ItemPage(featuredProductsList[index].url))),
                child: featuredProductsList[index],
              ),
              scrollDirection: Axis.vertical,
              shrinkWrap: false,
              physics: BouncingScrollPhysics(),
            ),
          ),
        ],
      ),
    );
  }
}
