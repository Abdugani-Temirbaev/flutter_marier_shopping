import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:marier_shoping/base_page.dart';
import 'package:marier_shoping/bottom_nav/category/nav_category_page.dart';
import 'package:marier_shoping/bottom_nav/nav_featured_page.dart';
import 'package:marier_shoping/bottom_nav/home/nav_home_page.dart';
import 'package:marier_shoping/bottom_nav/nav_profile_page.dart';
import 'package:marier_shoping/custom_widgets/ScrollableFooterLayout.dart';
import 'package:marier_shoping/custom_widgets/text_widget.dart';
import 'package:marier_shoping/drawer/help/help_page.dart';
import 'package:marier_shoping/drawer/language/language_page.dart';
import 'package:marier_shoping/drawer/last_viewed/last_viewed_page.dart';
import 'package:marier_shoping/drawer/orders/orders_page.dart';
import 'package:marier_shoping/drawer/settings/settings_page.dart';
import 'package:marier_shoping/drawer/shipping_address/shipping_address_page.dart';
import 'package:marier_shoping/drawer/wish_list/wish_list_page.dart';
import 'package:marier_shoping/extensions.dart';
import 'package:marier_shoping/cart/shopping_bag.dart';

class MainPage extends BasePage {
  @override
  _MainPageState createState() => _MainPageState();
}

enum TabItem { home, category, featured, profile }

class _MainPageState extends BasePageState<MainPage> with BasicPage {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int _selectedIndex = 0;
  bool _showFilter = false;
  List<BasePage> _bottomNavPages = <BasePage>[NavHomePage(), NavCategoryPage(), NavFeaturedPage(), NavProfilePage()];
  BasePage _currentPage = NavHomePage();
  EdgeInsets navPadding = EdgeInsets.only(left: 8.0, top: 16.0, bottom: 16.0, right: 16.0);

  @override
  Widget body() {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        leading: IconButton(icon: SvgPicture.asset('menu.svg'.getFromAssets()), onPressed: () => _scaffoldKey.currentState.openDrawer()),
        actions: [
          _showFilter ? IconButton(icon: SvgPicture.asset('filter.svg'.getFromAssets()), onPressed: () {}) : Container(),
          IconButton(icon: SvgPicture.asset('shopping_bag.svg'.getFromAssets()), onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ShoppingBagPage()))),
        ],
        backgroundColor: Colors.white,
        elevation: 1.0,
      ),
      drawer: Drawer(
        child: ScrollableFooterLayout(
          padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 40.0),
          children: [
            SizedBox(height: 44),
            Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundImage:
                      NetworkImage('https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=200&q=80'),
                  radius: 35.0,
                  child: Align(alignment: Alignment.bottomRight, child: SvgPicture.asset('edit_image.svg'.getFromAssets())),
                ),
                TextWidget('Welcome, Elizabeth Stone', size: 20.0, weight: FontWeight.w600, ellipsis: false, margin: EdgeInsets.only(top: 24.0, left: 8.0, right: 8.0, bottom: 16.0)),
                _drawerItem(() => _onDrawerTapped(OrdersPage()), 'nav_orders', 'Orders'),
                _drawerItem(() => _onDrawerTapped(WishListPage()), 'nav_list', 'Wish List'),
                _drawerItem(() => _onDrawerTapped(LastViewedPage()), 'nav_eye', 'Last Viewed'),
                _drawerItem(() => _onDrawerTapped(ShippingAddressPage()), 'nav_address', 'Shipping Address'),
                _drawerItem(() => _onDrawerTapped(LanguagePage()), 'nav_language', 'Language'),
                _drawerItem(() => _onDrawerTapped(SettingsPage()), 'nav_settings', 'Settings'),
                _drawerItem(() => _onDrawerTapped(HelpPage()), 'nav_help', 'Help'),
              ],
            ),
          ],
          footer: _drawerItem(() => Navigator.of(context).pop(), 'nav_log_out', 'Log out'),
        ),
      ),
      body: _currentPage,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(32.0), topRight: Radius.circular(32.0)), boxShadow: [BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 1.0)]),
        child: ClipRRect(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(32.0), topRight: Radius.circular(32.0)),
          child: BottomNavigationBar(
            backgroundColor: Colors.white,
            items: [
              BottomNavigationBarItem(icon: SvgPicture.asset('nav_home.svg'.getFromAssets(), color: _getIconColor(0)), label: 'Home'),
              BottomNavigationBarItem(icon: SvgPicture.asset('nav_grid.svg'.getFromAssets(), color: _getIconColor(1)), label: 'Category'),
              BottomNavigationBarItem(icon: SvgPicture.asset('nav_star.svg'.getFromAssets(), color: _getIconColor(2)), label: 'Featured'),
              BottomNavigationBarItem(icon: SvgPicture.asset('nav_user.svg'.getFromAssets(), color: _getIconColor(3)), label: 'Profile'),
            ],
            currentIndex: _selectedIndex,
            onTap: (index) => _onBottomNav(index: index),
            type: BottomNavigationBarType.fixed,
            showSelectedLabels: false,
            showUnselectedLabels: false,
          ),
        ),
      ),
    );
  }

  void _onBottomNav({int index = 0, BasePage page}) {
    setState(() {
      _selectedIndex = index;
      _currentPage = page ?? _bottomNavPages.elementAt(_selectedIndex);
      _showFilter = (index == 2) ? true : false;
    });
  }

  void _onDrawerTapped(BasePage page) {
    _onBottomNav(index: 3, page: page);
    Navigator.of(context).pop();
  }

  Color _getIconColor(int index) => (_selectedIndex == index) ? Color(0xFF00CBFF) : Color(0xFFBFBFBF);

  Widget _drawerItem(GestureTapCallback onTap, String icon, String title) =>
      InkWell(onTap: onTap, child: Row(children: [Padding(padding: navPadding, child: SvgPicture.asset('$icon.svg'.getFromAssets())), TextWidget(title)]));
}
