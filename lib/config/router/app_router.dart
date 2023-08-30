
import 'package:go_router/go_router.dart';
import 'package:forms_app/presentation/screens/screens.dart';

//hemos instalado go_router
final appRouter = GoRouter(
  routes: [

    GoRoute
      (
        path: '/', //ruta por defecto
        builder: (context, state) => const HomeScreen(),
      ),

       GoRoute
      (
        path: '/cubits', 
        builder: (context, state) => const CubitCounterScreen(),
      ),
       GoRoute
      (
        path: '/counter-bloc', 
        builder: (context, state) => const BlocCounterScreen(),
      ),
  ]);
