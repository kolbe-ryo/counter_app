import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'pages/main/main_page.dart';
import 'pages/signin/sign_in_page.dart';
import 'pages/signup/sign_up_page.dart';
import 'pages/top/top_page.dart';

/// 画面遷移の定義プロバイダー
final routerProvider = Provider<GoRouter>(
  (ref) => GoRouter(
    initialLocation: '/',
    navigatorKey: GlobalKey<NavigatorState>(),
    routes: [
      GoRoute(
        path: '/',
        pageBuilder: (context, state) => const TopPageRoute().buildPage(context, state),
        routes: [
          GoRoute(
            path: 'signup',
            builder: (BuildContext context, GoRouterState state) {
              return const SignUpPage();
            },
          ),
          GoRoute(
            path: 'signin',
            builder: (BuildContext context, GoRouterState state) {
              return const SignInPage();
            },
          ),
          GoRoute(
            path: 'main_page',
            builder: (BuildContext context, GoRouterState state) {
              return const MainPage();
            },
          ),
        ],
      ),
    ],
    redirect: (_, state) {
      if (FirebaseAuth.instance.currentUser == null) {
        return state.matchedLocation == '/signin' ? null : '/';
      }
      return null;
    },
    // refreshListenable: ref.watch(ログイン状態の監視)
    // エラー画面
    // errorPageBuilder: (context, state) => ErrorRoute(state.error).buildPage(context, state),
  ),
);

/// トップ画面
class TopPageRoute extends GoRouteData {
  const TopPageRoute();

  static const name = 'top';

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return TransitionPage.fade(
      name: name,
      child: const TopPage(),
    );
  }
}

// /// リポジトリ詳細画面
// ///
// /// 下記の go_router_builder のバグ？があるため、$extra でキャッシュされた Repo
// /// を受け取るのをやめている。バグが直ったら元に戻したい。
// ///
// /// ＜バグの内容＞
// /// https://github.com/flutter/flutter/issues/106121
// /// $extra を含むルートがネストしていて、ネストしたページを開いたときにエラーが発生する。
// /// アバター画面表示時に $extra に AvatarPreviewRoute インスタンスがきて
// /// 型不一致でエラーになってしまう。
// ///
// /// ＜回避方法＞
// /// $extra をやめること。
// class RepoViewRoute extends GoRouteData {
//   const RepoViewRoute(
//     this.ownerName,
//     this.repoName,
//   );

//   factory RepoViewRoute.from(Repo repo) => RepoViewRoute(
//         repo.ownerName,
//         repo.repoName,
//       );

//   final String ownerName;
//   final String repoName;

//   static const name = 'repo-view';

//   @override
//   Page<void> buildPage(BuildContext context, GoRouterState state) => TransitionPage.fade(
//         name: name,
//         child: ProviderScope(
//           overrides: [
//             currentRepoParamProvider.overrideWith(
//               (_) => RepoParam(
//                 ownerName: ownerName,
//                 repoName: repoName,
//               ),
//             ),
//           ],
//           child: const RepoViewPage(),
//         ),
//       );
// }

// /// エラー画面
// class ErrorRoute extends GoRouteData {
//   const ErrorRoute(
//     this.error,
//   );

//   final Exception? error;

//   static const name = 'error';

//   @override
//   Page<void> buildPage(BuildContext context, GoRouterState state) => TransitionPage.fade(
//         name: name,
//         child: ErrorPage(error: error),
//       );
// }

/// デフォルトのTransitionPage
class TransitionPage extends CustomTransitionPage<void> {
  const TransitionPage({
    required String name,
    required super.child,
    required super.transitionsBuilder,
    super.transitionDuration,
    super.maintainState,
    super.fullscreenDialog,
    super.opaque,
    super.barrierDismissible,
    super.barrierColor,
    super.barrierLabel,
    super.key,
    super.arguments,
    super.restorationId,
  }) : super(
          name: name,
        );

  factory TransitionPage.none({
    required Widget child,
    required String name,
  }) =>
      TransitionPage(
        name: name,
        child: child,
        transitionsBuilder: _noneTransitionsBuilder,
      );

  factory TransitionPage.fade({
    required Widget child,
    required String name,
  }) =>
      TransitionPage(
        name: name,
        child: child,
        transitionsBuilder: _fadeTransitionsBuilder,
      );

  static Widget _fadeTransitionsBuilder(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) =>
      FadeTransition(opacity: animation, child: child);

  static Widget _noneTransitionsBuilder(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) =>
      child;
}
