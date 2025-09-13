import 'dart:math';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'dart:convert';
void main() async {
  final handler = const Pipeline().addMiddleware(logRequests()).addHandler((req) {
    if (req.url.path == 'weather') {
      final now = DateTime.now().toUtc();
      final rnd = Random(42);
      final hourly = List.generate(72, (i) {
        final t = now.add(Duration(hours: i));
        return {
          'time': t.toIso8601String(),
          'temp_c': 10 + rnd.nextInt(15) + rnd.nextDouble(),
          'condition': ['sunny','cloudy','rain','storm'][rnd.nextInt(4)],
        };
      });
      final current = {
        'temp_c': hourly.first['temp_c'],
        'condition': hourly.first['condition'],
        'humidity': 40 + rnd.nextInt(60),
        'uv': rnd.nextDouble() * 10,
        'aqi': 10 + rnd.nextInt(100),
        'wind_kph': 5 + rnd.nextDouble() * 30,
      };
      print(current);
      return Response.ok(
        jsonEncode({'current': current, 'hourly': hourly}),
        headers: {'content-type': 'application/json; charset=utf-8'},
      );
    }
    return Response.notFound('Not found');
  });

  final server = await serve(handler, '127.0.0.1', 8080);
}