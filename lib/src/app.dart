import 'package:flutter/material.dart';

import './blocs/add_new_list_bloc_provider.dart';
import './blocs/list_bloc_provider.dart';
import './ui/login_screen.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListBlocProvider(
      child: AddNewListProvider(
        child: MaterialApp(
          title: 'Flutter Demo',
          home: LoginScreen(),
        ),
      ),
    );
  }
}
