import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:marier_shoping/base_page.dart';
import 'package:marier_shoping/custom_widgets/CustomCreditCardWidget.dart';
import 'package:marier_shoping/custom_widgets/CustomCreditFormWidget.dart';
import 'package:marier_shoping/custom_widgets/ScrollableFooterLayout.dart';
import 'package:marier_shoping/custom_widgets/text_widget.dart';
import 'package:marier_shoping/extensions.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

class PaymentInfoPage extends BasePage {
  PaymentInfoPage(this.total);

  final String total;

  @override
  _PaymentInfoPageState createState() => _PaymentInfoPageState(total);
}

List<String> shippingAddressList = ['Home: 4043 Willis Avenue, TRAPPER CREEK, 99638', 'Work: 1923 Meadowbrook Mall Road, Gardena, CA, 90248'];
List<String> shippingMethodList = ['China Post Ait Mail', 'UPS Express Saved', 'DHL', 'FedEx IE'];

class _PaymentInfoPageState extends BasePageState<PaymentInfoPage> with BasicPage {
  _PaymentInfoPageState(this.total);

  final String total;
  String cardHolderName = '';
  String cardNumber = '';
  String cardDate = '';
  String cardCCV = '';
  bool isCvvFocused = false;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String _selectedAddress = shippingAddressList.first;
  String _selectedMethod = shippingMethodList.first;

  @override
  Widget body() {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(leading: IconButton(icon: SvgPicture.asset('arrow_left.svg'.getFromAssets()), onPressed: () => Navigator.of(context).pop()), backgroundColor: Colors.white, elevation: 1.0),
      body: ScrollableFooterLayout(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              children: [
                SizedBox(height: 32),
                CustomCreditCardWidget(
                  backgroundGradientColor:
                      LinearGradient(begin: Alignment.bottomLeft, end: Alignment.topRight, stops: [0.1, 0.5, 0.9], colors: [Color(0xFF32C5FF), Color(0xFFB620E0), Color(0xFFF7B500)]),
                  cardNumber: cardNumber,
                  expiryDate: cardDate,
                  cardHolderName: cardHolderName,
                  cvvCode: cardCCV,
                  showBackView: false, //true when you want to show cvv(back) view
                ),
                SizedBox(height: 24),
                CustomCreditCardForm(
                  formKey: formKey,
                  // Required
                  onCreditCardModelChange: (CreditCardModel creditCardModel) {
                    setState(() {
                      cardNumber = creditCardModel.cardNumber;
                      cardDate = creditCardModel.expiryDate;
                      cardHolderName = creditCardModel.cardHolderName;
                      cardCCV = creditCardModel.cvvCode;
                      isCvvFocused = creditCardModel.isCvvFocused;
                    });
                  },
                  // Required
                  themeColor: Colors.red,
                  obscureCvv: true,
                  cardHolderDecoration: const InputDecoration(border: OutlineInputBorder(), labelText: 'Name Surname', hintText: 'Name Surname'),
                  cardNumberDecoration: const InputDecoration(border: OutlineInputBorder(), labelText: 'Card Number', hintText: '**** **** **** ****'),
                  expiryDateDecoration: const InputDecoration(border: OutlineInputBorder(), labelText: 'Exp. date', hintText: '00/00'),
                  cvvCodeDecoration: const InputDecoration(border: OutlineInputBorder(), labelText: 'CCV No.', hintText: '***'),
                ),
                SizedBox(height: 12),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(child: TextWidget('Shipping Address', weight: FontWeight.w600)),
                      Flexible(
                        child: InkWell(
                          onTap: () => showListBottomSheet(shippingAddressList, 'Shipping Address'),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextWidget('select', padding: EdgeInsets.only(right: 8.0)),
                              SvgPicture.asset('arrow_down.svg'.getFromAssets()),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(child: TextWidget('Shipping Method', weight: FontWeight.w600)),
                      Flexible(
                        child: InkWell(
                          onTap: () => showListBottomSheet(shippingMethodList, 'Shipping Method'),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextWidget('select', padding: EdgeInsets.only(right: 8.0)),
                              SvgPicture.asset('arrow_down.svg'.getFromAssets()),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
        footer: Container(
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
                  TextWidget(total, weight: FontWeight.w600, size: 20.0, color: Colors.white),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextWidget(' ', size: 14.0, color: Color(0x80FFFFFF)),
                  ElevatedButton(
                    onPressed: () {},
                    child: TextWidget('PAY', color: Colors.white, weight: FontWeight.w600),
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
      ),
    );
  }

  void showListBottomSheet(List<String> list, String title) {
    final type = (title == 'Shipping Address');
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
                        if (list[index] != (type ? _selectedAddress : _selectedMethod)) {
                          if (type)
                            _selectedAddress = list[index];
                          else
                            _selectedMethod = list[index];
                        }
                      });
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(flex: 2, child: TextWidget(list[index], maxLines: 3)),
                        Expanded(
                          flex: 1,
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Radio(
                              activeColor: Color(0xFF00CBFF),
                              value: list[index],
                              groupValue: (type ? _selectedAddress : _selectedMethod),
                              onChanged: (value) {
                                setState(() {
                                  if (type)
                                    _selectedAddress = list[index];
                                  else
                                    _selectedMethod = list[index];
                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                ),
                SizedBox(height: 16.0),
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
                          shape: MaterialStateProperty.all<OutlinedBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(32.0), side: BorderSide(color: Colors.white, width: 1.0))),
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
