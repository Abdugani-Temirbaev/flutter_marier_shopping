import 'package:flutter/material.dart';
import 'package:marier_shoping/custom_widgets/text_widget.dart';

class NavCategoryItem extends StatefulWidget {
  final String url;
  final String title;

  const NavCategoryItem({Key key, this.url, this.title}) : super(key: key);

  @override
  _NavCategoryItemState createState() => _NavCategoryItemState(url, title);
}

class _NavCategoryItemState extends State<NavCategoryItem> {
  final String url;
  final String title;

  _NavCategoryItemState(this.url, this.title);

  @override
  Widget build(BuildContext context) {
    double radius = 8.0;
    double height = 160.0;
    return Card(
      margin: EdgeInsets.all(8.0),
      elevation: 4.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
      child: Stack(
        children: [
          Container(
              alignment: Alignment.center,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(radius), child: Image.network(url, height: height, width: MediaQuery.of(context).size.width, fit: BoxFit.cover, alignment: Alignment.topCenter))),
          Container(
            height: height,
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.bottomLeft,
            child: TextWidget(title, color: Colors.white, weight: FontWeight.bold, padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0)),
          ),
        ],
      ),
    );
  }
}
