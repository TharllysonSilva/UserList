import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:userlist/models/user.dart';
import 'package:userlist/provider/users.dart';

class UserForm extends StatefulWidget {
  UserForm({super.key});

  @override
  State<UserForm> createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {
  final _form = GlobalKey<FormState>();

  final Map<String, String> _formData = {};

  void _loadFormData(User user) {
    if (user != '') {
      _formData['id'] = user.id.toString();
      _formData['name'] = user.name.toString();
      _formData['email'] = user.email.toString();
      _formData['avatarUrl'] = user.avatarUrl.toString();
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final User user = ModalRoute.of(context)?.settings.arguments as User;
    _loadFormData(user);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(
          color: Colors.white,
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
        title: const Text('Formulario de Usuários'),
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
        actions: [
          IconButton(
            onPressed: () {
              final isValid = _form.currentState!.validate();

              if (isValid) {
                _form.currentState!.save();

                Provider.of<Users>(context, listen: false).put(
                  User(
                    id: _formData['id'].toString(),
                    name: _formData['name'].toString(),
                    email: _formData['email'].toString(),
                    avatarUrl: _formData['avatarUrl'].toString(),
                  ),
                );

                Navigator.of(context).pop();
              }
            },
            icon: const Icon(Icons.save),
            color: Colors.white,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _form,
          child: Column(
            children: <Widget>[
              TextFormField(
                initialValue: _formData['name'],
                validator: (value) {
                  if (value == '') {
                    return 'Digite um nome';
                  }
                  return null;
                },
                onSaved: (value) => _formData['name'] = value.toString(),
                decoration: const InputDecoration(labelText: 'Nome'),
              ),
              TextFormField(
                initialValue: _formData['email'],
                validator: (value) {
                  if (value == '') {
                    return 'Digite um email';
                  }
                  return null;
                },
                onSaved: (value) => _formData['email'] = value.toString(),
                decoration: const InputDecoration(labelText: 'E-mail'),
              ),
              TextFormField(
                initialValue: _formData['avatarUrl'],
                onSaved: (value) => _formData['avatarUrl'] = value.toString(),
                decoration: const InputDecoration(labelText: 'Url do Avatar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
