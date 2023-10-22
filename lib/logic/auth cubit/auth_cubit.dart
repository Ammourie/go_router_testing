import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(const AuthState());

  login() => emit(const AuthState(authStatus: AuthStatus.authenticated));
  logout() => emit(const AuthState(authStatus: AuthStatus.unauthenticated));
}
