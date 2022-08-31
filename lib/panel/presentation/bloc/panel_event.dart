part of 'panel_bloc.dart';

abstract class PanelEvent extends Equatable {
  const PanelEvent();

  @override
  List<Object> get props => [];
}

class ChangeDescription extends PanelEvent {
  const ChangeDescription(this.description);

  final String description;

  @override
  List<Object> get props => [description];
}

class GetImage extends PanelEvent {
  const GetImage();

  @override
  List<Object> get props => [];
}
