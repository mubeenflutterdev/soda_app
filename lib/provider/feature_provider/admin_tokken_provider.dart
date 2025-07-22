import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:soda_bar/provider/feature_provider/user_info_provider.dart';
import 'package:soda_bar/utils/toast_utils.dart';

class AdminTokkenProvider with ChangeNotifier {
  String? adminToken;
  Future getAdminToken(BuildContext context) async {
    try {
      UserInfoProvider userInfoProvider = Provider.of<UserInfoProvider>(
        context,
        listen: false,
      );
      userInfoProvider.getUserInfo(context);
      adminToken = userInfoProvider.userInfo!.deviceToken;
    } catch (e) {
      ToastUtil.showToast(context, message: e.toString());
    }
  }
}
