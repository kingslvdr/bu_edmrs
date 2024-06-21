import 'dart:convert';

import 'package:bu_edmrs/API/api_endpoints.dart';
import 'package:bu_edmrs/utils/popups/popups.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class DataService extends GetxService {
  final storage = GetStorage();
  final isLoading = true.obs;

  // Example method to fetch data from the database
  Future<List<Map<String, dynamic>>?> fetchData() async {
    // Simulate fetching data from a database or API
    await Future.delayed(Duration(seconds: 2));
    // return ['Data 1', 'Data 2', 'Data 3'];
    return [
      {
        "title": 'Item 1',
        "status": 'For Approval',
        "docNo": 'AD240001',
        "type": 'Admission',
        "empName": 'Harlan Ronquillo',
        "reqDate": 'June 13, 2024',
        "department": 'IT Department',
        "position": 'IT Officer',
        "hospital": 'Tarlac Medical Center',
        "admissionDate": 'June 15, 2024',
        "symptoms": 'Cold, Fever, Shortness of breath',
        "welfareBal": '₱100,000.00',
        "business": 'Agro-Industrial Business Group (Livestock)'
      },
      {
        "title": 'Item 1',
        "status": 'For Approval',
        "docNo": 'AD240001',
        "type": 'Admission',
        "empName": 'Harlan Ronquillo',
        "reqDate": 'June 13, 2024',
        "department": 'IT Department',
        "position": 'IT Officer',
        "hospital": 'Tarlac Medical Center',
        "admissionDate": 'June 15, 2024',
        "symptoms": 'Cold, Fever, Shortness of breath',
        "welfareBal": '₱100,000.00',
        "business": 'Agro-Industrial Business Group (Livestock)'
      },
    ];
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
}
