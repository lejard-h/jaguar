// GENERATED CODE - DO NOT MODIFY BY HAND

part of test.exception.exception;

// **************************************************************************
// Generator: ApiGenerator
// Target: class ExampleApi
// **************************************************************************

class JaguarExampleApi implements RequestHandler {
  static const List<RouteBase> routes = const <RouteBase>[
    const Get(path: '/user'),
    const Post(path: '/user')
  ];

  final ExampleApi _internal;

  factory JaguarExampleApi() {
    final instance = new ExampleApi();
    return new JaguarExampleApi.from(instance);
  }
  JaguarExampleApi.from(this._internal);

  Future<Response> handleRequest(Request request, {String prefix: ''}) async {
    prefix += '/api';
    PathParams pathParams = new PathParams();
    bool match = false;
    QueryParams queryParams = new QueryParams(request.uri.queryParameters);

//Handler for getUser
    match =
        routes[0].match(request.uri.path, request.method, prefix, pathParams);
    if (match) {
      Response<String> rRouteResponse0 = new Response(null);
      try {
        try {
          rRouteResponse0.statusCode = 200;
          rRouteResponse0.headers
              .set('content-type', 'text/plain; charset=utf-8');
          rRouteResponse0.value = _internal.getUser(
            who: (queryParams.getField('who')),
          );
          return rRouteResponse0;
        } catch (e) {
          rethrow;
        }
      } on ValidationException catch (e, s) {
        ValidationExceptionHandler handler = new ValidationExceptionHandler();
        return await handler.onRouteException(request, e, s);
      } on CustomException catch (e, s) {
        CustomExceptionHandler handler = new CustomExceptionHandler();
        return await handler.onRouteException(request, e, s);
      }
    }

//Handler for post
    match =
        routes[1].match(request.uri.path, request.method, prefix, pathParams);
    if (match) {
      Response<User> rRouteResponse0 = new Response(null);
      try {
        UserParser iUserParser;
        try {
          iUserParser = new WrapUserParser().createInterceptor();
          User rUserParser = iUserParser.pre(
            new QueryParams.FromQueryParam(queryParams),
          );
          rRouteResponse0.statusCode = 200;
          rRouteResponse0.headers
              .set('content-type', 'text/plain; charset=utf-8');
          rRouteResponse0.value = _internal.post(
            rUserParser,
          );
          return rRouteResponse0;
        } catch (e) {
          await iUserParser?.onException();
          rethrow;
        }
      } on ValidationException catch (e, s) {
        ValidationExceptionHandler handler = new ValidationExceptionHandler();
        return await handler.onRouteException(request, e, s);
      }
    }

    return null;
  }
}
