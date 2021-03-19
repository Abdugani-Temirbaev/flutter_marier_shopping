import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:marier_shoping/base_page.dart';
import 'package:marier_shoping/extensions.dart';
import 'package:marier_shoping/custom_widgets/ScrollableFooterLayout.dart';
import 'package:marier_shoping/custom_widgets/text_form_field_widget.dart';
import 'package:marier_shoping/custom_widgets/text_widget.dart';

class SettingsPage extends BasePage {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends BasePageState<SettingsPage> with BasicPage {
  final _formKey = GlobalKey<FormState>();
  String _email = '';
  String _password = '';
  String _city = '';
  String _notificationValue = 'On';

  @override
  Widget body() {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: _formKey,
        child: ScrollableFooterLayout(
          padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
          children: [
            TextWidget('Settings', weight: FontWeight.w600, size: 20.0, padding: const EdgeInsets.only(top: 8.0, bottom: 8.0)),
            TextWidget('E-mail', size: 14.0, padding: const EdgeInsets.only(bottom: 8.0, top: 16.0)),
            TextFormFieldWidget(
              initialValue: _email,
              borderRadius: 32.0,
              hintText: 'E-mail',
              keyboardType: TextInputType.text,
              suffixIcon: IconButton(onPressed: () {}, icon: SvgPicture.asset('edit.svg'.getFromAssets())),
              textInputAction: TextInputAction.next,
              validator: (value) {
                if (value.isEmpty) {
                  showToast('Please enter E-mail');
                  return '';
                }
                return null;
              },
              onChanged: (value) => _email = value,
            ),
            TextWidget('Password', size: 14.0, padding: const EdgeInsets.only(bottom: 8.0, top: 16.0)),
            TextFormFieldWidget(
              initialValue: _password,
              obscureText: true,
              borderRadius: 32.0,
              hintText: 'Password',
              suffixIcon: IconButton(onPressed: () {}, icon: SvgPicture.asset('edit.svg'.getFromAssets())),
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
              validator: (value) {
                if (value.isEmpty) {
                  showToast('Please enter Password');
                  return '';
                }
                return null;
              },
              onChanged: (value) => _password = value,
            ),
            TextWidget('Notification', size: 14.0, padding: const EdgeInsets.only(bottom: 8.0, top: 16.0)),
            Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(32.0)), border: Border.all(color: Colors.grey)),
              child: DropdownButton(
                underline: Container(),
                value: _notificationValue,
                isExpanded: true,
                icon: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: SvgPicture.asset('arrow_down.svg'.getFromAssets()),
                ),
                iconSize: 24,
                elevation: 8,
                onChanged: (String newValue) => setState(() => _notificationValue = newValue),
                items: <String>['On', 'Off']
                    .map<DropdownMenuItem<String>>((String value) => DropdownMenuItem<String>(value: value, child: TextWidget(value, size: 14.0, padding: EdgeInsets.symmetric(horizontal: 16.0))))
                    .toList(),
              ),
            )
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
}
