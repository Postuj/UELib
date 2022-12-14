// Mocks generated by Mockito 5.3.2 from annotations
// in mobile/test/core/di/test_module.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i10;
import 'dart:ui' as _i11;

import 'package:auto_route/auto_route.dart' as _i4;
import 'package:auto_route/src/matcher/route_matcher.dart' as _i3;
import 'package:auto_route/src/router/controller/navigation_history/navigation_history_base.dart'
    as _i5;
import 'package:auto_route/src/router/controller/pageless_routes_observer.dart'
    as _i7;
import 'package:auto_route/src/router/controller/routing_controller.dart'
    as _i9;
import 'package:flutter/material.dart' as _i6;
import 'package:mobile/core/presentation/router/router.dart' as _i8;
import 'package:mobile/features/auth/presentation/router/route_auth_guard.dart'
    as _i2;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeRouteAuthGuard_0 extends _i1.SmartFake
    implements _i2.RouteAuthGuard {
  _FakeRouteAuthGuard_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeRouteMatcher_1 extends _i1.SmartFake implements _i3.RouteMatcher {
  _FakeRouteMatcher_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeRouteCollection_2 extends _i1.SmartFake
    implements _i3.RouteCollection {
  _FakeRouteCollection_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeRouteData_3 extends _i1.SmartFake implements _i4.RouteData {
  _FakeRouteData_3(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeAutoRoutePage_4<T> extends _i1.SmartFake
    implements _i4.AutoRoutePage<T> {
  _FakeAutoRoutePage_4(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeNavigationHistory_5 extends _i1.SmartFake
    implements _i5.NavigationHistory {
  _FakeNavigationHistory_5(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeLocalKey_6 extends _i1.SmartFake implements _i6.LocalKey {
  _FakeLocalKey_6(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakePendingRoutesHandler_7 extends _i1.SmartFake
    implements _i4.PendingRoutesHandler {
  _FakePendingRoutesHandler_7(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakePagelessRoutesObserver_8 extends _i1.SmartFake
    implements _i7.PagelessRoutesObserver {
  _FakePagelessRoutesObserver_8(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeActiveGuardObserver_9 extends _i1.SmartFake
    implements _i4.ActiveGuardObserver {
  _FakeActiveGuardObserver_9(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeGlobalKey_10<T extends _i6.State<_i6.StatefulWidget>>
    extends _i1.SmartFake implements _i6.GlobalKey<T> {
  _FakeGlobalKey_10(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeUrlState_11 extends _i1.SmartFake implements _i4.UrlState {
  _FakeUrlState_11(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeStackRouter_12 extends _i1.SmartFake implements _i4.StackRouter {
  _FakeStackRouter_12(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeRouteMatch_13<T> extends _i1.SmartFake implements _i4.RouteMatch<T> {
  _FakeRouteMatch_13(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeAutoRouteInformationProvider_14 extends _i1.SmartFake
    implements _i4.AutoRouteInformationProvider {
  _FakeAutoRouteInformationProvider_14(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeAutoRouterDelegate_15 extends _i1.SmartFake
    implements _i4.AutoRouterDelegate {
  _FakeAutoRouterDelegate_15(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeDefaultRouteParser_16 extends _i1.SmartFake
    implements _i4.DefaultRouteParser {
  _FakeDefaultRouteParser_16(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeRoutingController_17 extends _i1.SmartFake
    implements _i4.RoutingController {
  _FakeRoutingController_17(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [AppRouter].
///
/// See the documentation for Mockito's code generation for more information.
class MockAppRouter extends _i1.Mock implements _i8.AppRouter {
  @override
  _i2.RouteAuthGuard get routeAuthGuard => (super.noSuchMethod(
        Invocation.getter(#routeAuthGuard),
        returnValue: _FakeRouteAuthGuard_0(
          this,
          Invocation.getter(#routeAuthGuard),
        ),
        returnValueForMissingStub: _FakeRouteAuthGuard_0(
          this,
          Invocation.getter(#routeAuthGuard),
        ),
      ) as _i2.RouteAuthGuard);
  @override
  Map<String, _i4.PageFactory> get pagesMap => (super.noSuchMethod(
        Invocation.getter(#pagesMap),
        returnValue: <String, _i4.PageFactory>{},
        returnValueForMissingStub: <String, _i4.PageFactory>{},
      ) as Map<String, _i4.PageFactory>);
  @override
  List<_i4.RouteConfig> get routes => (super.noSuchMethod(
        Invocation.getter(#routes),
        returnValue: <_i4.RouteConfig>[],
        returnValueForMissingStub: <_i4.RouteConfig>[],
      ) as List<_i4.RouteConfig>);
  @override
  _i3.RouteMatcher get matcher => (super.noSuchMethod(
        Invocation.getter(#matcher),
        returnValue: _FakeRouteMatcher_1(
          this,
          Invocation.getter(#matcher),
        ),
        returnValueForMissingStub: _FakeRouteMatcher_1(
          this,
          Invocation.getter(#matcher),
        ),
      ) as _i3.RouteMatcher);
  @override
  _i3.RouteCollection get routeCollection => (super.noSuchMethod(
        Invocation.getter(#routeCollection),
        returnValue: _FakeRouteCollection_2(
          this,
          Invocation.getter(#routeCollection),
        ),
        returnValueForMissingStub: _FakeRouteCollection_2(
          this,
          Invocation.getter(#routeCollection),
        ),
      ) as _i3.RouteCollection);
  @override
  _i4.RouteData get routeData => (super.noSuchMethod(
        Invocation.getter(#routeData),
        returnValue: _FakeRouteData_3(
          this,
          Invocation.getter(#routeData),
        ),
        returnValueForMissingStub: _FakeRouteData_3(
          this,
          Invocation.getter(#routeData),
        ),
      ) as _i4.RouteData);
  @override
  bool get managedByWidget => (super.noSuchMethod(
        Invocation.getter(#managedByWidget),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);
  @override
  _i4.PageBuilder get pageBuilder => (super.noSuchMethod(
        Invocation.getter(#pageBuilder),
        returnValue: (_i4.RouteData data) => _FakeAutoRoutePage_4<dynamic>(
          this,
          Invocation.getter(#pageBuilder),
        ),
        returnValueForMissingStub: (_i4.RouteData data) =>
            _FakeAutoRoutePage_4<dynamic>(
          this,
          Invocation.getter(#pageBuilder),
        ),
      ) as _i4.PageBuilder);
  @override
  _i5.NavigationHistory get navigationHistory => (super.noSuchMethod(
        Invocation.getter(#navigationHistory),
        returnValue: _FakeNavigationHistory_5(
          this,
          Invocation.getter(#navigationHistory),
        ),
        returnValueForMissingStub: _FakeNavigationHistory_5(
          this,
          Invocation.getter(#navigationHistory),
        ),
      ) as _i5.NavigationHistory);
  @override
  _i6.LocalKey get key => (super.noSuchMethod(
        Invocation.getter(#key),
        returnValue: _FakeLocalKey_6(
          this,
          Invocation.getter(#key),
        ),
        returnValueForMissingStub: _FakeLocalKey_6(
          this,
          Invocation.getter(#key),
        ),
      ) as _i6.LocalKey);
  @override
  _i4.PendingRoutesHandler get pendingRoutesHandler => (super.noSuchMethod(
        Invocation.getter(#pendingRoutesHandler),
        returnValue: _FakePendingRoutesHandler_7(
          this,
          Invocation.getter(#pendingRoutesHandler),
        ),
        returnValueForMissingStub: _FakePendingRoutesHandler_7(
          this,
          Invocation.getter(#pendingRoutesHandler),
        ),
      ) as _i4.PendingRoutesHandler);
  @override
  _i7.PagelessRoutesObserver get pagelessRoutesObserver => (super.noSuchMethod(
        Invocation.getter(#pagelessRoutesObserver),
        returnValue: _FakePagelessRoutesObserver_8(
          this,
          Invocation.getter(#pagelessRoutesObserver),
        ),
        returnValueForMissingStub: _FakePagelessRoutesObserver_8(
          this,
          Invocation.getter(#pagelessRoutesObserver),
        ),
      ) as _i7.PagelessRoutesObserver);
  @override
  _i4.ActiveGuardObserver get activeGuardObserver => (super.noSuchMethod(
        Invocation.getter(#activeGuardObserver),
        returnValue: _FakeActiveGuardObserver_9(
          this,
          Invocation.getter(#activeGuardObserver),
        ),
        returnValueForMissingStub: _FakeActiveGuardObserver_9(
          this,
          Invocation.getter(#activeGuardObserver),
        ),
      ) as _i4.ActiveGuardObserver);
  @override
  int get stateHash => (super.noSuchMethod(
        Invocation.getter(#stateHash),
        returnValue: 0,
        returnValueForMissingStub: 0,
      ) as int);
  @override
  _i6.GlobalKey<_i6.NavigatorState> get navigatorKey => (super.noSuchMethod(
        Invocation.getter(#navigatorKey),
        returnValue: _FakeGlobalKey_10<_i6.NavigatorState>(
          this,
          Invocation.getter(#navigatorKey),
        ),
        returnValueForMissingStub: _FakeGlobalKey_10<_i6.NavigatorState>(
          this,
          Invocation.getter(#navigatorKey),
        ),
      ) as _i6.GlobalKey<_i6.NavigatorState>);
  @override
  bool get canPopSelfOrChildren => (super.noSuchMethod(
        Invocation.getter(#canPopSelfOrChildren),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);
  @override
  _i4.RouteData get current => (super.noSuchMethod(
        Invocation.getter(#current),
        returnValue: _FakeRouteData_3(
          this,
          Invocation.getter(#current),
        ),
        returnValueForMissingStub: _FakeRouteData_3(
          this,
          Invocation.getter(#current),
        ),
      ) as _i4.RouteData);
  @override
  _i4.RouteData get topRoute => (super.noSuchMethod(
        Invocation.getter(#topRoute),
        returnValue: _FakeRouteData_3(
          this,
          Invocation.getter(#topRoute),
        ),
        returnValueForMissingStub: _FakeRouteData_3(
          this,
          Invocation.getter(#topRoute),
        ),
      ) as _i4.RouteData);
  @override
  bool get hasPagelessTopRoute => (super.noSuchMethod(
        Invocation.getter(#hasPagelessTopRoute),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);
  @override
  List<_i4.AutoRoutePage<dynamic>> get stack => (super.noSuchMethod(
        Invocation.getter(#stack),
        returnValue: <_i4.AutoRoutePage<dynamic>>[],
        returnValueForMissingStub: <_i4.AutoRoutePage<dynamic>>[],
      ) as List<_i4.AutoRoutePage<dynamic>>);
  @override
  List<_i4.RoutingController> get childControllers => (super.noSuchMethod(
        Invocation.getter(#childControllers),
        returnValue: <_i4.RoutingController>[],
        returnValueForMissingStub: <_i4.RoutingController>[],
      ) as List<_i4.RoutingController>);
  @override
  _i4.UrlState get urlState => (super.noSuchMethod(
        Invocation.getter(#urlState),
        returnValue: _FakeUrlState_11(
          this,
          Invocation.getter(#urlState),
        ),
        returnValueForMissingStub: _FakeUrlState_11(
          this,
          Invocation.getter(#urlState),
        ),
      ) as _i4.UrlState);
  @override
  String get currentPath => (super.noSuchMethod(
        Invocation.getter(#currentPath),
        returnValue: '',
        returnValueForMissingStub: '',
      ) as String);
  @override
  String get currentUrl => (super.noSuchMethod(
        Invocation.getter(#currentUrl),
        returnValue: '',
        returnValueForMissingStub: '',
      ) as String);
  @override
  List<_i4.RouteData> get stackData => (super.noSuchMethod(
        Invocation.getter(#stackData),
        returnValue: <_i4.RouteData>[],
        returnValueForMissingStub: <_i4.RouteData>[],
      ) as List<_i4.RouteData>);
  @override
  bool get isTopMost => (super.noSuchMethod(
        Invocation.getter(#isTopMost),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);
  @override
  bool get canNavigateBack => (super.noSuchMethod(
        Invocation.getter(#canNavigateBack),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);
  @override
  _i4.StackRouter get root => (super.noSuchMethod(
        Invocation.getter(#root),
        returnValue: _FakeStackRouter_12(
          this,
          Invocation.getter(#root),
        ),
        returnValueForMissingStub: _FakeStackRouter_12(
          this,
          Invocation.getter(#root),
        ),
      ) as _i4.StackRouter);
  @override
  bool get isRoot => (super.noSuchMethod(
        Invocation.getter(#isRoot),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);
  @override
  _i4.RouteMatch<dynamic> get topMatch => (super.noSuchMethod(
        Invocation.getter(#topMatch),
        returnValue: _FakeRouteMatch_13<dynamic>(
          this,
          Invocation.getter(#topMatch),
        ),
        returnValueForMissingStub: _FakeRouteMatch_13<dynamic>(
          this,
          Invocation.getter(#topMatch),
        ),
      ) as _i4.RouteMatch<dynamic>);
  @override
  bool get hasEntries => (super.noSuchMethod(
        Invocation.getter(#hasEntries),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);
  @override
  int get pageCount => (super.noSuchMethod(
        Invocation.getter(#pageCount),
        returnValue: 0,
        returnValueForMissingStub: 0,
      ) as int);
  @override
  List<_i4.RouteMatch<dynamic>> get currentSegments => (super.noSuchMethod(
        Invocation.getter(#currentSegments),
        returnValue: <_i4.RouteMatch<dynamic>>[],
        returnValueForMissingStub: <_i4.RouteMatch<dynamic>>[],
      ) as List<_i4.RouteMatch<dynamic>>);
  @override
  bool get hasListeners => (super.noSuchMethod(
        Invocation.getter(#hasListeners),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);
  @override
  _i4.AutoRouteInformationProvider routeInfoProvider({
    _i6.RouteInformation? initialRouteInformation,
    bool Function(String?)? neglectWhen,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #routeInfoProvider,
          [],
          {
            #initialRouteInformation: initialRouteInformation,
            #neglectWhen: neglectWhen,
          },
        ),
        returnValue: _FakeAutoRouteInformationProvider_14(
          this,
          Invocation.method(
            #routeInfoProvider,
            [],
            {
              #initialRouteInformation: initialRouteInformation,
              #neglectWhen: neglectWhen,
            },
          ),
        ),
        returnValueForMissingStub: _FakeAutoRouteInformationProvider_14(
          this,
          Invocation.method(
            #routeInfoProvider,
            [],
            {
              #initialRouteInformation: initialRouteInformation,
              #neglectWhen: neglectWhen,
            },
          ),
        ),
      ) as _i4.AutoRouteInformationProvider);
  @override
  _i4.AutoRouterDelegate declarativeDelegate({
    required _i4.RoutesBuilder? routes,
    String? navRestorationScopeId,
    _i4.RoutePopCallBack? onPopRoute,
    String? initialDeepLink,
    _i4.OnNavigateCallBack? onNavigate,
    _i4.NavigatorObserversBuilder? navigatorObservers =
        _i9.AutoRouterDelegate.defaultNavigatorObserversBuilder,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #declarativeDelegate,
          [],
          {
            #routes: routes,
            #navRestorationScopeId: navRestorationScopeId,
            #onPopRoute: onPopRoute,
            #initialDeepLink: initialDeepLink,
            #onNavigate: onNavigate,
            #navigatorObservers: navigatorObservers,
          },
        ),
        returnValue: _FakeAutoRouterDelegate_15(
          this,
          Invocation.method(
            #declarativeDelegate,
            [],
            {
              #routes: routes,
              #navRestorationScopeId: navRestorationScopeId,
              #onPopRoute: onPopRoute,
              #initialDeepLink: initialDeepLink,
              #onNavigate: onNavigate,
              #navigatorObservers: navigatorObservers,
            },
          ),
        ),
        returnValueForMissingStub: _FakeAutoRouterDelegate_15(
          this,
          Invocation.method(
            #declarativeDelegate,
            [],
            {
              #routes: routes,
              #navRestorationScopeId: navRestorationScopeId,
              #onPopRoute: onPopRoute,
              #initialDeepLink: initialDeepLink,
              #onNavigate: onNavigate,
              #navigatorObservers: navigatorObservers,
            },
          ),
        ),
      ) as _i4.AutoRouterDelegate);
  @override
  _i4.AutoRouterDelegate delegate({
    List<_i4.PageRouteInfo<dynamic>>? initialRoutes,
    String? initialDeepLink,
    String? navRestorationScopeId,
    _i6.WidgetBuilder? placeholder,
    _i4.NavigatorObserversBuilder? navigatorObservers =
        _i9.AutoRouterDelegate.defaultNavigatorObserversBuilder,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #delegate,
          [],
          {
            #initialRoutes: initialRoutes,
            #initialDeepLink: initialDeepLink,
            #navRestorationScopeId: navRestorationScopeId,
            #placeholder: placeholder,
            #navigatorObservers: navigatorObservers,
          },
        ),
        returnValue: _FakeAutoRouterDelegate_15(
          this,
          Invocation.method(
            #delegate,
            [],
            {
              #initialRoutes: initialRoutes,
              #initialDeepLink: initialDeepLink,
              #navRestorationScopeId: navRestorationScopeId,
              #placeholder: placeholder,
              #navigatorObservers: navigatorObservers,
            },
          ),
        ),
        returnValueForMissingStub: _FakeAutoRouterDelegate_15(
          this,
          Invocation.method(
            #delegate,
            [],
            {
              #initialRoutes: initialRoutes,
              #initialDeepLink: initialDeepLink,
              #navRestorationScopeId: navRestorationScopeId,
              #placeholder: placeholder,
              #navigatorObservers: navigatorObservers,
            },
          ),
        ),
      ) as _i4.AutoRouterDelegate);
  @override
  _i4.DefaultRouteParser defaultRouteParser(
          {bool? includePrefixMatches = false}) =>
      (super.noSuchMethod(
        Invocation.method(
          #defaultRouteParser,
          [],
          {#includePrefixMatches: includePrefixMatches},
        ),
        returnValue: _FakeDefaultRouteParser_16(
          this,
          Invocation.method(
            #defaultRouteParser,
            [],
            {#includePrefixMatches: includePrefixMatches},
          ),
        ),
        returnValueForMissingStub: _FakeDefaultRouteParser_16(
          this,
          Invocation.method(
            #defaultRouteParser,
            [],
            {#includePrefixMatches: includePrefixMatches},
          ),
        ),
      ) as _i4.DefaultRouteParser);
  @override
  void updateRouteData(_i4.RouteData? data) => super.noSuchMethod(
        Invocation.method(
          #updateRouteData,
          [data],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void dispose() => super.noSuchMethod(
        Invocation.method(
          #dispose,
          [],
        ),
        returnValueForMissingStub: null,
      );
  @override
  bool canPop({
    bool? ignoreChildRoutes = false,
    bool? ignoreParentRoutes = false,
    bool? ignorePagelessRoutes = false,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #canPop,
          [],
          {
            #ignoreChildRoutes: ignoreChildRoutes,
            #ignoreParentRoutes: ignoreParentRoutes,
            #ignorePagelessRoutes: ignorePagelessRoutes,
          },
        ),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);
  @override
  _i10.Future<T?> pushWidget<T extends Object?>(
    _i6.Widget? widget, {
    _i6.RouteTransitionsBuilder? transitionBuilder,
    bool? fullscreenDialog = false,
    Duration? transitionDuration = const Duration(milliseconds: 300),
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #pushWidget,
          [widget],
          {
            #transitionBuilder: transitionBuilder,
            #fullscreenDialog: fullscreenDialog,
            #transitionDuration: transitionDuration,
          },
        ),
        returnValue: _i10.Future<T?>.value(),
        returnValueForMissingStub: _i10.Future<T?>.value(),
      ) as _i10.Future<T?>);
  @override
  _i10.Future<T?> pushNativeRoute<T extends Object?>(_i6.Route<T>? route) =>
      (super.noSuchMethod(
        Invocation.method(
          #pushNativeRoute,
          [route],
        ),
        returnValue: _i10.Future<T?>.value(),
        returnValueForMissingStub: _i10.Future<T?>.value(),
      ) as _i10.Future<T?>);
  @override
  _i4.RoutingController topMostRouter({bool? ignorePagelessRoutes = false}) =>
      (super.noSuchMethod(
        Invocation.method(
          #topMostRouter,
          [],
          {#ignorePagelessRoutes: ignorePagelessRoutes},
        ),
        returnValue: _FakeRoutingController_17(
          this,
          Invocation.method(
            #topMostRouter,
            [],
            {#ignorePagelessRoutes: ignorePagelessRoutes},
          ),
        ),
        returnValueForMissingStub: _FakeRoutingController_17(
          this,
          Invocation.method(
            #topMostRouter,
            [],
            {#ignorePagelessRoutes: ignorePagelessRoutes},
          ),
        ),
      ) as _i4.RoutingController);
  @override
  _i10.Future<bool> pop<T extends Object?>([T? result]) => (super.noSuchMethod(
        Invocation.method(
          #pop,
          [result],
        ),
        returnValue: _i10.Future<bool>.value(false),
        returnValueForMissingStub: _i10.Future<bool>.value(false),
      ) as _i10.Future<bool>);
  @override
  void popForced<T extends Object?>([T? result]) => super.noSuchMethod(
        Invocation.method(
          #popForced,
          [result],
        ),
        returnValueForMissingStub: null,
      );
  @override
  bool removeLast() => (super.noSuchMethod(
        Invocation.method(
          #removeLast,
          [],
        ),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);
  @override
  void removeRoute(
    _i4.RouteData? route, {
    bool? notify = true,
  }) =>
      super.noSuchMethod(
        Invocation.method(
          #removeRoute,
          [route],
          {#notify: notify},
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i10.Future<T?> push<T extends Object?>(
    _i4.PageRouteInfo<dynamic>? route, {
    _i4.OnNavigationFailure? onFailure,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #push,
          [route],
          {#onFailure: onFailure},
        ),
        returnValue: _i10.Future<T?>.value(),
        returnValueForMissingStub: _i10.Future<T?>.value(),
      ) as _i10.Future<T?>);
  @override
  _i10.Future<T?> replace<T extends Object?>(
    _i4.PageRouteInfo<dynamic>? route, {
    _i4.OnNavigationFailure? onFailure,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #replace,
          [route],
          {#onFailure: onFailure},
        ),
        returnValue: _i10.Future<T?>.value(),
        returnValueForMissingStub: _i10.Future<T?>.value(),
      ) as _i10.Future<T?>);
  @override
  _i10.Future<void> pushAll(
    List<_i4.PageRouteInfo<dynamic>>? routes, {
    _i4.OnNavigationFailure? onFailure,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #pushAll,
          [routes],
          {#onFailure: onFailure},
        ),
        returnValue: _i10.Future<void>.value(),
        returnValueForMissingStub: _i10.Future<void>.value(),
      ) as _i10.Future<void>);
  @override
  _i10.Future<void> popAndPushAll(
    List<_i4.PageRouteInfo<dynamic>>? routes, {
    dynamic onFailure,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #popAndPushAll,
          [routes],
          {#onFailure: onFailure},
        ),
        returnValue: _i10.Future<void>.value(),
        returnValueForMissingStub: _i10.Future<void>.value(),
      ) as _i10.Future<void>);
  @override
  _i10.Future<void> replaceAll(
    List<_i4.PageRouteInfo<dynamic>>? routes, {
    _i4.OnNavigationFailure? onFailure,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #replaceAll,
          [routes],
          {#onFailure: onFailure},
        ),
        returnValue: _i10.Future<void>.value(),
        returnValueForMissingStub: _i10.Future<void>.value(),
      ) as _i10.Future<void>);
  @override
  void popUntilRoot() => super.noSuchMethod(
        Invocation.method(
          #popUntilRoot,
          [],
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i10.Future<T?> popAndPush<T extends Object?, TO extends Object?>(
    _i4.PageRouteInfo<dynamic>? route, {
    TO? result,
    _i4.OnNavigationFailure? onFailure,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #popAndPush,
          [route],
          {
            #result: result,
            #onFailure: onFailure,
          },
        ),
        returnValue: _i10.Future<T?>.value(),
        returnValueForMissingStub: _i10.Future<T?>.value(),
      ) as _i10.Future<T?>);
  @override
  bool removeUntil(_i4.RouteDataPredicate? predicate) => (super.noSuchMethod(
        Invocation.method(
          #removeUntil,
          [predicate],
        ),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);
  @override
  void popUntil(_i6.RoutePredicate? predicate) => super.noSuchMethod(
        Invocation.method(
          #popUntil,
          [predicate],
        ),
        returnValueForMissingStub: null,
      );
  @override
  bool removeWhere(
    _i4.RouteDataPredicate? predicate, {
    bool? notify = true,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #removeWhere,
          [predicate],
          {#notify: notify},
        ),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);
  @override
  void updateDeclarativeRoutes(List<_i4.PageRouteInfo<dynamic>>? routes) =>
      super.noSuchMethod(
        Invocation.method(
          #updateDeclarativeRoutes,
          [routes],
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i10.Future<void> navigateAll(
    List<_i4.RouteMatch<dynamic>>? routes, {
    _i4.OnNavigationFailure? onFailure,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #navigateAll,
          [routes],
          {#onFailure: onFailure},
        ),
        returnValue: _i10.Future<void>.value(),
        returnValueForMissingStub: _i10.Future<void>.value(),
      ) as _i10.Future<void>);
  @override
  _i10.Future<T?> pushAndPopUntil<T extends Object?>(
    _i4.PageRouteInfo<dynamic>? route, {
    required _i6.RoutePredicate? predicate,
    _i4.OnNavigationFailure? onFailure,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #pushAndPopUntil,
          [route],
          {
            #predicate: predicate,
            #onFailure: onFailure,
          },
        ),
        returnValue: _i10.Future<T?>.value(),
        returnValueForMissingStub: _i10.Future<T?>.value(),
      ) as _i10.Future<T?>);
  @override
  _i10.Future<T?> replaceNamed<T extends Object?>(
    String? path, {
    bool? includePrefixMatches = false,
    _i4.OnNavigationFailure? onFailure,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #replaceNamed,
          [path],
          {
            #includePrefixMatches: includePrefixMatches,
            #onFailure: onFailure,
          },
        ),
        returnValue: _i10.Future<T?>.value(),
        returnValueForMissingStub: _i10.Future<T?>.value(),
      ) as _i10.Future<T?>);
  @override
  _i10.Future<T?> pushNamed<T extends Object?>(
    String? path, {
    bool? includePrefixMatches = false,
    _i4.OnNavigationFailure? onFailure,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #pushNamed,
          [path],
          {
            #includePrefixMatches: includePrefixMatches,
            #onFailure: onFailure,
          },
        ),
        returnValue: _i10.Future<T?>.value(),
        returnValueForMissingStub: _i10.Future<T?>.value(),
      ) as _i10.Future<T?>);
  @override
  void popUntilRouteWithName(String? name) => super.noSuchMethod(
        Invocation.method(
          #popUntilRouteWithName,
          [name],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void markUrlStateForReplace() => super.noSuchMethod(
        Invocation.method(
          #markUrlStateForReplace,
          [],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void attachChildController(_i4.RoutingController? childController) =>
      super.noSuchMethod(
        Invocation.method(
          #attachChildController,
          [childController],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void removeChildController(_i4.RoutingController? childController) =>
      super.noSuchMethod(
        Invocation.method(
          #removeChildController,
          [childController],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void notifyAll({bool? forceUrlRebuild = false}) => super.noSuchMethod(
        Invocation.method(
          #notifyAll,
          [],
          {#forceUrlRebuild: forceUrlRebuild},
        ),
        returnValueForMissingStub: null,
      );
  @override
  bool isRouteActive(String? routeName) => (super.noSuchMethod(
        Invocation.method(
          #isRouteActive,
          [routeName],
        ),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);
  @override
  bool isRouteDataActive(_i4.RouteData? data) => (super.noSuchMethod(
        Invocation.method(
          #isRouteDataActive,
          [data],
        ),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);
  @override
  bool isPathActive(String? path) => (super.noSuchMethod(
        Invocation.method(
          #isPathActive,
          [path],
        ),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);
  @override
  _i10.Future<dynamic> navigate(
    _i4.PageRouteInfo<dynamic>? route, {
    _i4.OnNavigationFailure? onFailure,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #navigate,
          [route],
          {#onFailure: onFailure},
        ),
        returnValue: _i10.Future<dynamic>.value(),
        returnValueForMissingStub: _i10.Future<dynamic>.value(),
      ) as _i10.Future<dynamic>);
  @override
  _i10.Future<void> navigateNamed(
    String? path, {
    bool? includePrefixMatches = false,
    _i4.OnNavigationFailure? onFailure,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #navigateNamed,
          [path],
          {
            #includePrefixMatches: includePrefixMatches,
            #onFailure: onFailure,
          },
        ),
        returnValue: _i10.Future<void>.value(),
        returnValueForMissingStub: _i10.Future<void>.value(),
      ) as _i10.Future<void>);
  @override
  void navigateBack() => super.noSuchMethod(
        Invocation.method(
          #navigateBack,
          [],
        ),
        returnValueForMissingStub: null,
      );
  @override
  T? innerRouterOf<T extends _i4.RoutingController>(String? routeName) =>
      (super.noSuchMethod(
        Invocation.method(
          #innerRouterOf,
          [routeName],
        ),
        returnValueForMissingStub: null,
      ) as T?);
  @override
  _i10.Future<bool> popTop<T extends Object?>([T? result]) =>
      (super.noSuchMethod(
        Invocation.method(
          #popTop,
          [result],
        ),
        returnValue: _i10.Future<bool>.value(false),
        returnValueForMissingStub: _i10.Future<bool>.value(false),
      ) as _i10.Future<bool>);
  @override
  _i4.PageRouteInfo<dynamic>? buildPageRoute(
    String? path, {
    bool? includePrefixMatches = true,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #buildPageRoute,
          [path],
          {#includePrefixMatches: includePrefixMatches},
        ),
        returnValueForMissingStub: null,
      ) as _i4.PageRouteInfo<dynamic>?);
  @override
  List<_i4.PageRouteInfo<dynamic>>? buildPageRoutesStack(
    String? path, {
    bool? includePrefixMatches = true,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #buildPageRoutesStack,
          [path],
          {#includePrefixMatches: includePrefixMatches},
        ),
        returnValueForMissingStub: null,
      ) as List<_i4.PageRouteInfo<dynamic>>?);
  @override
  void addListener(_i11.VoidCallback? listener) => super.noSuchMethod(
        Invocation.method(
          #addListener,
          [listener],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void removeListener(_i11.VoidCallback? listener) => super.noSuchMethod(
        Invocation.method(
          #removeListener,
          [listener],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void notifyListeners() => super.noSuchMethod(
        Invocation.method(
          #notifyListeners,
          [],
        ),
        returnValueForMissingStub: null,
      );
}
