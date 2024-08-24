import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:userlist/components/user_tile.dart';
import 'package:userlist/provider/users.dart';
import 'package:userlist/routes/app_routes.dart';

class ListUsers extends StatelessWidget {
  const ListUsers({super.key});

  @override
  Widget build(BuildContext context) {
    final Users users = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(AppRoutes.userForm);
            },
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
        itemCount: users.count,
        itemBuilder: (ctx, i) => UserTile(users.byIndex(i)),
      ),
    );
  }
}
