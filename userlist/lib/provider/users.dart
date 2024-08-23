import 'package:flutter/material.dart';
import 'package:userlist/data/dummy_users.dart';
import 'package:userlist/models/user.dart';

class Users with ChangeNotifier {
  final Map<String, User> _items = {...dummyUsers};

  List<User> get all {
    return [..._items.values];
  }

  int get count {
    return _items.length;
  }
}
