import 'package:get_it/get_it.dart';
import 'package:socialui/ui/blocs/chats_page_bloc/chats_page_bloc.dart';
import 'package:socialui/ui/blocs/home_page_bloc/home_page_bloc.dart';
import 'package:socialui/ui/blocs/profile_page_bloc/profile_page_bloc.dart';
import 'package:socialui/ui/blocs/texting_page_bloc/texting_page_bloc.dart';
import 'package:socialui/ui/blocs/timeline_page_bloc/timeline_page_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! Features - Number Trivia
  // Bloc
  sl.registerFactory(
    () => HomePageBloc(),
  );

  sl.registerFactory(
    () => TimelinePageBloc(),
  );

  sl.registerFactory(
    () => ChatsPageBloc(),
  );

  sl.registerFactory(
    () => TextingPageBloc(),
  );

  sl.registerFactory(
    () => ProfilePageBloc(),
  );
}
