import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatefulWidget {
  final double borderRadius;
  final Color enabledBorderColor;
  final Color focusedBorderColor;
  final String hintText;
  final IconButton suffixIcon;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final FormFieldSetter<String> onSaved;
  final ValueChanged<String> onFieldSubmitted;
  final FormFieldValidator<String> validator;
  final bool obscureText;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry margin;
  final TextEditingController controller;
  final FocusNode focusNode;
  final VoidCallback onEditingComplete;
  final ValueChanged<String> onChanged;
  final String initialValue;

  const TextFormFieldWidget({
    Key key,
    this.borderRadius = 4.0,
    this.enabledBorderColor = Colors.grey,
    this.focusedBorderColor = Colors.blue,
    this.hintText = '',
    this.suffixIcon,
    this.keyboardType,
    this.textInputAction,
    this.onSaved,
    this.onFieldSubmitted,
    this.validator,
    this.obscureText = false,
    this.padding,
    this.margin,
    this.controller,
    this.focusNode,
    this.onEditingComplete,
    this.onChanged,
    this.initialValue,
  }) : super(key: key);

  @override
  _TextFormFieldWidgetState createState() => _TextFormFieldWidgetState();
}

class _TextFormFieldWidgetState extends State<TextFormFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: widget.padding,
      margin: widget.margin,
      child: TextFormField(
        decoration: getTextFormFieldDecoration(widget.borderRadius, widget.enabledBorderColor,
            widget.focusedBorderColor, widget.hintText, widget.suffixIcon),
        style: TextStyle(fontFamily: 'Montserrat'),
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.done,
        obscureText: widget.obscureText,
        validator: widget.validator,
        onSaved: widget.onSaved,
        onFieldSubmitted: widget.onFieldSubmitted,
        controller: widget.controller,
        focusNode: widget.focusNode,
        onEditingComplete: widget.onEditingComplete,
        onChanged: widget.onChanged,
        initialValue: widget.initialValue,
      ),
    );
  }

  InputDecoration getTextFormFieldDecoration(double borderRadius, Color enabledBorderColor,
      Color focusedBorderColor, String hintText, IconButton suffixIcon) {
    return InputDecoration(
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(color: enabledBorderColor, width: 1.0)),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(color: focusedBorderColor, width: 2.0)),
      errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(color: Colors.red, width: 1.0)),
      focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(color: Colors.red, width: 2.0)),
      contentPadding: EdgeInsets.symmetric(horizontal: 20.0),
      hintText: hintText,
      hintStyle: TextStyle(fontFamily: 'Montserrat', color: Color(0xFFCDCDCD)),
      errorStyle: TextStyle(fontSize: 0.1),
      suffixIcon: suffixIcon,
    );
  }
}
