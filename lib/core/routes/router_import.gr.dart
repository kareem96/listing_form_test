// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i7;
import 'package:flutter/material.dart' as _i8;
import 'package:form_listing_test/core/resources/model/list_form/list_form_model.dart'
    as _i9;
import 'package:form_listing_test/presentation/about/about_page.dart' as _i1;
import 'package:form_listing_test/presentation/detail/detail_page.dart' as _i2;
import 'package:form_listing_test/presentation/home/home_page.dart' as _i3;
import 'package:form_listing_test/presentation/input/input_page.dart' as _i4;
import 'package:form_listing_test/presentation/main_page.dart' as _i5;
import 'package:form_listing_test/presentation/not_found_page.dart' as _i6;

abstract class $AppRouter extends _i7.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i7.PageFactory> pagesMap = {
    AboutRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AboutPage(),
      );
    },
    DetailRoute.name: (routeData) {
      final args = routeData.argsAs<DetailRouteArgs>();
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.DetailPage(
          key: args.key,
          id: args.id,
          item: args.item,
        ),
      );
    },
    HomeRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.HomePage(),
      );
    },
    InputRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.InputPage(),
      );
    },
    MainRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.MainPage(),
      );
    },
    NotFoundRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.NotFoundPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.AboutPage]
class AboutRoute extends _i7.PageRouteInfo<void> {
  const AboutRoute({List<_i7.PageRouteInfo>? children})
      : super(
          AboutRoute.name,
          initialChildren: children,
        );

  static const String name = 'AboutRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i2.DetailPage]
class DetailRoute extends _i7.PageRouteInfo<DetailRouteArgs> {
  DetailRoute({
    _i8.Key? key,
    required int id,
    required _i9.ListFormModel item,
    List<_i7.PageRouteInfo>? children,
  }) : super(
          DetailRoute.name,
          args: DetailRouteArgs(
            key: key,
            id: id,
            item: item,
          ),
          initialChildren: children,
        );

  static const String name = 'DetailRoute';

  static const _i7.PageInfo<DetailRouteArgs> page =
      _i7.PageInfo<DetailRouteArgs>(name);
}

class DetailRouteArgs {
  const DetailRouteArgs({
    this.key,
    required this.id,
    required this.item,
  });

  final _i8.Key? key;

  final int id;

  final _i9.ListFormModel item;

  @override
  String toString() {
    return 'DetailRouteArgs{key: $key, id: $id, item: $item}';
  }
}

/// generated route for
/// [_i3.HomePage]
class HomeRoute extends _i7.PageRouteInfo<void> {
  const HomeRoute({List<_i7.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i4.InputPage]
class InputRoute extends _i7.PageRouteInfo<void> {
  const InputRoute({List<_i7.PageRouteInfo>? children})
      : super(
          InputRoute.name,
          initialChildren: children,
        );

  static const String name = 'InputRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i5.MainPage]
class MainRoute extends _i7.PageRouteInfo<void> {
  const MainRoute({List<_i7.PageRouteInfo>? children})
      : super(
          MainRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i6.NotFoundPage]
class NotFoundRoute extends _i7.PageRouteInfo<void> {
  const NotFoundRoute({List<_i7.PageRouteInfo>? children})
      : super(
          NotFoundRoute.name,
          initialChildren: children,
        );

  static const String name = 'NotFoundRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}
