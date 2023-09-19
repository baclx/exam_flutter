
import 'package:equatable/equatable.dart';

import '../../model/place-model.dart';

abstract class CubitStates extends Equatable {}

class LoadingState extends CubitStates {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class DestinationLoadedState extends CubitStates {
  DestinationLoadedState({required this.places});

  final List<Place> places;

  @override
  // TODO: implement props
  List<Object?> get props => [places];
}


class InitialState extends CubitStates {
  @override
  // TODO: implement props
  List<Object> get props => [];
}
