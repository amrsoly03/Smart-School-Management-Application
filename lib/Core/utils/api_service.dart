import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:path/path.dart';

import 'package:http/http.dart' as http;

class ApiService {
  void handleError(int statusCode) {
    switch (statusCode) {
      case 400:
        // Bad request
        log('Bad request: Invalid data or parameters');
        break;
      case 401:
        // Unauthorized
        log('Unauthorized: Authentication required');
        break;
      case 403:
        // Forbidden
        log('Forbidden: Access denied');
        break;
      case 404:
        // Not found
        log('Not found: Resource not found');
        break;
      case 500:
        // Internal server error
        log('Internal server error: Server-side issue');
        break;
      default:
        // Other errors
        log('Error: Unknown error occurred');
    }
  }

  //add headers
  httpPost({required String link, required Map data}) async {
    try {
      var response = await http.post(Uri.parse(link), body: data);
      if (response.statusCode == 200) {
        var responseBody = jsonDecode(response.body);
        log(response.body);
        return responseBody;
      } else {
        handleError(response.statusCode);
        log('Error: ${response.statusCode}');
      }
    } catch (e) {
      log('error catch $e');
      log('$data , $link');
    }
  }

  postRequestWithFile({
    required String link,
    required String fieldName,
    required Map data,
    required File file,
  }) async {
    var request = http.MultipartRequest('POST', Uri.parse(link));
    var length = await file.length();
    var stream = http.ByteStream(file.openRead());

    var multipartFile = http.MultipartFile(
      fieldName,
      stream,
      length,
      filename: basename(file.path),
    );
    //request.headers.addAll(myheaders);

    request.files.add(multipartFile);

    data.forEach((key, value) {
      request.fields[key] = value;
    });

    var myrequest = await request.send();
    var response = await http.Response.fromStream(myrequest);

    if (myrequest.statusCode == 200) {
      var responseBody = jsonDecode(response.body);
      log(response.body);
      return responseBody;
    } else {
      handleError(myrequest.statusCode);
      log('error ${myrequest.statusCode}');
    }
  }
}


// postRequestWithFile({
//     required String link,
//     required Map data,
//     required File file,
//   }) async {
//     var request = http.MultipartRequest('POST', Uri.parse(link));
//     request.headers['Content-Type'] = 'multipart/form-data';

//     request.files.add(http.MultipartFile.fromBytes(
//       'product_image',
//       await file.readAsBytes(),
//       filename: file.path.split('/').last,
//     ));

//     data.forEach((key, value) {
//       request.fields[key] = value;
//     });

//     var myrequest = await request.send();
//     var response = await http.Response.fromStream(myrequest);

//     log('Response status code: ${response.statusCode}');
//     log('Response body: ${response.body}');
//   }