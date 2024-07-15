import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../view/category_item_widget.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(const CategoryState());

  List<CategoryItemModel> categoryList = [
    CategoryItemModel(
      title: 'Vegetable',
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRgIxB4TqKd66zyoFXx9QiHPP_bsfzq6xLPHA&s',
    ),
    CategoryItemModel(
      title: 'Fruit',
      imageUrl:
          'https://m.media-amazon.com/images/I/313dtY-LOEL._AC_UF1000,1000_QL80_.jpg',
    ),
    CategoryItemModel(
      title: 'Meat',
      imageUrl:
          'https://m.economictimes.com/thumb/msid-95423731,width-1200,height-900,resizemode-4,imgsize-56196/tomatoes-canva.jpg',
    ),
    CategoryItemModel(
      title: 'Fish',
      imageUrl:
          'https://www.fervalle.com/wp-content/uploads/2022/07/580b57fcd9996e24bc43c216-1024x869.png',
    ),
    CategoryItemModel(
      title: 'Drink',
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSOvY2J8wtwxZDor81a79R1_9e93VaIEfNGOg&s',
    ),
  ];
}
