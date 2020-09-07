import 'dart:io';

main() {
  HttpServer.bind(InternetAddress.anyIPv6, 80).then((server) {
    server.listen((HttpRequest request) {
      print(request.uri);
      switch (request.uri.toString()) {
        case ('/'):
          request.response.write('Hello, world!');
          break;
        case ('/favicon.ico'):
          request.send();
          request.response.write('picture');
          break;
        case ('/test'):
          request.response.write('test');
          break;
        default:
          request.response.write('404');
          break;
      }
      request.response.close();
    });
  });
}
