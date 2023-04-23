import 'dart:io';

import 'package:dio/dio.dart' as dio;
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'package:shelf_router/shelf_router.dart';

import 'utitlites/constants.dart';

void main(List<String> args) async {
  // Use any available host or container IP (usually `0.0.0.0`).
  final ip = InternetAddress.anyIPv4;

  // Configure a pipeline that logs requests.
  final handler = Pipeline().addMiddleware(logRequests()).addHandler(_router);

  // For running in containers, we respect the PORT environment variable.
  final port = int.parse(Platform.environment['PORT'] ?? '8080');
  final server = await serve(handler, ip, port);
  print('Server listening on port ${server.port}');
}

final dioHandler = dio.Dio();

// Configure routes.
final _router = Router()
  ..get('/', _rootHandler)
  ..get(Constant.lambda1hostname, _lambdaHandler1)
  ..get('${Constant.lambda1hostname}/<message>', _lambdaHandler1)
  ..get(Constant.lambda2hostname, _lambdaHandler2)
  ..get('${Constant.lambda2hostname}/<message>', _lambdaHandler2)
  ..get(Constant.lambda3hostname, _lambdaHandler3)
  ..get('${Constant.lambda3hostname}/<message>', _lambdaHandler3);

Response _rootHandler(Request req) {
  return Response.ok('Hello, World!\n');
}

Future<Response> _lambdaHandler1(Request request) async {
  try {
    final message = request.params['message'];
    if (message == null) {
      final res = await dioHandler.get(Constant.lambda1hostip);
      return Response.ok('$res');
    } else {
      final res = await dioHandler
          .get('${Constant.lambda1hostip}${Constant.echo}/$message');
      return Response.ok('$res');
    }
  } on FormatException catch (e) {
    return Response.badRequest(body: e.message);
  } on dio.DioError catch (e) {
    return Response.internalServerError(body: e.error.toString());
  } catch (e) {
    return Response.internalServerError(body: e.toString());
  }
}

Future<Response> _lambdaHandler2(Request request) async {
  try {
    final message = request.params['message'];
    if (message == null) {
      final res = await dioHandler.get(Constant.lambda2hostip);
      return Response.ok('$res');
    } else {
      final res = await dioHandler
          .get('${Constant.lambda2hostip}${Constant.echo}/$message');
      return Response.ok('$res');
    }
  } on FormatException catch (e) {
    return Response.badRequest(body: e.message);
  } on dio.DioError catch (e) {
    return Response.internalServerError(body: e.error.toString());
  } catch (e) {
    return Response.internalServerError(body: e.toString());
  }
}

Future<Response> _lambdaHandler3(Request request) async {
  try {
    final message = request.params['message'];
    if (message == null) {
      final res = await dioHandler.get(Constant.lambda3hostip);
      return Response.ok('$res');
    } else {
      final res = await dioHandler
          .get('${Constant.lambda3hostip}${Constant.echo}/$message');
      return Response.ok('$res');
    }
  } on FormatException catch (e) {
    return Response.badRequest(body: e.message);
  } on dio.DioError catch (e) {
    return Response.internalServerError(body: e.error.toString());
  } catch (e) {
    return Response.internalServerError(body: e.toString());
  }
}
