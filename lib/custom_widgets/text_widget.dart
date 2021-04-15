import 'package:flutter/material.dart';

class TextWidget extends StatefulWidget {
  const TextWidget(
    this.text, {
    this.size = 16.0,
    this.weight = FontWeight.normal,
    this.color = Colors.black,
    this.textAlign = TextAlign.start,
    this.padding,
    this.margin,
    this.decoration,
    this.maxLines,
    this.ellipsis = true,
    this.fontStyle,
  });

  final String text;
  final double size;
  final FontWeight weight;
  final Color color;
  final TextAlign textAlign;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry margin;
  final TextDecoration decoration;
  final int maxLines;
  final bool ellipsis;
  final FontStyle fontStyle;

  @override
  _TextWidgetState createState() => _TextWidgetState();
}

class _TextWidgetState extends State<TextWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: widget.padding,
      margin: widget.margin,
      child: Text(
        widget.text,
        style: TextStyle(
            fontFamily: 'Montserrat',
            fontSize: widget.size,
            fontWeight: widget.weight,
            color: widget.color,
            decoration: widget.decoration,
            fontStyle: widget.fontStyle),
        textAlign: widget.textAlign,
        maxLines: widget.maxLines,
        overflow: widget.ellipsis ? TextOverflow.ellipsis : null,
      ),
    );
  }
}
