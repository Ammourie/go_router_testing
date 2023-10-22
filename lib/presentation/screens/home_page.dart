import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../data/models/user_model.dart';
import '../../logic/auth cubit/auth_cubit.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("HomePage"),
        actions: [
          IconButton(
              onPressed: () {
                context.read<AuthCubit>().logout();
              },
              icon: const Icon(Icons.logout))
        ],
      ),
      body: Center(
        child: MaterialButton(
          onPressed: () {
            context.pushNamed("SecondPage",
                extra: UserModel(
                    firstName: "firstName", lastName: "lastName", age: 13));
          },
          color: Colors.black,
          child: const Text(
            "second page",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
