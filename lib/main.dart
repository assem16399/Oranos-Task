import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oranos/features/favorites/logic/cubit/favorites_cubit.dart';
import 'package:oranos/features/home/logic/home_cubit.dart';
import 'package:oranos/layout/app_layout.dart';

import '/features/chat/logic/messages_cubit.dart';
import 'core/components/constants/bloc_observer.dart';
import 'core/dependency_injection/injection_container.dart' as di;
import 'core/network/remote/dio_helper.dart';
import 'core/styles/themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  DioHelper.init();
  di.init();

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
        BlocProvider<HomeCubit>(create: (context) => di.sl.get<HomeCubit>()),
        BlocProvider<FavoritesCubit>(create: (context) => FavoritesCubit()),
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
