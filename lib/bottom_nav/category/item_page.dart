import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:marier_shoping/base_page.dart';
import 'package:marier_shoping/custom_widgets/text_widget.dart';
import 'package:marier_shoping/extensions.dart';

class ItemPage extends BasePage {
  final String url;

  ItemPage(this.url);

  @override
  _ItemPageState createState() => _ItemPageState(url);
}

List<String> sizeList = ['X Small', 'Small', 'Medium', 'Large', 'X Large', 'XX Large', 'Oversize'];
List<String> colorList = ['Black', 'Red', 'Blue', 'White'];

class _ItemPageState extends BasePageState<ItemPage> with BasicPage {
  _ItemPageState(this.url);

  final String url;

  String _selectedSize = sizeList.first;
  String _selectedColor = colorList.first;
  static bool isFavorite = false;

  @override
  Widget body() {
    return StatefulBuilder(builder: (BuildContext context, StateSetter setState) {
      return Stack(
        children: [
          Image.network(url.replaceAll('&w=300', '&w=800'), fit: BoxFit.cover, width: MediaQuery.of(context).size.width, height: MediaQuery.of(context).size.height, alignment: Alignment.topCenter),
          Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
                backgroundColor: Colors.transparent,
                leading: IconButton(icon: SvgPicture.asset('arrow_left.svg'.getFromAssets(), color: Colors.white), onPressed: () => Navigator.pop(context)),
                elevation: 0.0),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Flexible(
                  fit: FlexFit.loose,
                  child: SingleChildScrollView(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(32.0), topRight: Radius.circular(32.0)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        TextWidget('Hoodie', weight: FontWeight.w600),
                                        Row(
                                          children: [
                                            TextWidget('4.5', padding: EdgeInsets.only(right: 8.0), size: 14.0),
                                            Container(
                                              width: 100,
                                              height: 30,
                                              alignment: Alignment.center,
                                              child: ListView.builder(
                                                itemCount: 5,
                                                itemBuilder: (_, index) => Icon(Icons.star, color: Color(0xFFF9A825), size: 18.0),
                                                scrollDirection: Axis.horizontal,
                                                shrinkWrap: false,
                                                physics: BouncingScrollPhysics(),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    IconButton(
                                      icon: isFavorite ? SvgPicture.asset('heart_fill.svg'.getFromAssets()) : SvgPicture.asset('heart.svg'.getFromAssets()),
                                      onPressed: () => setState(() {
                                        isFavorite = !isFavorite;
                                        if (isFavorite)
                                          showToast('The product has been added to your favorites list.');
                                        else
                                          showToast('The product has been removed from your favorites list.');
                                      }),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 16.0),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Flexible(child: TextWidget('Size', weight: FontWeight.w600)),
                                    Flexible(
                                      child: InkWell(
                                        onTap: () => showListBottomSheet(sizeList, 'Size'),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: [
                                            TextWidget(_selectedSize, padding: EdgeInsets.only(right: 8.0)),
                                            SvgPicture.asset('arrow_down.svg'.getFromAssets()),
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(height: 16.0),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Flexible(child: TextWidget('Color', weight: FontWeight.w600)),
                                    Flexible(
                                      child: InkWell(
                                        onTap: () => showListBottomSheet(colorList, 'Color'),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: [
                                            TextWidget(_selectedColor, padding: EdgeInsets.only(right: 8.0)),
                                            SvgPicture.asset('arrow_down.svg'.getFromAssets()),
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(height: 16.0),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    TextWidget('Estimated delivery:  ', weight: FontWeight.w600, size: 14.0),
                                    TextWidget('28.10.2021', size: 14.0),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 24.0, right: 24.0, top: 8.0, bottom: 40.0),
                            decoration: BoxDecoration(
                              color: Color(0xFF00CBFF),
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(32.0), topRight: Radius.circular(32.0)),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TextWidget('Total', size: 14.0, color: Color(0xAAFFFFFF)),
                                    TextWidget('\$40,00', weight: FontWeight.w600, size: 20.0, color: Colors.white),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TextWidget(' ', size: 14.0, color: Color(0x80FFFFFF)),
                                    ElevatedButton(
                                      onPressed: () {},
                                      child: TextWidget('ADD TO BAG', color: Colors.white, weight: FontWeight.w600),
                                      style: ButtonStyle(
                                        elevation: MaterialStateProperty.all<double>(0),
                                        backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF00CBFF)),
                                        shape: MaterialStateProperty.all<OutlinedBorder>(
                                          RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.0), side: BorderSide(color: Colors.white, width: 1.0)),
                                        ),
                                        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0)),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    });
  }

  void showListBottomSheet(List<String> list, String title) {
    final type = (title == 'Size');
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) {
        return StatefulBuilder(builder: (BuildContext context, StateSetter setState) {
          return Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(32.0), topRight: Radius.circular(32.0)),
            ),
            padding: EdgeInsets.all(24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWidget(title, weight: FontWeight.w600, size: 20.0, margin: EdgeInsets.only(bottom: 16.0)),
                ListView.builder(
                  itemCount: list.length,
                  itemBuilder: (_, index) => InkWell(
                    onTap: () {
                      setState(() {
                        if (list[index] != (type ? _selectedSize : _selectedColor)) {
                          if (type)
                            _selectedSize = list[index];
                          else
                            _selectedColor = list[index];
                        }
                      });
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        TextWidget(list[index]),
                        Radio(
                          activeColor: Color(0xFF00CBFF),
                          value: list[index],
                          groupValue: (type ? _selectedSize : _selectedColor),
                          onChanged: (value) {
                            setState(() {
                              if (type)
                                _selectedSize = list[index];
                              else
                                _selectedColor = list[index];
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                ),
                SizedBox(height: 8.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () => Navigator.pop(context),
                        child: TextWidget('DONE', color: Colors.white, weight: FontWeight.w600),
                        style: ButtonStyle(
                          elevation: MaterialStateProperty.all<double>(0),
                          backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF00CBFF)),
                          shape: MaterialStateProperty.all<OutlinedBorder>(
                            RoundedRectangleBorder(borderRadius: BorderRadius.circular(32.0), side: BorderSide(color: Colors.white, width: 1.0)),
                          ),
                          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.all(20.0)),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16.0),
              ],
            ),
          );
        });
      },
    );
  }
}
