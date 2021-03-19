import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:marier_shoping/base_page.dart';
import 'package:marier_shoping/custom_widgets/text_form_field_widget.dart';
import 'package:marier_shoping/custom_widgets/text_widget.dart';
import 'package:marier_shoping/extensions.dart';

class ForgotPasswordPage extends BasePage {
  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends BasePageState<ForgotPasswordPage> with BasicPage {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget body() {
    String _email = "";
    return Stack(
      children: [
        SvgPicture.asset('main_bg.svg'.getFromAssets(), width: MediaQuery.of(context).size.width, height: MediaQuery.of(context).size.height, fit: BoxFit.cover),
        Container(decoration: BoxDecoration(color: Color(0x80000000))),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(backgroundColor: Colors.transparent, leading: IconButton(icon: Icon(Icons.arrow_back_ios), onPressed: () => {Navigator.pop(context)}), elevation: 0.0),
          body: Form(
            key: _formKey,
            child: Column(mainAxisAlignment: MainAxisAlignment.end, mainAxisSize: MainAxisSize.max, crossAxisAlignment: CrossAxisAlignment.stretch, children: [
              Flexible(
                fit: FlexFit.loose,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(80.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [SvgPicture.asset('app_logo.svg'.getFromAssets(), height: 100.0, width: 100.0)],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(32.0), topRight: Radius.circular(32.0)),
                        ),
                        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                          Center(child: TextWidget('Forgot Password?', size: 20.0, weight: FontWeight.w600, padding: const EdgeInsets.symmetric(vertical: 16.0))),
                          TextWidget('Please enter your email address. You will receive a link to create a new password via email.', size: 14.0, padding: const EdgeInsets.only(bottom: 24.0)),
                          TextWidget('E-mail', size: 14.0, padding: const EdgeInsets.symmetric(vertical: 8.0)),
                          TextFormFieldWidget(
                            borderRadius: 32.0,
                            hintText: 'E-mail',
                            keyboardType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,
                            validator: (value) {
                              if (value.isEmpty) {
                                showToast('Please enter E-mail');
                                return '';
                              }
                              return null;
                            },
                            onSaved: (value) => _email = value,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 32.0, bottom: 16.0),
                            child: Row(
                              children: [
                                Expanded(
                                  child: ElevatedButton(
                                    style: ButtonStyle(
                                      shape: MaterialStateProperty.all<OutlinedBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(32.0))),
                                      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.all(20.0)),
                                      backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF00CBFF)),
                                    ),
                                    onPressed: () {
                                      if (_formKey.currentState.validate()) {
                                        _formKey.currentState.save();
                                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: TextWidget('Email: ' + _email)));
                                      }
                                    },
                                    child: TextWidget('SEND NEW PASSWORD', weight: FontWeight.w600, color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ]),
                      ),
                    ],
                  ),
                ),
              ),
            ]),
          ),
        ),
      ],
    );
  }
}
