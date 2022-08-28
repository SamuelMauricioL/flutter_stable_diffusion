part of 'panel_bloc.dart';

abstract class PanelEvent extends Equatable {
  const PanelEvent();

  @override
  List<Object> get props => [];
}

class PanelEventSetDescription extends PanelEvent {
  const PanelEventSetDescription(this.description);

  final String description;

  @override
  List<Object> get props => [description];
}
