import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import '../models/elixir_model.dart';
import '../models/house_model.dart';
import '../models/spell_model.dart';
import 'custom_exception.dart';

class WizardWorldApiService {
  static const String _baseUrl = 'https://wizard-world-api.herokuapp.com';

  Future<List<House>> fetchHouses() async {
    try {
      final response = await http.get(Uri.parse('$_baseUrl/Houses'));
      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        return data.map((json) => House.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load houses');
      }
    } catch (error, stackTrace) {
      print('Error: $error');
      print('StackTrace: $stackTrace');
      if (error is SocketException) {
        throw CustomException('No Internet connection');
      } else if (error is TimeoutException) {
        throw CustomException('The connection has timed out');
      } else {
        throw CustomException('An unexpected error occurred');
      }
    }
  }

  Future<List<Spell>> fetchSpells() async {
    try {
      final response = await http.get(Uri.parse('$_baseUrl/Spells'));
      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        return data.map((json) => Spell.fromJson(json)).toList();
      } else {
        throw CustomException('Failed to load spells');
      }
    } catch (error, stackTrace) {
      print('Error: $error');
      print('StackTrace: $stackTrace');

      if (error is SocketException) {
        throw CustomException('No Internet connection');
      } else if (error is TimeoutException) {
        throw CustomException('The connection has timed out');
      } else {
        throw CustomException('An unexpected error occurred');
      }
    }
  }

  Future<Spell> fetchSpellByID(String id) async {
    try {
      final response = await http.get(Uri.parse('$_baseUrl/Spells/$id'));
      if (response.statusCode == 200) {
        dynamic data = json.decode(response.body);
        return Spell.fromJson(data);
      } else {
        throw CustomException('Failed to load the spell');
      }
    } catch (error, stackTrace) {
      print('Error: $error');
      print('StackTrace: $stackTrace');

      if (error is SocketException) {
        throw CustomException('No Internet connection');
      } else if (error is TimeoutException) {
        throw CustomException('The connection has timed out');
      } else {
        throw CustomException('An unexpected error occurred');
      }
    }
  }

  Future<List<Elixir>> fetchElixirs() async {
    try {
      final response = await http.get(Uri.parse('$_baseUrl/Elixirs'));
      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        return data.map((json) => Elixir.fromJson(json)).toList();
      } else {
        throw CustomException('Failed to load elixirs');
      }
    } catch (error, stackTrace) {
      print('Error: $error');
      print('StackTrace: $stackTrace');

      if (error is SocketException) {
        throw CustomException('No Internet connection');
      } else if (error is TimeoutException) {
        throw CustomException('The connection has timed out');
      } else {
        throw CustomException('An unexpected error occurred');
      }
    }
  }
}
