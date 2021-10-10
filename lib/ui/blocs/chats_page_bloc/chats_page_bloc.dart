import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'chats_page_event.dart';
part 'chats_page_state.dart';

class ChatsPageBloc extends Bloc<ChatsPageEvent, ChatsPageState> {
  ChatsPageBloc() : super(ChatsPageInitial());

  @override
  Stream<ChatsPageState> mapEventToState(
    ChatsPageEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
