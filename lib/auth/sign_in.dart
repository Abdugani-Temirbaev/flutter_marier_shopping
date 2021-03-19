import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:marier_shoping/auth/forgot_password.dart';
import 'package:marier_shoping/auth/sign_up.dart';
import 'package:marier_shoping/custom_widgets/text_form_field_widget.dart';
import 'package:marier_shoping/custom_widgets/text_widget.dart';
import 'package:marier_shoping/main.dart';
import 'package:marier_shoping/base_page.dart';
import 'package:marier_shoping/extensions.dart';

class SignInPage extends BasePage {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends BasePageState<SignInPage> with BasicPage {
  final _formKey = GlobalKey<FormState>();
  bool _isPasswordHidden = true;

  @override
  Widget body() {
    String _email = "", _password = "";
    return Form(
      key: _formKey,
      child: Stack(children: [
        SvgPicture.asset('main_bg.svg'.getFromAssets(), width: MediaQuery.of(context).size.width, height: MediaQuery.of(context).size.height, fit: BoxFit.cover),
        Container(decoration: BoxDecoration(color: Color(0x80000000))),
        Column(mainAxisAlignment: MainAxisAlignment.end, mainAxisSize: MainAxisSize.max, crossAxisAlignment: CrossAxisAlignment.stretch, children: [
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
                      Center(child: TextWidget('Sign In', size: 20.0, weight: FontWeight.w600, padding: const EdgeInsets.symmetric(vertical: 16.0))),
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
                      TextWidget('Password', size: 14.0, padding: const EdgeInsets.only(top: 16.0, bottom: 8.0)),
                      TextFormFieldWidget(
                        borderRadius: 32.0,
                        hintText: 'Password',
                        suffixIcon: IconButton(
                          onPressed: _togglePasswordView,
                          icon: SvgPicture.asset('${(_isPasswordHidden ? 'eye.svg' : 'eye_off.svg').getFromAssets()}', width: 20.0, height: 20.0),
                        ),
                        keyboardType: TextInputType.visiblePassword,
                        textInputAction: TextInputAction.done,
                        obscureText: _isPasswordHidden,
                        validator: (value) {
                          if (value.isEmpty) {
                            showToast('Please enter Password');
                            return '';
                          }
                          return null;
                        },
                        onSaved: (value) => _password = value,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ForgotPasswordPage())),
                              child: TextWidget('Forgot your password?', size: 14.0),
                            ),
                          ],
                        ),
                      ),
                      Row(
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
                                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: TextWidget('Email: ' + _email + " | Password: " + _password)));
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => MainPage()));
                                }
                              },
                              child: TextWidget('LOGIN', weight: FontWeight.bold, color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 16.0),
                        child: TextButton(
                          onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpPage())),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center, children: [TextWidget("Don't have an account? ", size: 14.0), TextWidget('Sign Up', weight: FontWeight.w600, size: 14.0)]),
                        ),
                      ),
                    ]),
                  ),
                ],
              ),
            ),
          ),
        ]),
      ]),
    );
  }

  void _togglePasswordView() => setState(() => _isPasswordHidden = !_isPasswordHidden);
}
