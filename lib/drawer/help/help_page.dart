import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:marier_shoping/base_page.dart';
import 'package:marier_shoping/custom_widgets/ExpansionTileNoTrailing.dart';
import 'package:marier_shoping/custom_widgets/text_widget.dart';
import 'package:marier_shoping/extensions.dart';

class HelpPage extends BasePage {
  @override
  _HelpPageState createState() => _HelpPageState();
}

List<QA> list = [
  QA('1 question question question question question', 'answer answer answer answer answer 1', false),
  QA('question 2', 'answer 2', false),
  QA('question 3', 'answer 3', false),
];

class _HelpPageState extends BasePageState<HelpPage> with BasicPage {
  @override
  Widget body() {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextWidget('F.A.Q.', weight: FontWeight.w600, size: 20.0, padding: const EdgeInsets.only(top: 8.0, bottom: 24.0)),
            for (var item in list)
              Theme(
                data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                child: ExpansionTileNoTrailing(
                  title: Container(
                    padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(32.0)), border: Border.all(color: Colors.grey)),
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, mainAxisSize: MainAxisSize.max, children: [
                      Expanded(flex: 4, child: TextWidget(item.question, maxLines: 1)),
                      Expanded(flex: 1, child: Align(alignment: Alignment.centerRight, child: SvgPicture.asset((item.isExpanded ? 'arrow_up.svg' : 'arrow_down.svg').getFromAssets()))),
                    ]),
                  ),
                  children: [
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextWidget(item.question, size: 14.0, weight: FontWeight.w600, fontStyle: FontStyle.italic, padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0), ellipsis: false),
                          TextWidget(item.answer, size: 14.0, padding: EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0)),
                        ],
                      ),
                    ),
                  ],
                  expandedAlignment: Alignment.topLeft,
                  tilePadding: EdgeInsets.symmetric(vertical: 2.0),
                  onExpansionChanged: (expansionChanged) => setState(() => item.isExpanded = expansionChanged),
                  backgroundColor: Color(0xFFCBF5FF),
                  initiallyExpanded: item.isExpanded,
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class QA {
  final String question;
  final String answer;
  bool isExpanded;

  QA(this.question, this.answer, this.isExpanded);
}
