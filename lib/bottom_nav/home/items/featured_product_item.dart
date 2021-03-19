import 'package:flutter/material.dart';
import 'package:marier_shoping/custom_widgets/text_widget.dart';

class FeaturedProductItem extends StatefulWidget {
  final String url;
  final String title;
  final bool sale;
  final double price;
  final double oldPrice;

  const FeaturedProductItem({Key key, this.url, this.title, this.sale = false, this.price, this.oldPrice}) : super(key: key);

  @override
  _FeaturedProductItemState createState() => _FeaturedProductItemState(url, title, sale, price, oldPrice);
}

class _FeaturedProductItemState extends State<FeaturedProductItem> {
  final String url;
  final String title;
  final bool sale;
  final double price;
  final double oldPrice;

  _FeaturedProductItemState(this.url, this.title, this.sale, this.price, this.oldPrice);

  @override
  Widget build(BuildContext context) {
    double radius = 10.0;
    return Card(
      margin: EdgeInsets.all(8.0),
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
      child: Wrap(
        spacing: 100.0,
        children: [
          Stack(
            children: [
              ClipRRect(borderRadius: BorderRadius.circular(radius), child: Image.network(url, height: 250, width: MediaQuery.of(context).size.width, fit: BoxFit.cover)),
              sale
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Card(
                          child: Center(child: TextWidget('SALE', size: 12.0, color: Colors.white, weight: FontWeight.w600, padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0))),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
                          color: Color(0xFF00CBFF),
                          margin: EdgeInsets.only(top: 32.0, right: 8.0),
                        ),
                      ],
                    )
                  : Container(),
            ],
          ),
          TextWidget(title, padding: EdgeInsets.symmetric(vertical: 4.0)),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextWidget('\$${price.toString()}', size: 20.0, weight: FontWeight.w600, padding: EdgeInsets.only(right: 8.0)),
              oldPrice != null ? TextWidget('\$${oldPrice.toString()}', size: 14.0, color: Color(0xFFCCCED0), decoration: TextDecoration.lineThrough) : Container(),
            ],
          )
        ],
      ),
    );
  }
}
