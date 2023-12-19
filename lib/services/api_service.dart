import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = 'http://196.1.1.195/iVisita_API';

  Future getData(String endpoint, String? authToken) async {
    final response =
        await http.get(Uri.parse('$baseUrl/api/$endpoint'), headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $authToken',
    });
    debugPrint('response ${response.statusCode}');
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else if (response.statusCode == 401) {
      throw Exception('Unauthorized: Invalid credentials');
    } else {
      throw Exception('Failed to post data to the API');
    }
  }

  Future postData(
      String endpoint, Map<String, dynamic>? data, String? authToken) async {
    final response = await http.post(
      Uri.parse('$baseUrl/api/$endpoint'),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $authToken'
      },
      body: data != null ? jsonEncode(data) : null,
    );
    debugPrint('response ${response.statusCode}');
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else if (response.statusCode == 401) {
      throw Exception('Unauthorized: Invalid credentials');
    } else {
      throw Exception('Failed to post data to the API');
    }
  }

  Future<Map<String, dynamic>> putData(
      String endpoint, Map<String, dynamic>? data) async {
    final response = await http.put(
      Uri.parse('$baseUrl/api/$endpoint'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(data),
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else if (response.statusCode == 401) {
      throw Exception('Unauthorized: Invalid credentials');
    } else {
      throw Exception('Failed to put data to the API');
    }
  }

  Future<void> deleteData(String endpoint) async {
    final response = await http.delete(
      Uri.parse('$baseUrl/api/$endpoint'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode != 204) {
      throw Exception('Failed to delete data from the API');
    }
  }
}
