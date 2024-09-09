abstract class NavigationState {}

class NavigationChangedState extends NavigationState {
  final int index;
  NavigationChangedState({
    required this.index,
  });
}
