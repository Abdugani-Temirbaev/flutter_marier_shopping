import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:marier_shoping/custom_widgets/text_widget.dart';
import 'package:marier_shoping/extensions.dart';

class WishItem extends StatefulWidget {
  final String url;
  final String title;
  final double price;

  WishItem({this.url, this.title, this.price});

  @override
  _WishItemState createState() => _WishItemState(url, title, price);
}

class _WishItemState extends State<WishItem> {
  _WishItemState(this.url, this.title, this.price);

  final String url;
  final String title;
  final double price;

  @override
  Widget build(BuildContext context) {
    double radius = 5.0;
    return Card(
      margin: EdgeInsets.only(bottom: 8.0),
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius), side: BorderSide(color: Color(0xFFEEEEEE))),
      child: Container(
        padding: EdgeInsets.all(16.0),
        child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Padding(padding: EdgeInsets.only(right: 16.0), child: CircleAvatar(backgroundImage: NetworkImage(url), radius: 35.0)),
          Flexible(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  TextWidget(title, padding: EdgeInsets.symmetric(vertical: 4.0), size: 12.0, weight: FontWeight.w600),
                  TextWidget('Price: \$${price.toString()}', padding: EdgeInsets.symmetric(vertical: 4.0), size: 12.0),
                ]),
                SvgPicture.asset('heart_fill.svg'.getFromAssets()),
              ]),
              Padding(padding: EdgeInsets.only(top: 12.0), child: Row(children: [TextWidget('Lowest Price for 6 month: \$${price - 10}', size: 12.0)])),
            ]),
          ),
        ]),
      ),
    );
  }
}
