import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

import 'package:flutter_credit_card/credit_card_model.dart';
import 'package:marier_shoping/custom_widgets/text_form_field_widget.dart';
import 'package:marier_shoping/custom_widgets/text_widget.dart';

class CustomCreditCardForm extends StatefulWidget {
  const CustomCreditCardForm({
    Key key,
    this.cardNumber,
    this.expiryDate,
    this.cardHolderName,
    this.cvvCode,
    this.obscureCvv = false,
    this.obscureNumber = false,
    @required this.onCreditCardModelChange,
    this.themeColor,
    this.textColor = Colors.black,
    this.cursorColor,
    this.cardHolderDecoration = const InputDecoration(labelText: 'Card holder', hintText: 'Name Surname'),
    this.cardNumberDecoration = const InputDecoration(labelText: 'Card number', hintText: '**** **** **** ****'),
    this.expiryDateDecoration = const InputDecoration(labelText: 'Expired Date', hintText: 'MM/YY'),
    this.cvvCodeDecoration = const InputDecoration(labelText: 'CVV', hintText: '***'),
    @required this.formKey,
    this.cvvValidationMessage = 'Please input a valid CVV',
    this.dateValidationMessage = 'Please input a valid date',
    this.numberValidationMessage = 'Please input a valid number',
  }) : super(key: key);

  final String cardNumber;
  final String expiryDate;
  final String cardHolderName;
  final String cvvCode;
  final String cvvValidationMessage;
  final String dateValidationMessage;
  final String numberValidationMessage;
  final void Function(CreditCardModel) onCreditCardModelChange;
  final Color themeColor;
  final Color textColor;
  final Color cursorColor;
  final bool obscureCvv;
  final bool obscureNumber;
  final GlobalKey<FormState> formKey;

  final InputDecoration cardNumberDecoration;
  final InputDecoration cardHolderDecoration;
  final InputDecoration expiryDateDecoration;
  final InputDecoration cvvCodeDecoration;

  @override
  _CustomCreditCardFormState createState() => _CustomCreditCardFormState();
}

class _CustomCreditCardFormState extends State<CustomCreditCardForm> {
  String cardNumber;
  String expiryDate;
  String cardHolderName;
  String cvvCode;
  bool isCvvFocused = false;
  Color themeColor;

  void Function(CreditCardModel) onCreditCardModelChange;
  CreditCardModel creditCardModel;

  final MaskedTextController _cardNumberController = MaskedTextController(mask: '0000 0000 0000 0000');
  final TextEditingController _expiryDateController = MaskedTextController(mask: '00/00');
  final TextEditingController _cardHolderNameController = TextEditingController();
  final TextEditingController _cvvCodeController = MaskedTextController(mask: '0000');

  FocusNode cvvFocusNode = FocusNode();
  FocusNode cardNumberNode = FocusNode();
  FocusNode expiryDateNode = FocusNode();
  FocusNode cardHolderNode = FocusNode();

  void textFieldFocusDidChange() {
    creditCardModel.isCvvFocused = cvvFocusNode.hasFocus;
    onCreditCardModelChange(creditCardModel);
  }

  void createCreditCardModel() {
    cardNumber = widget.cardNumber ?? '';
    expiryDate = widget.expiryDate ?? '';
    cardHolderName = widget.cardHolderName ?? '';
    cvvCode = widget.cvvCode ?? '';

    creditCardModel = CreditCardModel(cardNumber, expiryDate, cardHolderName, cvvCode, isCvvFocused);
  }

  @override
  void initState() {
    super.initState();

    createCreditCardModel();

    onCreditCardModelChange = widget.onCreditCardModelChange;

    cvvFocusNode.addListener(textFieldFocusDidChange);

    _cardNumberController.addListener(() {
      setState(() {
        cardNumber = _cardNumberController.text;
        creditCardModel.cardNumber = cardNumber;
        onCreditCardModelChange(creditCardModel);
      });
    });

    _expiryDateController.addListener(() {
      setState(() {
        expiryDate = _expiryDateController.text;
        creditCardModel.expiryDate = expiryDate;
        onCreditCardModelChange(creditCardModel);
      });
    });

    _cardHolderNameController.addListener(() {
      setState(() {
        cardHolderName = _cardHolderNameController.text;
        creditCardModel.cardHolderName = cardHolderName;
        onCreditCardModelChange(creditCardModel);
      });
    });

    _cvvCodeController.addListener(() {
      setState(() {
        cvvCode = _cvvCodeController.text;
        creditCardModel.cvvCode = cvvCode;
        onCreditCardModelChange(creditCardModel);
      });
    });
  }

  @override
  void dispose() {
    cardHolderNode.dispose();
    cvvFocusNode.dispose();
    expiryDateNode.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    themeColor = widget.themeColor ?? Theme.of(context).primaryColor;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        primaryColor: themeColor.withOpacity(0.8),
        primaryColorDark: themeColor,
      ),
      child: Form(
        key: widget.formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextWidget(widget.cardHolderDecoration.labelText, size: 14.0, padding: const EdgeInsets.only(bottom: 8.0, top: 16.0)),
            TextFormFieldWidget(
              controller: _cardHolderNameController,
              borderRadius: 32.0,
              hintText: widget.cardHolderDecoration.hintText,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
              onEditingComplete: () {
                FocusScope.of(context).requestFocus(cardNumberNode);
              },
            ),
            TextWidget(widget.cardNumberDecoration.labelText, size: 14.0, padding: const EdgeInsets.only(bottom: 8.0, top: 16.0)),
            TextFormFieldWidget(
              obscureText: widget.obscureNumber,
              focusNode: cardNumberNode,
              controller: _cardNumberController,
              onEditingComplete: () {
                FocusScope.of(context).requestFocus(expiryDateNode);
              },
              hintText: widget.cardNumberDecoration.hintText,
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.next,
              borderRadius: 32.0,
              validator: (String value) {
                // Validate less that 13 digits +3 white spaces
                if (value.isEmpty || value.length < 16) return widget.numberValidationMessage;
                return null;
              },
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      TextWidget(widget.expiryDateDecoration.labelText, size: 14.0, padding: const EdgeInsets.only(bottom: 8.0, top: 16.0)),
                      TextFormFieldWidget(
                        controller: _expiryDateController,
                        focusNode: expiryDateNode,
                        onEditingComplete: () {
                          FocusScope.of(context).requestFocus(cvvFocusNode);
                        },
                        hintText: widget.expiryDateDecoration.hintText,
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.next,
                        validator: (String value) {
                          if (value.isEmpty) {
                            return widget.dateValidationMessage;
                          }
                          final DateTime now = DateTime.now();
                          final List<String> date = value.split(RegExp(r'/'));
                          final int month = int.parse(date.first);
                          final int year = int.parse('20${date.last}');
                          final DateTime cardDate = DateTime(year, month);

                          if (cardDate.isBefore(now) || month > 12 || month == 0) {
                            return widget.dateValidationMessage;
                          }
                          return null;
                        },
                        borderRadius: 32.0,
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      TextWidget(widget.cvvCodeDecoration.labelText, size: 14.0, padding: const EdgeInsets.only(bottom: 8.0, top: 16.0)),
                      TextFormFieldWidget(
                        obscureText: widget.obscureCvv,
                        focusNode: cvvFocusNode,
                        controller: _cvvCodeController,
                        onEditingComplete: () {
                          onCreditCardModelChange(creditCardModel);
                        },
                        hintText: widget.cvvCodeDecoration.hintText,
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.done,
                        borderRadius: 32.0,
                        onChanged: (String text) {
                          setState(() {
                            cvvCode = text;
                          });
                        },
                        validator: (value) {
                          if (value.isEmpty || value.length < 3) {
                            return widget.cvvValidationMessage;
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
