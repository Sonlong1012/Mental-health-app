import 'dart:convert';

import 'package:healthapp/features/meditation/data/models/daily_quote_model.dart';
import 'package:healthapp/features/meditation/data/models/mood_message_model.dart';
import 'package:healthapp/features/meditation/domain/entities/mood_message.dart';
// import 'package:healthapp/features/music/data/models/SongModel.dart';
import 'package:http/http.dart' as http;

abstract class MeditationRemoteDatasource {

  Future<DailyQuoteModel> getDailyQuote(); 
  Future<MoodMessage> getMoodMessage(String mood);
}

class MeditationRemoteDatasourceImpl implements MeditationRemoteDatasource {
final http.Client client;

MeditationRemoteDatasourceImpl({required this.client});

  @override
  Future<DailyQuoteModel> getDailyQuote() async {
     // final response = await client.get(Uri.parse('http://localhost:6000/meditation/dailyQuote'));
    final response = await client.get(Uri.parse('http://10.0.2.2:6000/meditation/dailyQuote'));

    if(response.statusCode == 200){
      final jsonResponse = json.decode(response.body);
      return DailyQuoteModel.fromJson(jsonResponse);
    } else {
      throw Exception('Failed to load daily quote');
    }
  }

  @override
  Future<MoodMessageModel> getMoodMessage(String mood) async {
    // final response = await client.get(Uri.parse('http://localhost:6000/meditation/mymoood'));
    final response = await client.get(Uri.parse('http://10.0.2.2:6000/meditation/myMood/$mood'));

    if(response.statusCode == 200){
      final jsonResponse = json.decode(response.body);
      return MoodMessageModel.fromJson(jsonResponse);
    } else {
      throw Exception('Failed to load mood quote');
    }
  }
  
}