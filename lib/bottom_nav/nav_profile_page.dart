import 'package:flutter/material.dart';
import 'package:marier_shoping/base_page.dart';
import 'package:marier_shoping/custom_widgets/text_widget.dart';

class NavProfilePage extends BasePage {
  @override
  _NavProfilePageState createState() => _NavProfilePageState();
}

class _NavProfilePageState extends BasePageState<NavProfilePage> with BasicPage {
  @override
  Widget body() {
    return TextWidget('ProfilePage');
  }
}
