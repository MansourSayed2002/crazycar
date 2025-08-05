part of 'rider_home_cubit.dart';

@immutable
sealed class RiderHomeState {}

final class RiderHomeInitial extends RiderHomeState {}

final class RiderHomeLoading extends RiderHomeState {}

final class RiderHomeSuccess extends RiderHomeState {
  RiderHomeSuccess({required this.data, this.placemark, this.position});
  final List data;
  final Placemark? placemark;
  final Position? position;
}

final class RiderHomeError extends RiderHomeState {
  RiderHomeError({required this.message});
  final String message;
}

final class SearchLoading extends RiderHomeState {}

final class SearchSuccess extends RiderHomeState {
  SearchSuccess({required this.locations});
  final List<LocationWithName> locations;
}

final class SearchError extends RiderHomeState {
  SearchError({required this.message});
  final String message;
}
