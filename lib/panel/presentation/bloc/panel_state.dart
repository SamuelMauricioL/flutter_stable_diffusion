part of 'panel_bloc.dart';

enum PanelStatus {
  initial(''),
  loading('Creando imagen'),
  success('Imagen creada'),
  failed('Ocurrio un problema al crear la imagen'),
  empty('No se encontró una imagen para esta descripción');

  const PanelStatus(this.message);
  final String message;
}

class PanelState extends Equatable {
  const PanelState({
    this.status = PanelStatus.initial,
    this.description = const DescriptionFormInput.pure(),
    this.descriptionStatus = FormzStatus.pure,
  });

  final PanelStatus status;
  final DescriptionFormInput description;
  final FormzStatus descriptionStatus;

  @override
  List<Object> get props => [description, descriptionStatus, status];

  PanelState copyWith({
    PanelStatus? status,
    DescriptionFormInput? description,
    FormzStatus? descriptionStatus,
  }) {
    return PanelState(
      status: status ?? this.status,
      description: description ?? this.description,
      descriptionStatus: descriptionStatus ?? this.descriptionStatus,
    );
  }
}
