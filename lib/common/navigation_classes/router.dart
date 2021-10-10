import 'package:auto_route/auto_route_annotations.dart';
import 'package:socialui/ui/pages/chats_page.dart';
import 'package:socialui/ui/pages/home_page.dart';
import 'package:socialui/ui/pages/profile_page.dart';
import 'package:socialui/ui/pages/texting_page.dart';
import 'package:socialui/ui/pages/timeline_page.dart';

@MaterialAutoRouter()
class $Router {
  @initial
  HomePage homePage;
  TimelinePage timelinePage;
  ChatsPage chatsPage;
  TextingPage textingPage;
  ProfilePage profilePage;
}
