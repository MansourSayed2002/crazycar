import 'package:crazycar/features/auth/data/repo_imp/auth_repo_imp.dart';
import 'package:crazycar/features/auth/domain/repo_abs/auth_repo_abs.dart';
import 'package:crazycar/features/auth/domain/usecase/check_verify.dart';
import 'package:crazycar/features/auth/domain/usecase/complete_register_usecase.dart';
import 'package:crazycar/features/auth/domain/usecase/create_verify_and_send_usecase.dart';
import 'package:crazycar/features/auth/domain/usecase/login_usecase.dart';
import 'package:crazycar/features/auth/domain/usecase/register_usecase.dart';
import 'package:crazycar/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:crazycar/features/rider/home/data/repo_imp/rider_home_repo_imp.dart';
import 'package:crazycar/features/rider/home/domain/repo_abs/rider_home_repo_abs.dart';
import 'package:crazycar/features/rider/home/domain/usecase/get_nearby_driver_usecase.dart';
import 'package:crazycar/features/rider/home/domain/usecase/request_trip_usecase.dart';
import 'package:crazycar/features/rider/home/domain/usecase/search_about_place_usecase.dart';
import 'package:crazycar/features/rider/home/presentation/cubit/rider_home_cubit.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

Future<void> setUp() async {
  //===============================REPOSITORY=====================================
  getIt.registerLazySingleton<AuthRepoAbs>(() => AuthRepoImp());
  getIt.registerLazySingleton<RiderHomeRepoAbs>(() => RiderHomeRepoImp());

  //===============================USECASE========================================
  getIt.registerLazySingleton(() => LoginUsecase(authRepoAbs: getIt()));
  getIt.registerLazySingleton(
    () => CreateVerifyAndSendUsecase(authRepoAbs: getIt()),
  );

  getIt.registerLazySingleton(() => CheckVerifyUseCase(authRepoAbs: getIt()));
  getIt.registerLazySingleton(() => RegisterUsecase(authRepoAbs: getIt()));
  getIt.registerLazySingleton(
    () => CompleteRegisterUsecase(authRepoAbs: getIt()),
  );
  getIt.registerLazySingleton(() => SearchAboutPlaceUsecase());
  getIt.registerLazySingleton(
    () => GetNearbyDriverUsecase(riderHomeRepoAbs: getIt()),
  );
  getIt.registerLazySingleton(
    () => RequestTripUsecase(riderHomeRepoAbs: getIt()),
  );

  //===============================CUBIT STATREMANGEMENT==========================
  getIt.registerLazySingleton(
    () => AuthCubit(
      loginUsecase: getIt(),
      checkVerifyUseCase: getIt(),
      createVerify: getIt(),
      registerUsecase: getIt(),
      completeRegisterUsecase: getIt(),
    ),
  );
  getIt.registerLazySingleton(
    () => RiderHomeCubit(
      searchAboutPlaceUsecase: getIt(),
      getNearbyDriverUsecase: getIt(),
      requestTripUsecase: getIt(),
    ),
  );
}
