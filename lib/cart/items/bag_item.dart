import 'package:flutter/material.dart';
import 'package:marier_shoping/custom_widgets/text_widget.dart';

class BagItem extends StatefulWidget {
  final String url;
  final String title;
  final String details;
  final double price;
  final String deliveryTime;

  BagItem({this.url, this.title, this.details, this.price, this.deliveryTime});

  @override
  _BagItemState createState() => _BagItemState(url, title, details, price, deliveryTime);
}

class _BagItemState extends State<BagItem> {
  _BagItemState(this.url, this.title, this.details, this.price, this.deliveryTime);

  final String url;
  final String title;
  final String details;
  final double price;
  final String deliveryTime;

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
                  TextWidget(details, padding: EdgeInsets.symmetric(vertical: 4.0), size: 12.0),
                ]),
                TextWidget('\$${price.toString()}', padding: EdgeInsets.symmetric(vertical: 4.0), size: 12.0),
              ]),
              Padding(padding: EdgeInsets.only(top: 12.0), child: Row(children: [TextWidget('Delivery: ', weight: FontWeight.w600, size: 12.0), TextWidget(deliveryTime, size: 12.0)])),
            ]),
          ),
        ]),
      ),
    );
  }
}
