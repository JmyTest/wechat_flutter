import 'package:flutter/material.dart';
import 'package:dim_example/tools/wechat_flutter.dart';

typedef OnSuCc = void Function(bool v);

Future<dynamic> addFriend(String userName, BuildContext context,
    {OnSuCc cc}) async {
  try {
    var result = await im.addFriend(userName);
    debugPrint('Dim添加好友result >>> $result');
    if (result.toString().contains('Friend_Exist')) {
      showToast(context, '朋友已存在');
    } else {
      showToast(context, '添加成功');
    }
    if (cc == null) {
      popToHomePage();
    } else {
      cc(true);
    }
  } on PlatformException {
    debugPrint('Dim添加好友  失败');
  }
}

Future<dynamic> getContactsFriends(String userName) async {
  try {
    var result = await im.listFriends(userName);
    return result;
  } on PlatformException {
    debugPrint('获取好友列表  失败');
  }
}
