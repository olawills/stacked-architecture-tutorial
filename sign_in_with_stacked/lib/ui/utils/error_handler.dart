import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void errorHandler({
  required http.Response response,
  required VoidCallback onSuccess,
  required VoidCallback onError400,
  required VoidCallback onError500,
}) async {
  switch (response.statusCode) {
    case 200:
      onSuccess();
      break;
    case 400:
      onError400();
      break;
    case 402:
      onError400();
      break;
    case 500:
      onError500();
      break;
    default:
  }
}
