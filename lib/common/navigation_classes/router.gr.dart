import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:socialui/ui/pages/chats_page.dart';
import 'package:socialui/ui/pages/home_page.dart';
import 'package:socialui/ui/pages/profile_page.dart';
import 'package:socialui/ui/pages/texting_page.dart';
import 'package:socialui/ui/pages/timeline_page.dart';
import 'package:page_transition/page_transition.dart';

class Router {
  static const homePage = '/homePage';
  static const timelinePage = '/timelinePage';
  static const chatsPage = '/chatsPage';
  static const textingPage = '/textingPage';
  static const profilePage = '/profilePage';

  static final navigator = ExtendedNavigator();
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case Router.homePage:
        return PageTransition(
            child: HomePage(), type: PageTransitionType.topToBottom);
      case Router.timelinePage:
        return PageTransition(
            child: TimelinePage(), type: PageTransitionType.rightToLeft);
      case Router.chatsPage:
        return PageTransition(
            child: ChatsPage(), type: PageTransitionType.bottomToTop);
      case Router.textingPage:
        return PageTransition(
            child: TextingPage(), type: PageTransitionType.fade);
      case Router.profilePage:
        return PageTransition(
            child: ProfilePage(), type: PageTransitionType.scale);
      default:
        return unknownRoutePage(settings.name);
    }
  }
}
