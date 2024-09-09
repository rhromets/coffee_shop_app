import 'package:coffee_shop_app/widgets/bottom_nav_bar/bloc/navigation.state.dart';
import 'package:coffee_shop_app/widgets/bottom_nav_bar/bloc/navigation_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc() : super(NavigationChangedState(index: 0)) {
    on<NavigateToEvent>((event, emit) {
      emit(NavigationChangedState(index: event.index));
    });
  }
}
