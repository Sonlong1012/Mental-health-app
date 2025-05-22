import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healthapp/core/theme.dart';
// import 'package:healthapp/features/meditation/data/datasources/meditation_remote_datasource.dart';
// import 'package:healthapp/features/meditation/data/repositories/meditation_repository_impl.dart';
// import 'package:healthapp/features/meditation/domain/usecases/get_daily_quote.dart';
// import 'package:healthapp/features/meditation/domain/usecases/get_mood_message.dart';
// import 'package:healthapp/features/meditation/domain/usecases/get_mood_message.dart';
import 'package:healthapp/features/meditation/presentation/bloc/daily_quote/daily_quote_bloc.dart';
import 'package:healthapp/features/meditation/presentation/bloc/daily_quote/daily_quote_event.dart';
import 'package:healthapp/features/meditation/presentation/bloc/mood_message/mood_message_bloc.dart';
// import 'package:healthapp/features/meditation/presentation/bloc/meditation_bloc.dart';

// import 'package:healthapp/features/music/data/datasources/song_remote_datasource.dart';
// import 'package:healthapp/features/music/data/repository/song_repository_impl.dart';
// import 'package:healthapp/features/music/domain/usecases/get_all_songs.dart';
import 'package:healthapp/features/music/presentation/bloc/song_bloc.dart';
import 'package:healthapp/features/music/presentation/bloc/song_event.dart';
import 'package:healthapp/injection_container.dart' as di;
// import 'package:healthapp/features/meditation/presentation/pages/meditation_screen.dart';
import 'package:healthapp/presentation/bottomNavBar/bloc/navigation_bloc.dart';
// import 'package:healthapp/presentation/homePage/home_page.dart';
import 'package:healthapp/presentation/onboarding/onboarding.dart';
// import 'package:http/http.dart' as http;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => NavigationBloc(),
          ),
          BlocProvider(
              create: (context) => di.sl<SongBloc>()..add(FetchSongs())
          ),
          BlocProvider(
            create: (context)=> di.sl<DailyQuoteBloc>()..add(FetchDailyQuote()),
          ),
          BlocProvider(
              create: (context)=> di.sl<MoodMessageBloc>()
          )
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: AppTheme.lightTheme,
          debugShowCheckedModeBanner: false,
          home: OnboardingScreen(),
        )
    );
  }
}