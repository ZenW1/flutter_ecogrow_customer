part of 'home_cubit.dart';

class HomeState extends Equatable {
  const HomeState({this.currentIndex, this.indexCount});
  final int? currentIndex;
  final int? indexCount;

  @override
  List<Object> get props => [currentIndex!, indexCount!];
}
