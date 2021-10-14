import 'package:http/http.dart';

extension ResponseExtension on Response {
  bool isSuccess() {
    return this.statusCode >= 200 && this.statusCode <= 299;
  }
}
