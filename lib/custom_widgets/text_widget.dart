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
  _TextWidgetState createState() => _TextWidgetState(text, size, weight, color, textAlign, padding, margin, decoration, maxLines, ellipsis, fontStyle);
}

class _TextWidgetState extends State<TextWidget> {
  _TextWidgetState(this.text, this.size, this.weight, this.color, this.textAlign, this.padding, this.margin, this.decoration, this.maxLines, this.ellipsis, this.fontStyle);

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
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      margin: margin,
      child: Text(
        text,
        style: TextStyle(fontFamily: 'Montserrat', fontSize: size, fontWeight: weight, color: color, decoration: decoration, fontStyle: fontStyle),
        textAlign: textAlign,
        maxLines: maxLines,
        overflow: ellipsis ? TextOverflow.ellipsis : null,
      ),
    );
  }
}
