import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'bloc_observer.dart';
import 'config/routes/app_routes.dart';
import 'config/themes/app_themes.dart';
import 'data/network/local.dart';
import 'data/network/remote.dart';
import 'features/home/presentation/cubit/home_cubit.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await DioHelper.init();
  await CacheHelper.init();
  runApp(MyApp(
    appRouter: AppRouter(),
  ));
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter;
  const MyApp({super.key, required this.appRouter});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return BlocProvider(
        create: (context) => HomeCubit()..getHomeData(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: appTheme(),
          onGenerateRoute: AppRouter.onGenerateRoute,
        ),
      );
    });
  }
}
