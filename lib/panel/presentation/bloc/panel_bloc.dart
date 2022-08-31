import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz_inputs/formz_inputs.dart';

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
    final description = DescriptionFormInput.dirty(event.description);
    emit(
      state.copyWith(
        description: description,
        descriptionStatus: Formz.validate([description]),
      ),
    );
  }
}
