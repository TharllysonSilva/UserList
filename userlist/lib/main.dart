import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:userlist/provider/users.dart';
import 'package:userlist/routes/app_routes.dart';
import 'package:userlist/views/user_form.dart';
import 'package:userlist/views/users_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Users(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        routes: {
          AppRoutes.home: (_) => ListUsers(),
          AppRoutes.userForm: (_) => UserForm(),
        },
      ),
    );
  }
}
