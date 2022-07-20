import 'package:go_router/go_router.dart';
import 'package:go_router_demo/main.dart';
import 'package:go_router_demo/src/posts/posts.dart';
import 'package:go_router_demo/src/users/user.dart';
import 'package:go_router_demo/src/users/users.dart';

class KAppRouter {
  static final router = GoRouter(
    redirect: (state) {
      return null;
    },
    routes: [
      GoRoute(
        name: 'home',
        path: '/',
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
          name: 'users',
          path: '/users',
          builder: (context, state) {
            print(state.extra);
            return const UsersScreen();
          }),
      GoRoute(
        name: 'user',
        path: '/users/:username',
        routes: [
          GoRoute(
            path: 'posts',
            name: 'posts',
            builder: ((context, state) {
              return const Posts();
            }),
          )
        ],
        builder: (context, state) => UserScreen(
          username: '${state.params['username']}',
        ),
      ),
      // GoRoute(
      //   path: '/posts',
      //   builder: (context, state) {
      //     print(state.queryParams['author']);
      //     return const Posts();
      //   },
      // ),
    ],
  );
}
