import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:marier_shoping/custom_widgets/toast_utils.dart';
import 'package:marier_shoping/extensions.dart';
import 'package:marier_shoping/main.dart';

abstract class BasePage extends StatefulWidget {
  BasePage({Key key}) : super(key: key);
}

abstract class BasePageState<Page extends BasePage> extends State<Page> {}

mixin BasicPage<Page extends BasePage> on BasePageState<Page> {
  Widget body();

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white, body: body());
  }

  void showToast(String message) => ToastUtils.showCustomToast(context, message);

  AppBar getAppBarBack() {
    return AppBar(
      leading: IconButton(icon: SvgPicture.asset('arrow_left.svg'.getFromAssets()), onPressed: () => Navigator.of(context).pop()),
      actions: [
        IconButton(icon: SvgPicture.asset('filter.svg'.getFromAssets()), onPressed: () {}),
        IconButton(icon: SvgPicture.asset('shopping_bag.svg'.getFromAssets()), onPressed: () {}),
      ],
      backgroundColor: Colors.white,
      elevation: 1.0,
    );
  }
}
