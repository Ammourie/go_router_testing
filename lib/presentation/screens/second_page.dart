import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../data/models/user_model.dart';
import '../../logic/number%20cubit/number_cubit.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key, required this.user});
  final UserModel user;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SecondPage"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("number cubit${context.read<NumberCubit>().state.number}"),
            MaterialButton(
              onPressed: () {
                context.pushNamed("ThirdPage", pathParameters: {"id": "1"});
              },
              color: Colors.black,
              child: const Text(
                "Third page",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
