import 'package:healthapp/features/meditation/domain/entities/daily_quote.dart';
import 'package:healthapp/features/meditation/domain/entities/mood_message.dart';

abstract class MeditationRepository {
  Future<DailyQuote> getDailyQuote(); 
  Future<MoodMessage> getMoodMessage(String mood);
}