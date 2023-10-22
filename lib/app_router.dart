import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'data/models/user_model.dart';
import 'logic/auth cubit/auth_cubit.dart';
import 'logic/number%20cubit/number_cubit.dart';
import 'presentation/screens/home_page.dart';
import 'presentation/screens/login_page.dart';
import 'presentation/screens/second_page.dart';
import 'presentation/screens/third_page.dart';

class AppRouter {
  final AuthCubit authCubit;

  late final GoRouter router = GoRouter(
      routes: <RouteBase>[
        GoRoute(
          path: "/",
          name: "Home",
          builder: (context, state) => const HomePage(),
          routes: [
            GoRoute(
              path: "SecondPage",
              name: "SecondPage",
              builder: (context, state) => BlocProvider<NumberCubit>.value(
                value: numcubit,
                child: SecondPage(user: state.extra as UserModel),
              ),
            ),
            GoRoute(
              path: "ThirdPage/:id",
              name: "ThirdPage",
              builder: (context, state) => ThirdPage(
                id: int.parse(state.pathParameters['id']!),
              ),
            ),
          ],
        ),
        GoRoute(
          path: "/login",
          name: "LoginPage",
          builder: (context, state) => const LoginPage(),
        ),
      ],
      redirect: (context, state) {
        bool authenticated = context.read<AuthCubit>().state.authStatus ==
            AuthStatus.authenticated;
        bool loggingIn = state.fullPath == "/login";

        if (authenticated) {
          if (loggingIn) {
            return "/";
          } else {
            return null;
          }
        } else {
          return "/login";
        }
      },
      refreshListenable: listenStream(authCubit.stream));

  AppRouter(this.authCubit);
  static NumberCubit numcubit = NumberCubit();
  static dispose() {
    numcubit.close();
  }
}

class listenStream extends ChangeNotifier {
  listenStream(Stream<AuthState> stream) {
    notifyListeners();
    _subscription = stream.asBroadcastStream().listen((event) {
      notifyListeners();
    });
  }
  late final StreamSubscription _subscription;
  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
