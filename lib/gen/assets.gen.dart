/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/english.png
  AssetGenImage get english => const AssetGenImage('assets/images/english.png');

  /// File path: assets/images/khmer.png
  AssetGenImage get khmer => const AssetGenImage('assets/images/khmer.png');

  /// File path: assets/images/otp1.png
  AssetGenImage get otp1 => const AssetGenImage('assets/images/otp1.png');

  /// File path: assets/images/otp2.png
  AssetGenImage get otp2 => const AssetGenImage('assets/images/otp2.png');

  /// List of all assets
  List<AssetGenImage> get values => [english, khmer, otp1, otp2];
}

class $AssetsSvgGen {
  const $AssetsSvgGen();

  /// File path: assets/svg/about_us.svg
  String get aboutUs => 'assets/svg/about_us.svg';

  /// File path: assets/svg/cart.svg
  String get cart => 'assets/svg/cart.svg';

  /// File path: assets/svg/cart_filled.svg
  String get cartFilled => 'assets/svg/cart_filled.svg';

  /// File path: assets/svg/category.svg
  String get category => 'assets/svg/category.svg';

  /// File path: assets/svg/delivery_address.svg
  String get deliveryAddress => 'assets/svg/delivery_address.svg';

  /// File path: assets/svg/edit.svg
  String get edit => 'assets/svg/edit.svg';

  /// File path: assets/svg/faq.svg
  String get faq => 'assets/svg/faq.svg';

  /// File path: assets/svg/help_center.svg
  String get helpCenter => 'assets/svg/help_center.svg';

  /// File path: assets/svg/home.svg
  String get home => 'assets/svg/home.svg';

  /// File path: assets/svg/home_filled.svg
  String get homeFilled => 'assets/svg/home_filled.svg';

  /// File path: assets/svg/language.svg
  String get language => 'assets/svg/language.svg';

  /// File path: assets/svg/member_ship.svg
  String get memberShip => 'assets/svg/member_ship.svg';

  /// File path: assets/svg/my_order.svg
  String get myOrder => 'assets/svg/my_order.svg';

  /// File path: assets/svg/notification.svg
  String get notification => 'assets/svg/notification.svg';

  /// File path: assets/svg/notifications.svg
  String get notifications => 'assets/svg/notifications.svg';

  /// File path: assets/svg/order.svg
  String get order => 'assets/svg/order.svg';

  /// File path: assets/svg/order_filled.svg
  String get orderFilled => 'assets/svg/order_filled.svg';

  /// File path: assets/svg/privacy.svg
  String get privacy => 'assets/svg/privacy.svg';

  /// File path: assets/svg/profile.svg
  String get profile => 'assets/svg/profile.svg';

  /// File path: assets/svg/profile_filled.svg
  String get profileFilled => 'assets/svg/profile_filled.svg';

  /// File path: assets/svg/signout.svg
  String get signout => 'assets/svg/signout.svg';

  /// File path: assets/svg/store.svg
  String get store => 'assets/svg/store.svg';

  /// File path: assets/svg/term_condition.svg
  String get termCondition => 'assets/svg/term_condition.svg';

  /// File path: assets/svg/wallet.svg
  String get wallet => 'assets/svg/wallet.svg';

  /// File path: assets/svg/wishlist.svg
  String get wishlist => 'assets/svg/wishlist.svg';

  /// List of all assets
  List<String> get values => [
        aboutUs,
        cart,
        cartFilled,
        category,
        deliveryAddress,
        edit,
        faq,
        helpCenter,
        home,
        homeFilled,
        language,
        memberShip,
        myOrder,
        notification,
        notifications,
        order,
        orderFilled,
        privacy,
        profile,
        profileFilled,
        signout,
        store,
        termCondition,
        wallet,
        wishlist
      ];
}

class Assets {
  Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsSvgGen svg = $AssetsSvgGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
