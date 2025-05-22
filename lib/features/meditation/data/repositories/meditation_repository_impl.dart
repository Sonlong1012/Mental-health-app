import 'package:healthapp/features/meditation/data/datasources/meditation_remote_datasource.dart';
import 'package:healthapp/features/meditation/domain/entities/daily_quote.dart';
import 'package:healthapp/features/meditation/domain/entities/mood_message.dart';
import 'package:healthapp/features/meditation/domain/repositories/meditation_repository.dart';

class MeditationRepositoryImpl implements MeditationRepository {
  final MeditationRemoteDatasource  remoteDataSource;
  
  MeditationRepositoryImpl({required this.remoteDataSource});

  @override
  Future<DailyQuote> getDailyQuote() async {
    return await remoteDataSource.getDailyQuote();
  }

  @override
  Future<MoodMessage> getMoodMessage(String mood) async {
    return await remoteDataSource.getMoodMessage(mood);
  }

  
}