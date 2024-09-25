

import 'package:flutter_ecogrow_customer/shared/constant/app_token.dart';

class UserMixin {

  UserMixin(this._appToken);


  AppToken _appToken;

  int? get ui =>   _appToken.getUser().id!;

}

