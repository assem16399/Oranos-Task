import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:oranos/core/network/network_info.dart';
import 'package:oranos/features/home/data/provider/home_api.dart';
import 'package:oranos/features/home/logic/home_cubit.dart';
import 'package:oranos/layout/app_layout.dart';

import '/features/chat/logic/messages_cubit.dart';
import 'core/components/constants/bloc_observer.dart';
import 'core/network/remote/dio_helper.dart';
import 'core/styles/themes.dart';
import 'features/home/data/repo/home_repo.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  DioHelper.init();

  BlocOverrides.runZoned(
    () {
      runApp(const MyApp());
    },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MessagesCubit>(create: (context) => MessagesCubit()),
        BlocProvider<HomeCubit>(
          create: (context) => HomeCubit(
            homeRepo: HomeRepoImpl(
              homeApi: HomeApiWithDioImpl(),
              networkInfo: NetworkInfoImpl(InternetConnectionChecker()),
            ),
          ),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Oranos Task',
        theme: kLightTheme,
        home: const AppLayout(),
      ),
    );
  }
}
