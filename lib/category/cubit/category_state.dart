part of 'category_cubit.dart';

class CategoryState extends Equatable {
  const CategoryState();
  @override
  List<Object> get props => [];
}

class CategoryLoading extends CategoryState {
  @override
  List<Object> get props => [];
}

class CategoryLoaded extends CategoryState {
  final CategoryResponseModel categoryResponseModel;

  CategoryLoaded({required this.categoryResponseModel});

  @override
  List<Object> get props => [categoryResponseModel];
}

class CategoryFailed extends CategoryState {
  final String message;

  CategoryFailed({required this.message});

  @override
  List<Object> get props => [message];
}
