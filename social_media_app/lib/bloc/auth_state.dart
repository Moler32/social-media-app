part of 'auth_cubit.dart';

abstract class AuthState extends Equatable {
  const AuthState(

  );
}

class AuthInitial extends AuthState {

  const AuthInitial();

  @override 
  List<Object> get props => [];
}

class AuthLoading extends AuthState {

  const AuthLoading();

  @override 
  List<Object> get props => [];
}

class AuthLSignedUp extends AuthState {

  const AuthLSignedUp();

  @override 
  List<Object> get props => [];
}

class AuthLSignedIn extends AuthState {

 const AuthLSignedIn();

  @override 
  List<Object> get props => [];
}

class AuthFailure extends AuthState {

  final String massege; 

 const AuthFailure({required this.massege});

  @override 
  List<Object> get props => [massege];
}