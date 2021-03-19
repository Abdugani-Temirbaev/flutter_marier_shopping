import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:marier_shoping/base_page.dart';
import 'package:marier_shoping/custom_widgets/text_form_field_widget.dart';
import 'package:marier_shoping/custom_widgets/text_widget.dart';
import 'package:marier_shoping/extensions.dart';

class SignUpPage extends BasePage {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends BasePageState<SignUpPage> with BasicPage {
  final _formKey = GlobalKey<FormState>();
  bool _isPasswordHidden = true;

  @override
  Widget body() {
    String _email = "", _phoneNumber = "", _password = "", _passwordAgain = "";
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
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(32.0), topRight: Radius.circular(32.0)),
                    ),
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      Center(child: TextWidget('Sign Up', size: 20.0, weight: FontWeight.w600, padding: const EdgeInsets.symmetric(vertical: 16.0))),
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
                      TextWidget('Phone Number', size: 14.0, padding: const EdgeInsets.only(top: 32.0, bottom: 8.0)),
                      TextFormFieldWidget(
                        borderRadius: 32.0,
                        hintText: 'Phone Number',
                        keyboardType: TextInputType.phone,
                        textInputAction: TextInputAction.next,
                        validator: (value) {
                          if (value.isEmpty) {
                            showToast('Please enter Phone Number');
                            return '';
                          }
                          return null;
                        },
                        onSaved: (value) => _phoneNumber = value,
                      ),
                      TextWidget('Password', size: 14.0, padding: const EdgeInsets.only(top: 32.0, bottom: 8.0)),
                      TextFormFieldWidget(
                        borderRadius: 32.0,
                        hintText: 'Password',
                        suffixIcon: IconButton(
                          onPressed: _togglePasswordView,
                          icon: SvgPicture.asset('${(_isPasswordHidden ? 'eye.svg' : 'eye_off.svg').getFromAssets()}', width: 20.0, height: 20.0),
                        ),
                        obscureText: _isPasswordHidden,
                        keyboardType: TextInputType.visiblePassword,
                        textInputAction: TextInputAction.next,
                        validator: (value) {
                          if (value.isEmpty) {
                            showToast('Please enter Password');
                            return '';
                          }
                          return null;
                        },
                        onSaved: (value) => _password = value,
                      ),
                      TextWidget('Password', size: 14.0, padding: const EdgeInsets.only(top: 32.0, bottom: 8.0)),
                      TextFormFieldWidget(
                        borderRadius: 32.0,
                        hintText: 'Password Again',
                        suffixIcon: IconButton(
                          onPressed: _togglePasswordView,
                          icon: SvgPicture.asset('${(_isPasswordHidden ? 'eye.svg' : 'eye_off.svg').getFromAssets()}', width: 20.0, height: 20.0),
                        ),
                        keyboardType: TextInputType.visiblePassword,
                        textInputAction: TextInputAction.done,
                        obscureText: _isPasswordHidden,
                        validator: (value) {
                          if (value.isEmpty) {
                            showToast('Please enter Password Again');
                            return '';
                          } else if (value != _password) {
                            showToast('Passwords are different');
                            return '';
                          }
                          return null;
                        },
                        onSaved: (value) => _passwordAgain = value,
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
                                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                      content: TextWidget('Email: ' + _email + " | Phone number: " + _phoneNumber + " | Password: " + _password + " | Password Again: " + _passwordAgain),
                                    ));
                                  }
                                },
                                child: TextWidget('SIGN UP', weight: FontWeight.w600, color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ]),
                  ),
                ),
              ),
            ]),
          ),
        ),
      ],
    );
  }

  void _togglePasswordView() => setState(() => _isPasswordHidden = !_isPasswordHidden);
}
