part of 'search_cubit.dart';

class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

class SearchLoading extends SearchState {
  @override
  List<Object> get props => [];
}

class SearchLoaded extends SearchState {
  final List<ProductModel> data;
  SearchLoaded({required this.data});

  @override
  List<Object> get props => [data];
}
