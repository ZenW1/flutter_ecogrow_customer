import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_ecogrow_customer/home/view/home_page.dart';

part 'checkout_state.dart';

class CheckoutCubit extends Cubit<CheckoutState> {
  CheckoutCubit() : super(const CheckoutState());

  List<ProductModel> data = [
    ProductModel(
      name: 'ONION',
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRgIxB4TqKd66zyoFXx9QiHPP_bsfzq6xLPHA&s',
      price: '6000',
      quantity: '1',
      weight: '3kg',
    ),
    ProductModel(
      name: 'POTATO',
      imageUrl:
          'https://m.media-amazon.com/images/I/313dtY-LOEL._AC_UF1000,1000_QL80_.jpg',
      price: '5000',
      quantity: '1',
      weight: '3kg',
    ),
    ProductModel(
      name: 'TOMATO',
      imageUrl:
          'https://m.economictimes.com/thumb/msid-95423731,width-1200,height-900,resizemode-4,imgsize-56196/tomatoes-canva.jpg',
      price: '4000',
      quantity: '2',
      weight: '3kg',
    ),
    ProductModel(
      name: 'CUCUMBER',
      imageUrl:
          'https://www.fervalle.com/wp-content/uploads/2022/07/580b57fcd9996e24bc43c216-1024x869.png',
      price: '3000',
      quantity: '3',
      weight: '3kg',
    ),
    ProductModel(
      name: 'CARROT',
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSOvY2J8wtwxZDor81a79R1_9e93VaIEfNGOg&s',
      price: '2000',
      quantity: '1',
      weight: '3kg',
    ),
  ];
}
