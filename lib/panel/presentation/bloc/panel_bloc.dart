import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'panel_event.dart';
part 'panel_state.dart';

class PanelBloc extends Bloc<PanelEvent, PanelState> {
  PanelBloc() : super(const PanelState()) {
    on<ChangeDescription>(_onChangeDescription);
  }

  Future<void> _onChangeDescription(
    ChangeDescription event,
    Emitter<PanelState> emit,
  ) async {
    emit(state.copyWith(description: event.description));
  }
}
