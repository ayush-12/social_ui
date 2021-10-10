import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'texting_page_event.dart';
part 'texting_page_state.dart';

class TextingPageBloc extends Bloc<TextingPageEvent, TextingPageState> {
  TextingPageBloc() : super(TextingPageInitial());

  @override
  Stream<TextingPageState> mapEventToState(
    TextingPageEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
