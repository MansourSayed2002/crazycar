part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class LogInLoading extends AuthState {}

final class LogInSuccess extends AuthState {}

final class LogInError extends AuthState {
  final String message;
  LogInError({required this.message});
}

final class VerifyCodeLoading extends AuthState {}

final class VerifyCodeSuccess extends AuthState {}

final class VerifyCodeFail extends AuthState {}

final class RegisterLoading extends AuthState {}

final class RegisterSuccess extends AuthState {}

final class RegisterError extends AuthState {
  final String message;
  RegisterError({required this.message});
}

final class CompleteRegisterLoading extends AuthState {}

final class CompleteRegisterSuccess extends AuthState {}

final class CompleteRegisterError extends AuthState {}
