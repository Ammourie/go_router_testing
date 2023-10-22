part of 'auth_cubit.dart';

enum AuthStatus { unknown, authenticated, unauthenticated }

class AuthState extends Equatable {
  final AuthStatus authStatus;
  const AuthState({this.authStatus = AuthStatus.unknown});

  @override
  List<Object> get props => [authStatus];
}
