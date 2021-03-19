import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:marier_shoping/custom_widgets/text_widget.dart';
import 'package:marier_shoping/extensions.dart';

class AddressItem extends StatefulWidget {
  final String address;

  const AddressItem({this.address});

  @override
  _AddressItemState createState() => _AddressItemState(address);
}

class _AddressItemState extends State<AddressItem> {
  _AddressItemState(this.address);

  final String address;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(flex: 2, child: TextWidget(address, size: 14.0, ellipsis: false)),
          Expanded(
              flex: 1,
              child: Align(
                  alignment: Alignment.centerRight,
                  child: SvgPicture.asset(
                    'edit.svg'.getFromAssets(),
                    color: Color(0xFF00CBFF),
                  ))),
        ],
      ),
    );
  }
}
