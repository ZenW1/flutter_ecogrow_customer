import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_ecogrow_customer/gen/assets.gen.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(const ProfileState());

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
}
