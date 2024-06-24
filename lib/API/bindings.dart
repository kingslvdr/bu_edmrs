import 'dart:convert';

import 'package:bu_edmrs/API/api_endpoints.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class DataService extends GetxService {
    // Get.lazyPut<DataService>(() => DataService());
  // static DataService get instance => Get.find();
  final storage = GetStorage();
  final isLoading = true.obs;
 
  // Future<List<Map<String, dynamic>>?> fetchApproval() async {
  //   // Simulate fetching data from a database or API
  //   // return ['Data 1', 'Data 2', 'Data 3'];
  //   // List<Inbox> inbox = <Inbox>[].obs;
  //   RxList listMap = [].obs;
  //   var url =
  //       Uri.parse(ApiEndpoints.baseUrl + ApiEndpoints.authEndPoints.getInbox);
  //   String user = storage.read('username');
  //   String userpass = storage.read('password');
  //   String credentials = '$user:$userpass';
  //   String encodedCredentials = base64Encode(utf8.encode(credentials));
  //   Map<String, String> headers = {
  //     'authorization': 'Basic $encodedCredentials'
  //   };
  //   var response = await http.post(
  //     url,
  //     headers: headers,
  //   );
  //   var res = jsonDecode(response.body);

  //   if (res['success']) {
  //     List<dynamic> dataList = res['data'];
  //     List<Map<String, dynamic>> listMap =
  //         dataList.map((item) => item as Map<String, dynamic>).toList();
  //     // print(listMap);
  //     return listMap;
  //   }
  // }

  Future<String?> getCount() async {
    var url =
        Uri.parse(ApiEndpoints.baseUrl + ApiEndpoints.authEndPoints.getInbox);
    String user = storage.read('username');
    String userpass = storage.read('password');
    String credentials = '$user:$userpass';
    String encodedCredentials = base64Encode(utf8.encode(credentials));
    Map<String, String> headers = {
      'authorization': 'Basic $encodedCredentials'
    };
    var response = await http.post(
      url,
      headers: headers,
    );
    var res = jsonDecode(response.body);
    print(res);
    if (res['success']) {
      // print(listMap);
      return res['count'].toString();
    }
    else{
      return '0';
    }
  }

  Future<Map<String, dynamic>> fetchBalance() async {
    var url =
        Uri.parse(ApiEndpoints.baseUrl + ApiEndpoints.authEndPoints.balance);
    String user = storage.read('username');
    String userpass = storage.read('password');
    String credentials = '$user:$userpass';
    String encodedCredentials = base64Encode(utf8.encode(credentials));
    Map<String, String> headers = {
      'Authorization': 'Basic $encodedCredentials'
    };

    try {
      isLoading(true);
      var response = await http.post(
        url,
        headers: headers,
      );

      var res = await json.decode(response.body);
      // print(res);
      if (res['success']) {
        return res;
      } else {
        return {'error': 'error'};
        // PopUps.errorSnackBar(title: 'Error', message: 'Error fetching Data');
      }
    } finally {
      isLoading(false);
    }
  }

  Future<List<Map<String, dynamic>>?> requestDetails({required docNo}) async {
    var url = Uri.parse(
        ApiEndpoints.baseUrl + ApiEndpoints.authEndPoints.requestData);
    String user = storage.read('username');
    String userpass = storage.read('password');
    String credentials = '$user:$userpass';
    String encodedCredentials = base64Encode(utf8.encode(credentials));
    Map<String, String> headers = {
      'authorization': 'Basic $encodedCredentials'
    };
    Map<String, String> body = {'docNo': '$docNo'};

    var response = await http.post(url, headers: headers, body: body);
    var res = jsonDecode(response.body);

    if (res['success']) {
      List<dynamic> dataList = res['data'];
      List<Map<String, dynamic>> listMap =
          dataList.map((item) => item as Map<String, dynamic>).toList();
      // print(listMap);
      return listMap;
    }
    else{
      return [];
    }
  }
}
