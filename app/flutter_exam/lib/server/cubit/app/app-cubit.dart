


import 'package:flutter_bloc/flutter_bloc.dart';

import '../../model/place-model.dart';
import '../../service/data-service.dart';
import '../state/cubit-state.dart';

class AppCubits extends Cubit<CubitStates> {

  final DataService dataService;
  //final AuthenticationService authService;

  AppCubits({required this.dataService}):super(InitialState()){
    loadHomePage();
  }

  var destination;
  late List<Place> places;
  late List<Place> favoritePlaces = [];
  var welcome;
  var userModel;

  void loadHomePage() async {
    try{
      emit(LoadingState());
      places = await dataService.getAllDestination();

      emit(DestinationLoadedState(places: places));

    }catch(e){
      print(e);
    }
  }
}