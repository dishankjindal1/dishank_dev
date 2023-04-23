import 'dart:io';

import 'package:redis/redis.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'package:shelf_router/shelf_router.dart';

import 'utilites/constants.dart';

// Use any available host or container IP (usually `0.0.0.0`).
final ip = InternetAddress.anyIPv4;

// Configure a pipeline that logs requests.
final handler = Pipeline().addMiddleware(logRequests()).addHandler(_router);

// Redis
final redis = RedisConnection();

// Entry point
void main(List<String> args) async {
  // For running in containers, we respect the PORT environment variable.
  final port = int.parse(Platform.environment['PORT'] ?? '8080');
  final server = await serve(handler, ip, port);
  print('Server listening on port ${server.port}');
}

// Configure routes.
final _router = Router()
  ..get('/', _rootHandler)
  ..get('/echo/<message>', _echoHandler);

Future<Response> _rootHandler(Request req) async {
  var command = await redis.connect(Constant.REDIS_SERVER, Constant.REDIS_PORT);
  try {
    return Response.ok(
      'Hello from lambda 1,\nmsg: ${await command.get('echo')}',
    );
  } catch (e) {
    return Response.internalServerError(body: e.toString());
  } finally {
    redis.close();
  }
}

Future<Response> _echoHandler(Request request) async {
  try {
    final message = request.params['message'];
    var command =
        await redis.connect(Constant.REDIS_SERVER, Constant.REDIS_PORT);
    await command.send_object(["set", "echo", message, "EX", 60]);
    return Response.ok('$message\n');
  } on RedisError {
    return Response.internalServerError(
      body: 'Error while saving data. please try again',
    );
  } catch (e) {
    return Response.internalServerError(body: e.toString());
  } finally {
    redis.close();
  }
}
