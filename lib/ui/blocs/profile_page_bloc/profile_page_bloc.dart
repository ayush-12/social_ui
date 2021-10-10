import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'profile_page_event.dart';
part 'profile_page_state.dart';

class ProfilePageBloc extends Bloc<ProfilePageEvent, ProfilePageState> {
  ProfilePageBloc() : super(ProfilePageInitial());

  @override
  Stream<ProfilePageState> mapEventToState(
    ProfilePageEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
