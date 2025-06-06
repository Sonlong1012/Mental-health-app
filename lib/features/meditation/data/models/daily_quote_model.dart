import 'dart:convert';

import 'package:healthapp/features/meditation/domain/entities/daily_quote.dart';

class DailyQuoteModel extends DailyQuote {
  DailyQuoteModel({
    required super.morningQuote, 
    required super.noonQuote, 
    required super.eveningQuote,
  }); 

    factory DailyQuoteModel.fromJson(Map<String, dynamic>json) {
      final quotes = jsonDecode(json['text']) ; 
      return DailyQuoteModel(
        morningQuote: quotes['morningQuote'], 
        noonQuote: quotes ['noonQuote'], 
        eveningQuote:quotes ['eveningQuote']
        );
    }
}