import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_ecogrow_customer/data/model/register_model.dart';
import 'package:flutter_ecogrow_customer/data/model/user_info_model.dart';
import 'package:flutter_ecogrow_customer/gen/assets.gen.dart';
import 'package:flutter_ecogrow_customer/shared/constant/app_token.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this._appToken) : super(const ProfileLoading());

  final AppToken _appToken;

  Future<void> fetchUserInfo() async {
    // emit(const ProfileLoading());
    try {
      final response = await _appToken.getUser();
      emit(ProfileLoadSuccess(response));
    } catch (e) {
      emit(ProfileFailure(e.toString()));
    }
  }

  List<Map<String, dynamic>> get profileItems => [
        {
          'title': 'My Order',
          'icon': Assets.svg.myOrder,
        },
        {
          'title': 'Promotion',
          'icon': Assets.svg.privacy,
        },
        {
          'title': 'Wishlist',
          'icon': Assets.svg.wishlist,
        },
        {
          'title': 'Delivery Address',
          'icon': Assets.svg.deliveryAddress,
        },
        {
          'title': 'Wallets',
          'icon': Assets.svg.wallet,
        },
        {
          'title': 'Membership',
          'icon': Assets.svg.memberShip,
        },
        {
          'title': 'Store Register',
          'icon': Assets.svg.store,
        },
        {
          'title': 'Notification',
          'icon': Assets.svg.notification,
        },
        {
          'title': 'Languages',
          'icon': Assets.svg.language,
        },
        {
          'title': 'About Us',
          'icon': Assets.svg.aboutUs,
        },
        {
          'title': 'Privacy Policy',
          'icon': Assets.svg.privacy,
        },
        {
          'title': 'Term & Condition',
          'icon': Assets.svg.termCondition,
        },
        {
          'title': 'Help Center',
          'icon': Assets.svg.helpCenter,
        },
        {
          'title': 'FAQ',
          'icon': Assets.svg.faq,
        }
      ];

  // @override
  // Future<void> close() {
  //   return super.close();
  // }
}
