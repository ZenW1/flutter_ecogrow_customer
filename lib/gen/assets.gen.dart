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

  /// File path: assets/images/otp1.png
  AssetGenImage get otp1 => const AssetGenImage('assets/images/otp1.png');

  /// File path: assets/images/otp2.png
  AssetGenImage get otp2 => const AssetGenImage('assets/images/otp2.png');

  /// List of all assets
  List<AssetGenImage> get values => [otp1, otp2];
}

class $AssetsSvgGen {
  const $AssetsSvgGen();

  /// File path: assets/svg/cart.svg
  String get cart => 'assets/svg/cart.svg';

  /// File path: assets/svg/cart_filled.svg
  String get cartFilled => 'assets/svg/cart_filled.svg';

  /// File path: assets/svg/category.svg
  String get category => 'assets/svg/category.svg';

  /// File path: assets/svg/home.svg
  String get home => 'assets/svg/home.svg';

  /// File path: assets/svg/home_filled.svg
  String get homeFilled => 'assets/svg/home_filled.svg';

  /// File path: assets/svg/notification.svg
  String get notification => 'assets/svg/notification.svg';

  /// File path: assets/svg/order.svg
  String get order => 'assets/svg/order.svg';

  /// File path: assets/svg/order_filled.svg
  String get orderFilled => 'assets/svg/order_filled.svg';

  /// File path: assets/svg/profile.svg
  String get profile => 'assets/svg/profile.svg';

  /// File path: assets/svg/profile_filled.svg
  String get profileFilled => 'assets/svg/profile_filled.svg';

  /// List of all assets
  List<String> get values => [
        cart,
        cartFilled,
        category,
        home,
        homeFilled,
        notification,
        order,
        orderFilled,
        profile,
        profileFilled
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
