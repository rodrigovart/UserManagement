// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:app/models/user.dart';
import 'package:app/provider/users.dart';
import 'package:provider/provider.dart';

class UserForm extends StatelessWidget {
  const UserForm({Key? key}) : super(key: key);

  static final _form = GlobalKey<FormState>();
  static final Map<String, String> _formData = {};
  // ignore: prefer_typing_uninitialized_variables
  static var id;

  void _fillForm(UserModel? user) {
    id = user?.id;
    _formData['nome'] = user?.nome ?? '';
    _formData['email'] = user?.email ?? '';
    _formData['avatar'] = user?.avatar ?? '';
  }

  @override
  Widget build(BuildContext context) {
    final UserModel? user =
        (ModalRoute.of(context)?.settings.arguments) as UserModel?;

    _fillForm(user);

    final UsersProvider usersProvider = Provider.of(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Formulário'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: () {
              final isValid = _form.currentState?.validate() ?? false;

              if (isValid) {
                _form.currentState?.save();
                usersProvider.put(UserModel(
                  id: id,
                  nome: _formData['nome'] ?? '',
                  email: _formData['email'] ?? '',
                  avatar: _formData['avatar'] ?? '',
                ));
                Navigator.of(context).pop();
              }
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Form(
          key: _form,
          child: Column(
            children: <Widget>[
              TextFormField(
                initialValue: _formData['nome'],
                decoration: const InputDecoration(labelText: 'Nome'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'VALOR NAO PODE SER VAZIO!';
                  }
                  return null;
                },
                onSaved: (value) => _formData['nome'] = value!,
              ),
              TextFormField(
                initialValue: _formData['email'],
                decoration: const InputDecoration(labelText: 'Email'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'VALOR NAO PODE SER VAZIO!';
                  }
                  return null;
                },
                onSaved: (value) => _formData['email'] = value!,
              ),
              TextFormField(
                initialValue: _formData['avatar'],
                decoration: const InputDecoration(labelText: 'Url Avatar'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'VALOR NAO PODE SER VAZIO!';
                  }
                  return null;
                },
                onSaved: (value) => _formData['avatar'] = value!,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
