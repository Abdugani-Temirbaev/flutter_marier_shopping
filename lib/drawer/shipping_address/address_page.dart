import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:marier_shoping/base_page.dart';
import 'package:marier_shoping/custom_widgets/ScrollableFooterLayout.dart';
import 'package:marier_shoping/custom_widgets/text_form_field_widget.dart';
import 'package:marier_shoping/custom_widgets/text_widget.dart';
import 'package:marier_shoping/extensions.dart';

class AddressPage extends BasePage {
  final String address;

  AddressPage({this.address = ''});

  @override
  _AddressPageState createState() => _AddressPageState(address);
}

class _AddressPageState extends BasePageState<AddressPage> with BasicPage {
  _AddressPageState(this.address);

  final String address;
  final _formKey = GlobalKey<FormState>();
  String _addressName = '';
  String _street = '';
  String _city = '';
  String _state = '';
  String _zip = '';

  @override
  Widget body() {
    _checkForAddress();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(leading: IconButton(icon: SvgPicture.asset('arrow_left.svg'.getFromAssets()), onPressed: () => Navigator.of(context).pop()), backgroundColor: Colors.white, elevation: 1.0),
      body: Form(
        key: _formKey,
        child: ScrollableFooterLayout(
          padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
          children: [
            TextWidget('My Address', weight: FontWeight.w600, size: 20.0, padding: const EdgeInsets.only(top: 8.0, bottom: 8.0)),
            TextWidget('Address Name', size: 14.0, padding: const EdgeInsets.only(bottom: 8.0, top: 16.0)),
            TextFormFieldWidget(
              initialValue: _addressName,
              borderRadius: 32.0,
              hintText: 'Address Name',
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
              validator: (value) {
                if (value.isEmpty) {
                  showToast('Please enter Address Name');
                  return '';
                }
                return null;
              },
              onChanged: (value) => _addressName = value,
            ),
            TextWidget('Street', size: 14.0, padding: const EdgeInsets.only(bottom: 8.0, top: 16.0)),
            TextFormFieldWidget(
              initialValue: _street,
              borderRadius: 32.0,
              hintText: 'Street',
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
              validator: (value) {
                if (value.isEmpty) {
                  showToast('Please enter Street');
                  return '';
                }
                return null;
              },
              onChanged: (value) => _street = value,
            ),
            TextWidget('City', size: 14.0, padding: const EdgeInsets.only(bottom: 8.0, top: 16.0)),
            TextFormFieldWidget(
              initialValue: _city,
              borderRadius: 32.0,
              hintText: 'City',
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
              validator: (value) {
                if (value.isEmpty) {
                  showToast('Please enter City');
                  return '';
                }
                return null;
              },
              onChanged: (value) => _city = value,
            ),
            TextWidget('State', size: 14.0, padding: const EdgeInsets.only(bottom: 8.0, top: 16.0)),
            TextFormFieldWidget(
              initialValue: _state,
              borderRadius: 32.0,
              hintText: 'State',
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
              validator: (value) {
                if (value.isEmpty) {
                  showToast('Please enter State');
                  return '';
                }
                return null;
              },
              onChanged: (value) => _state = value,
            ),
            TextWidget('Zip Code', size: 14.0, padding: const EdgeInsets.only(bottom: 8.0, top: 16.0)),
            TextFormFieldWidget(
              initialValue: _zip,
              borderRadius: 32.0,
              hintText: 'Zip Code',
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
              validator: (value) {
                if (value.isEmpty) {
                  showToast('Please enter Zip Code');
                  return '';
                }
                return null;
              },
              onChanged: (value) => _zip = value,
            ),
          ],
          footer: Padding(
            padding: const EdgeInsets.only(bottom: 12.0, top: 24.0),
            child: Row(children: [
              Expanded(
                child: ElevatedButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<OutlinedBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(32.0))),
                    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.all(20.0)),
                    backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF00CBFF)),
                  ),
                  child: TextWidget('DONE', weight: FontWeight.w600, color: Colors.white),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }

  void _checkForAddress() {
    if (address.isNotEmpty) {
      List<String> addr = address.split(':');
      _addressName = addr.first;
      _street = addr.last.split(',').first;
      if (addr.last.split(',').length == 3) {
        _city = addr.last.split(',')[1];
      } else {
        _city = addr.last.split(',')[1];
        _state = addr.last.split(',')[2];
      }
      _zip = addr.last.split(',').last;
    }
  }
}
