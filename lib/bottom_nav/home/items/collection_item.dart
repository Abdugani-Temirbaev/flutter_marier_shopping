import 'package:flutter/material.dart';
import 'package:marier_shoping/custom_widgets/text_widget.dart';

class CollectionItem extends StatefulWidget {
  final String url;
  final String title;

  const CollectionItem({Key key, this.url, this.title}) : super(key: key);

  @override
  _CollectionItemState createState() => _CollectionItemState(url, title);
}

class _CollectionItemState extends State<CollectionItem> {
  final String url;
  final String title;

  _CollectionItemState(this.url, this.title);

  @override
  Widget build(BuildContext context) {
    double radius = 8.0;
    return Card(
      margin: EdgeInsets.all(8.0),
      elevation: 4.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
      child: Stack(
        children: [
          Container(alignment: Alignment.center, child: ClipRRect(borderRadius: BorderRadius.circular(radius), child: Image.network(url, height: 200, width: 300, fit: BoxFit.cover))),
          Container(
            height: 200,
            width: 300,
            alignment: Alignment.bottomLeft,
            child: TextWidget(title, color: Colors.white, weight: FontWeight.bold, padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0), maxLines: 1),
          ),
        ],
      ),
    );
  }
}
