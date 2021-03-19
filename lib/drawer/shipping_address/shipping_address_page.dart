import 'package:flutter/material.dart';
import 'package:marier_shoping/base_page.dart';
import 'package:marier_shoping/custom_widgets/ScrollableFooterLayout.dart';
import 'package:marier_shoping/custom_widgets/text_widget.dart';
import 'package:marier_shoping/drawer/shipping_address/address_page.dart';
import 'package:marier_shoping/drawer/shipping_address/items/AddressItem.dart';

class ShippingAddressPage extends BasePage {
  @override
  _ShippingAddressPageState createState() => _ShippingAddressPageState();
}

List<AddressItem> list = [AddressItem(address: 'Home: 4043 Willis Avenue, TRAPPER CREEK, 99638'), AddressItem(address: 'Work: 1923 Meadowbrook Mall Road, Gardena, CA, 90248')];

class _ShippingAddressPageState extends BasePageState<ShippingAddressPage> with BasicPage {
  @override
  Widget body() {
    return ScrollableFooterLayout(
      padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
      children: [
        TextWidget('My Address', weight: FontWeight.w600, size: 20.0, padding: const EdgeInsets.only(top: 8.0, bottom: 12.0)),
        for (var item in list) GestureDetector(onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => AddressPage(address: item.address))), child: item),
      ],
      footer: Padding(
        padding: const EdgeInsets.only(bottom: 12.0, top: 24.0),
        child: Row(
          children: [
            Expanded(
              child: ElevatedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<OutlinedBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(32.0))),
                  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.all(20.0)),
                  backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF00CBFF)),
                ),
                child: TextWidget('ADD NEW ADDRESS', weight: FontWeight.w600, color: Colors.white),
                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => AddressPage())),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
