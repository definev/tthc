import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tthc/src/features/form/models/tthc_form.dart';

final formRemoteProvider = Provider<FormRemote>((ref) => FormRemoteImpl());

abstract class FormRemote {
  Future<bool> sendForm(TTHCForm form);
  Future<List<TTHCForm>> getForms();
}

class FormRemoteImpl implements FormRemote {
  Dio http = Dio(
    BaseOptions(baseUrl: 'https://bookingtthc.herokuapp.com/booking'),
  );

  @override
  Future<List<TTHCForm>> getForms() async {
    try {
      final response = await http.get<dynamic>('/');

      final data = jsonDecode(response.data as String) as Map<String, dynamic>;
      final list = List<Map<String, dynamic>>.from(
        // ignore: avoid_dynamic_calls
        data['_embedded']['booking'] as List<dynamic>,
      );

      return list.map<TTHCForm>((e) => TTHCForm.fromJson(e)).toList();
    } catch (e) {
      return [];
    }
  }

  @override
  Future<bool> sendForm(TTHCForm form) async {
    try {
      await http.post<dynamic>(
        '/',
        data: form.toJson(),
      );

      return true;
    } catch (e) {
      return false;
    }
  }
}
