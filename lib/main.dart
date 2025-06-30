import 'package:u_movieapp_bloc/export.dart';

void main() {
  setupLocator(); // Initialize GetIt
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    // DeviceOrientation.landscapeLeft,
    // DeviceOrientation.landscapeRight,
  ]).then((_) async {
    await dotenv.load(fileName: "assets/.env");
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) =>
              getIt<ThemeBloc>()..add(LoadThemeEvent()), //..loadTheme(),
        ),
        BlocProvider(create: (_) => getIt<MoviesBloc>()),
        BlocProvider(
          create: (_) => getIt<FavoritesBloc>(), //..add(LoadFavorites()),
        ),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
            navigatorKey: getIt<NavigationService>().navigatorKey,
            debugShowCheckedModeBanner: false,
            title: 'Movies App',
            theme: state is LightThemeState
                ? MyThemeData.lightTheme
                : MyThemeData.darkTheme,
            home: const SplashScreen(),
            // const SplashScreen(), //const MovieDetailsScreen(), //const FavoritesScreen(), //const MoviesScreen(),
          );
        },
      ),
    );
  }
}
