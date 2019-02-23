import 'package:flutter/material.dart';

import '../blocs/list_bloc.dart';
import '../blocs/list_bloc_provider.dart';
import './list_screen.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen();
  
  @override
  State<StatefulWidget> createState() {
    return LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen> {
  ListBloc _bloc;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _bloc = ListBlocProvider.of(context);
  }

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Column(
          children: <Widget>[
            StreamBuilder(
              stream: _bloc.usernameObservable,
              builder: (context, snapshot) => TextField(
                decoration: InputDecoration(
                  labelText: 'Username...',
                ),
                onChanged: _bloc.changeUsername,
              ),
            ),
            StreamBuilder(
              stream: _bloc.passwordObservable,
              builder: (context, snapshot) => TextField(
                decoration: InputDecoration(
                  labelText: 'Password...',
                ),
                onChanged: _bloc.changePassword,
              ),
            ),
            RaisedButton(
              color: Color(Colors.cyan.value),
              child: Text('Login'),
              onPressed: () async {
                await _bloc.login();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ListScreen(),
                  ),
                );
              }
            ),
            RaisedButton(
              color: Color(Colors.yellow.value),
              child: Text('Signup'),
              onPressed: () async {
                String userId = await _bloc.signup();
                print(userId);
              },
            )
          ],
        ),
      ),
    );
  }
}
