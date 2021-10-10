import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'timeline_page_event.dart';
part 'timeline_page_state.dart';

class TimelinePageBloc extends Bloc<TimelinePageEvent, TimelinePageState> {
  TimelinePageBloc() : super(TimelinePageInitial());

  @override
  Stream<TimelinePageState> mapEventToState(
    TimelinePageEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
