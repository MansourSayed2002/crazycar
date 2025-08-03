part of 'rider_home_cubit.dart';

@immutable
sealed class RiderHomeState {}

final class RiderHomeInitial extends RiderHomeState {}

final class RiderHomeLoading extends RiderHomeState {}

final class RiderHomeSuccess extends RiderHomeState {}

final class RiderHomeError extends RiderHomeState {}

final class SearchLoading extends RiderHomeState {}

final class SearchSuccess extends RiderHomeState {
  SearchSuccess({required this.locations});
  final List<LocationWithName> locations;
}

final class SearchError extends RiderHomeState {
  SearchError({required this.message});
  final String message;
}
