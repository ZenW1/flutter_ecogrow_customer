part of 'main_cubit.dart';

class MainState {
  final int selectedIndex;

  const MainState({this.selectedIndex = 0});

  MainState copyWith({int? selectedIndex}) {
    return MainState(
      selectedIndex: selectedIndex ?? this.selectedIndex,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MainState && other.selectedIndex == selectedIndex;
  }

  @override
  int get hashCode => selectedIndex.hashCode;
}
