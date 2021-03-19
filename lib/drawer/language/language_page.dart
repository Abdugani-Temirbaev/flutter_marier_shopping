import 'package:flutter/material.dart';
import 'package:marier_shoping/base_page.dart';
import 'package:marier_shoping/custom_widgets/ScrollableFooterLayout.dart';
import 'package:marier_shoping/custom_widgets/text_widget.dart';

class LanguagePage extends BasePage {
  @override
  _LanguagePageState createState() => _LanguagePageState();
}

List<String> list = ['English', 'Russian', 'Chinese', 'Korean', 'French', 'Italian', 'German'];
String _selectedLanguage = 'English';

class _LanguagePageState extends BasePageState<LanguagePage> with BasicPage {
  @override
  Widget body() {
    return ScrollableFooterLayout(
      padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
      children: [
        TextWidget('Language', weight: FontWeight.w600, size: 20.0, padding: const EdgeInsets.only(top: 8.0, bottom: 12.0)),
        for (var language in list)
          InkWell(
            onTap: () => setState(() => _selectedLanguage = language),
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, mainAxisSize: MainAxisSize.max, children: [
              Expanded(flex: 2, child: TextWidget(language)),
              Expanded(
                flex: 1,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Radio(activeColor: Color(0xFF00CBFF), value: language, groupValue: _selectedLanguage, onChanged: (value) => setState(() => _selectedLanguage = language)),
                ),
              ),
            ]),
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
              onPressed: () => {},
            ),
          ),
        ]),
      ),
    );
  }
}
