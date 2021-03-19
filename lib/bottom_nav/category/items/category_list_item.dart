import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:marier_shoping/bottom_nav/category/category_page.dart';
import 'package:marier_shoping/bottom_nav/category/item_page.dart';
import 'package:marier_shoping/custom_widgets/text_widget.dart';
import 'package:marier_shoping/extensions.dart';

class CategoryListItem extends StatefulWidget {
  final List<String> url;
  final String title;

  const CategoryListItem({Key key, this.url, this.title}) : super(key: key);

  @override
  _CategoryItemState createState() => _CategoryItemState(url, title);
}

class _CategoryItemState extends State<CategoryListItem> {
  final List<String> url;
  final String title;

  _CategoryItemState(this.url, this.title);

  @override
  Widget build(BuildContext context) {
    double radius = 6.0;
    double height = 120.0;
    return Column(
      children: [
        InkWell(
          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => CategoryPage(title))),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextWidget(title, size: 14.0, padding: EdgeInsets.only(left: 24.0, right: 16.0, top: 16.0, bottom: 16.0)),
              Container(margin: EdgeInsets.only(right: 32.0), child: SvgPicture.asset('arrow_right.svg'.getFromAssets())),
            ],
          ),
        ),
        SizedBox(
          height: height,
          child: ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 12.0),
            itemCount: url.length,
            itemBuilder: (_, index) => GestureDetector(
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ItemPage(url[index]))),
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: 12.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(radius),
                  child: Image.network(url[index], height: height, width: 90, fit: BoxFit.cover, alignment: Alignment.topCenter),
                ),
              ),
            ),
            scrollDirection: Axis.horizontal,
            shrinkWrap: false,
            physics: BouncingScrollPhysics(),
          ),
        ),
        SizedBox(height: 16.0),
      ],
    );
  }
}
