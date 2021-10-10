import 'package:flutter/material.dart';
import 'package:socialui/ui/pages/home_page.dart';
import 'injector_container.dart' as di;
import 'common/navigation_classes/router.gr.dart' as Rt;

void main() async {
  await di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: HomePage(),
        onGenerateRoute: Rt.Router.onGenerateRoute,
        initialRoute: Rt.Router.homePage,
        navigatorKey: Rt.Router.navigator.key);
  }
}
