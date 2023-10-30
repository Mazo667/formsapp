import 'package:go_router/go_router.dart';
import 'package:formsapp/presentation/screens/screens.dart';

final appRouter = GoRouter(
    routes: [
      //Home
        GoRoute(
            path: '/',
        builder: (context, state) => const HomeScreen()),
      //Cubits
      GoRoute(
          path: '/cubits',
          builder: (context, state) => const CubitCounterScreen()),
      //Block
      GoRoute(
          path: '/blocs',
          builder: (context, state) => const BlockCounterScreen()),
    ]);