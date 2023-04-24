import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:example/main.dart' as app;
import 'integration_test_util.dart' as util;

void main() {

  final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized() as IntegrationTestWidgetsFlutterBinding;


  testWidgets("通用测试", (tester) async {
    app.main();
    await tester.pumpAndSettle();
    await binding.convertFlutterSurfaceToImage();
    Finder? finder;
    //gridview  OK
    // var jsonArray = '[{"action":"delayed"},{"action":"delayed"},{"action":"pumpAndSettle"},{"action":"takeScreenshot"},{"action":"pump"},{"action":"find.text","text":"fair使用和介绍"},{"action":"expect","expect":1},{"action":"find.text","text":"fair 模板代码"},{"action":"expect","expect":1},{"action":"tap"},{"action":"pumpAndSettle"},{"action":"delayed"},{"action":"pumpAndSettle"},{"action":"find.text","text":"Gridview >>>"},{"action":"tap"},{"action":"pumpAndSettle"},{"action":"delayed"},{"action":"pumpAndSettle"},{"action":"delayed"},{"action":"find.byType","type":"Image"},{"action":"expect","expect":8},{"action":"delayed"},{"action":"pumpAndSettle"},{"action":"takeScreenshot"},{"action":"find.text","text":"click show message!"},{"action":"expect","expect":0}]';

    //hotel_listview OK
    // var jsonArray = '[{"action":"delayed"},{"action":"delayed"},{"action":"pumpAndSettle"},{"action":"takeScreenshot"},{"action":"pump"},{"action":"find.text","text":"fair使用和介绍"},{"action":"expect","expect":1},{"action":"find.text","text":"fair 模板代码","expect":0},{"action":"expect","expect":1},{"action":"tap"},{"action":"pumpAndSettle"},{"action":"delayed"},{"action":"find.text","text":"Listview >>>"},{"action":"tap"},{"action":"pumpAndSettle"},{"action":"delayed"},{"action":"pump"},{"action":"delayed"},{"action":"find.text","text":"Grand Royal Hotel"},{"action":"expect","expect":2},{"action":"takeScreenshot"},{"action":"find.text","text":"click show message!"},{"action":"expect","expect":0}]';

    //list_card
    // var jsonArray = '[{"action":"delayed"},{"action":"delayed"},{"action":"pumpAndSettle"},{"action":"takeScreenshot"},{"action":"pump"},{"action":"find.text","text":"fair使用和介绍"},{"action":"expect","expect":1},{"action":"find.text","text":"fair 模板代码","expect":0},{"action":"expect","expect":1},{"action":"tap"},{"action":"pumpAndSettle"},{"action":"delayed"},{"action":"find.byType","type":"ListView","text":""},{"action":"drag","offsetY":-600.0},{"action":"pump"},{"action":"find.text","text":"ListCard >>>"},{"action":"tap"},{"action":"pumpAndSettle"},{"action":"delayed"},{"action":"pump"},{"action":"delayed"},{"action":"takeScreenshot"},{"action":"find.text","text":"click show message!"},{"action":"expect","expect":0}]';

    //list_page
    // var jsonArray = '[{"action":"delayed"},{"action":"delayed"},{"action":"pumpAndSettle"},{"action":"takeScreenshot"},{"action":"pump"},{"action":"find.text","text":"fair使用和介绍"},{"action":"expect","expect":1},{"action":"find.text","text":"fair 模板代码","expect":0},{"action":"expect","expect":1},{"action":"tap"},{"action":"pumpAndSettle"},{"action":"delayed"},{"action":"find.byType","type":"ListView","text":""},{"action":"drag","offsetY":-600.0},{"action":"pump"},{"action":"find.text","text":"ListPage >>>"},{"action":"tap"},{"action":"pumpAndSettle"},{"action":"delayed"},{"action":"pump"},{"action":"delayed"},{"action":"takeScreenshot"},{"action":"find.text","text":"click show message!"},{"action":"expect","expect":0}]';

    //login_page OK
    // var jsonArray = '[{"action":"delayed"},{"action":"delayed"},{"action":"pumpAndSettle"},{"action":"takeScreenshot"},{"action":"pump"},{"action":"find.text","text":"fair使用和介绍"},{"action":"expect","expect":1},{"action":"find.text","text":"fair 模板代码"},{"action":"expect","expect":1},{"action":"tap"},{"action":"pumpAndSettle"},{"action":"delayed"},{"action":"find.byType","type":"ListView"},{"action":"drag","offsetY":-600.0},{"action":"pump"},{"action":"find.text","text":"Login >>>"},{"action":"tap"},{"action":"pumpAndSettle"},{"action":"find.byType","type":"TextField"},{"action":"enterText","text":"hi"},{"action":"pump"},{"action":"takeScreenshot"},{"action":"find.text","text":"Login"},{"action":"tap"},{"action":"pump"},{"action":"takeScreenshot"},{"action":"find.text","text":"click show message!"},{"action":"expect","expect":0}]';

    //pageview
    var jsonArray = '[{"action":"delayed"},{"action":"delayed"},{"action":"pumpAndSettle"},{"action":"takeScreenshot"},{"action":"pump"},{"action":"find.text","text":"fair使用和介绍"},{"action":"expect","expect":1},{"action":"find.text","text":"fair 模板代码"},{"action":"expect","expect":1},{"action":"tap"},{"action":"pumpAndSettle"},{"action":"delayed"},{"action":"find.text","text":"PageView >>>"},{"action":"tap"},{"action":"pumpAndSettle"},{"action":"delayed"},{"action":"pumpAndSettle"},{"action":"find.byType","type":"Image"},{"action":"expect","expect":2},{"action":"takeScreenshot"}]';

    //TabBar
    // var jsonArray = '[{"action":"delayed","type":"","text":"","expect":0},{"action":"delayed","type":"","text":"","expect":0},{"action":"pumpAndSettle","type":"","text":"","expect":0},{"action":"pump","type":"","text":"","expect":0},{"action":"find.text","type":"","text":"fair使用和介绍","expect":0},{"action":"expect","type":"","text":"","expect":1},{"action":"find.text","type":"","text":"fair 模板代码","expect":0},{"action":"expect","type":"","text":"","expect":1},{"action":"tap","type":"","text":"","expect":0},{"action":"pumpAndSettle","type":"","text":"","expect":0},{"action":"pump","type":"","text":"","expect":0},{"action":"delayed","type":"","text":"","expect":0},{"action":"find.byType","type":"ListView","text":"","expect":0},{"action":"expect","type":"","text":"","expect":1},{"action":"drag","type":"","text":"","expect":0,"offsetY":-600.0},{"action":"delayed","type":"","text":"","expect":0},{"action":"pumpAndSettle","type":"","text":"","expect":0},{"action":"pump","type":"","text":"","expect":0},{"action":"delayed","type":"","text":"","expect":0},{"action":"find.text","type":"","text":"TabBar >>>","expect":0},{"action":"expect","type":"","text":"","expect":1},{"action":"tap","type":"","text":"","expect":0},{"action":"pumpAndSettle","type":"","text":"","expect":0},{"action":"pump","type":"","text":"","expect":0},{"action":"delayed","type":"","text":"","expect":0},{"action":"find.text","type":"","text":"All","expect":0},{"action":"expect","type":"","text":"","expect":1},{"action":"tap","type":"","text":"","expect":0},{"action":"pumpAndSettle","type":"","text":"","expect":0},{"action":"pump","type":"","text":"","expect":0},{"action":"delayed","type":"","text":"","expect":0},{"action":"takeScreenshot","type":"","text":"","expect":0},{"action":"find.text","type":"","text":"Active","expect":0},{"action":"expect","type":"","text":"","expect":1},{"action":"tap","type":"","text":"","expect":0},{"action":"pumpAndSettle","type":"","text":"","expect":0},{"action":"pump","type":"","text":"","expect":0},{"action":"delayed","type":"","text":"","expect":0},{"action":"takeScreenshot","type":"","text":"","expect":0},{"action":"find.text","type":"","text":"Inactive","expect":0},{"action":"expect","type":"","text":"","expect":1},{"action":"tap","type":"","text":"","expect":0},{"action":"pumpAndSettle","type":"","text":"","expect":0},{"action":"pump","type":"","text":"","expect":0},{"action":"delayed","type":"","text":"","expect":0},{"action":"takeScreenshot","type":"","text":"","expect":0},{"action":"delayed","type":"","text":"","expect":0},{"action":"delayed","type":"","text":"","expect":0}]';
    //StaggeredView
    // var jsonArray = '[{"action":"pumpAndSettle"},{"action":"delayed"},{"action":"pump","type":"","text":"","expect":0},{"action":"find.text","type":"","text":"fair使用和介绍","expect":0},{"action":"expect","type":"","text":"","expect":1},{"action":"find.text","type":"","text":"fair 模板代码","expect":0},{"action":"expect","type":"","text":"","expect":1},{"action":"tap"},{"action":"pumpAndSettle"},{"action":"pump"},{"action":"delayed"},{"action":"find.text","type":"","text":"StaggeredView >>>","expect":0},{"action":"expect","type":"","text":"","expect":1},{"action":"tap"},{"action":"pumpAndSettle"},{"action":"delayed"},{"action":"pumpAndSettle","type":"","text":"","expect":0},{"action":"takeScreenshot"}]';
    //ScrollView
    // var jsonArray = '[{"action":"delayed","type":"","text":"","expect":0},{"action":"delayed","type":"","text":"","expect":0},{"action":"pumpAndSettle","type":"","text":"","expect":0},{"action":"pump","type":"","text":"","expect":0},{"action":"find.text","type":"","text":"fair使用和介绍","expect":0},{"action":"expect","type":"","text":"","expect":1},{"action":"find.text","type":"","text":"fair 模板代码","expect":0},{"action":"expect","type":"","text":"","expect":1},{"action":"tap","type":"","text":"","expect":0},{"action":"pumpAndSettle","type":"","text":"","expect":0},{"action":"pump","type":"","text":"","expect":0},{"action":"find.text","type":"","text":"Scrollview >>>","expect":0},{"action":"expect","type":"","text":"","expect":1},{"action":"tap","type":"","text":"","expect":0},{"action":"pumpAndSettle","type":"","text":"","expect":0},{"action":"pump","type":"","text":"","expect":0},{"action":"delayed","type":"","text":"","expect":0},{"action":"delayed","type":"","text":"","expect":0},{"action":"pumpAndSettle","type":"","text":"","expect":0},{"action":"pump","type":"","text":"","expect":0},{"action":"find.text","type":"","text":"Flutter Best UI x Fair 最佳实践","expect":0},{"action":"expect","type":"","text":"","expect":1},{"action":"delayed","type":"","text":"","expect":0},{"action":"takeScreenshot","type":"","text":"","expect":0},{"action":"delayed","type":"","text":"","expect":0}]';
    //PageView
    // var jsonArray = '[{"action":"delayed","type":"","text":"","expect":0},{"action":"delayed","type":"","text":"","expect":0},{"action":"pumpAndSettle","type":"","text":"","expect":0},{"action":"pump","type":"","text":"","expect":0},{"action":"find.text","type":"","text":"fair使用和介绍","expect":0},{"action":"expect","type":"","text":"","expect":1},{"action":"find.text","type":"","text":"fair 模板代码","expect":0},{"action":"expect","type":"","text":"","expect":1},{"action":"tap","type":"","text":"","expect":0},{"action":"pumpAndSettle","type":"","text":"","expect":0},{"action":"pump","type":"","text":"","expect":0},{"action":"delayed","type":"","text":"","expect":0},{"action":"find.text","type":"","text":"PageView >>>","expect":0},{"action":"expect","type":"","text":"","expect":1},{"action":"tap","type":"","text":"","expect":0},{"action":"pumpAndSettle","type":"","text":"","expect":0},{"action":"pump","type":"","text":"","expect":0},{"action":"delayed","type":"","text":"","expect":0},{"action":"delayed","type":"","text":"","expect":0},{"action":"pumpAndSettle","type":"","text":"","expect":0},{"action":"pump","type":"","text":"","expect":0},{"action":"delayed","type":"","text":"","expect":0},{"action":"takeScreenshot","type":"","text":"","expect":0},{"action":"delayed","type":"","text":"","expect":0}]';

    await util.test( tester, binding,jsonArray);
  });

}

