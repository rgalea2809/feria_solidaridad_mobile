// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';

class SocialLinkData {
  String url;
  String? displayName;
  Widget icon;

  SocialLinkData({
    required this.url,
    this.displayName,
    required this.icon,
  });
}
