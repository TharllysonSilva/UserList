import 'package:flutter/material.dart';
import 'package:userlist/components/user_tile.dart';
import 'package:userlist/data/dummy_users.dart';

class ListUsers extends StatelessWidget {
  const ListUsers({super.key});

  @override
  Widget build(BuildContext context) {
    final users = {...dummyUsers};

    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            color: Colors.white,
            icon: const Icon(Icons.add),
          ),
        ],
        centerTitle: true,
        backgroundColor: Colors.blue,
        title: const Text('Lista de usuarios'),
        titleTextStyle: const TextStyle(color: Colors.white, fontSize: 20),
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (ctx, i) => UserTile(users.values.elementAt(i)),
      ),
    );
  }
}
