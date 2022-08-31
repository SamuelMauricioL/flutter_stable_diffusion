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
    this.description = '',
    this.status = PanelStatus.initial,
  });

  final String description;
  final PanelStatus status;

  @override
  List<Object> get props => [description, status];

  PanelState copyWith({
    String? description,
    PanelStatus? status,
  }) {
    return PanelState(
      description: description ?? this.description,
      status: status ?? this.status,
    );
  }
}
