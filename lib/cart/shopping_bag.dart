import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:marier_shoping/base_page.dart';
import 'package:marier_shoping/bottom_nav/category/item_page.dart';
import 'package:marier_shoping/cart/items/bag_item.dart';
import 'package:marier_shoping/cart/payment_info_page.dart';
import 'package:marier_shoping/custom_widgets/ScrollableFooterLayout.dart';
import 'package:marier_shoping/custom_widgets/text_widget.dart';
import 'package:marier_shoping/extensions.dart';

class ShoppingBagPage extends BasePage {
  @override
  _ShoppingBagPageState createState() => _ShoppingBagPageState();
}

List<BagItem> list = [
  BagItem(
      url: "https://images.unsplash.com/photo-1502716119720-b23a93e5fe1b?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=80",
      title: "Calf-length Wrap Dress",
      details: 'Grey, X-Large, Cotton',
      price: 39.40,
      deliveryTime: '8-10 Nov'),
  BagItem(
      url: "https://images.unsplash.com/photo-1505022610485-0249ba5b3675?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=80",
      title: "Puff-sleeved Blouse",
      details: 'Grey, X-Large, Cotton',
      price: 39.40,
      deliveryTime: '8-10 Nov'),
];

class _ShoppingBagPageState extends BasePageState<ShoppingBagPage> with BasicPage {
  bool isCartEmpty = false;

  @override
  Widget body() {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(leading: IconButton(icon: SvgPicture.asset('arrow_left.svg'.getFromAssets()), onPressed: () => Navigator.of(context).pop()), backgroundColor: Colors.white, elevation: 1.0),
      body: isCartEmpty ? _emptyCart() : _shoppingCart(),
    );
  }

  Widget _emptyCart() {
    return Column(mainAxisSize: MainAxisSize.max, mainAxisAlignment: MainAxisAlignment.center, children: [
      Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [SvgPicture.asset('icon_cart.svg'.getFromAssets()), TextWidget('Your cart is empty.\nFill your cart with great products from Marier.', size: 14.0)],
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 24.0, right: 24.0, bottom: 40.0),
        child: Row(children: [
          Expanded(
            child: ElevatedButton(
              style: ButtonStyle(
                shape: MaterialStateProperty.all<OutlinedBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(32.0))),
                padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.all(20.0)),
                backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF00CBFF)),
              ),
              child: TextWidget('SHOP NOW', weight: FontWeight.w600, color: Colors.white),
              onPressed: () {},
            ),
          ),
        ]),
      ),
    ]);
  }

  Widget _shoppingCart() {
    return ScrollableFooterLayout(
      padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
      children: [
        TextWidget('Shopping Bag', weight: FontWeight.w600, size: 20.0, padding: const EdgeInsets.only(top: 8.0, bottom: 24.0)),
        for (var item in list) GestureDetector(onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ItemPage(item.url))), child: item),
        Row(mainAxisAlignment: MainAxisAlignment.end, children: [TextWidget('Subtotal: ${_total()}\$', size: 12.0, padding: EdgeInsets.only(top: 8.0))]),
      ],
      footer: Padding(
        padding: const EdgeInsets.only(bottom: 24.0, top: 24.0),
        child: Row(
          children: [
            Expanded(
              child: ElevatedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<OutlinedBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(32.0))),
                  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.all(20.0)),
                  backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF00CBFF)),
                ),
                child: TextWidget('PAYMENT', weight: FontWeight.w600, color: Colors.white),
                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => PaymentInfoPage(_total()))),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _total() {
    double total = 0.0;
    for (BagItem item in list) total += item.price;
    return total.toStringAsFixed(2);
  }
}
