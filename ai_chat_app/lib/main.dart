import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'models/game_state.dart';
import 'screens/home_screen.dart';
import 'screens/city_screen.dart';
import 'screens/bank_screen.dart';
import 'screens/lawyer_screen.dart';
import 'screens/park_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const AiChatApp());
}

class AiChatApp extends StatelessWidget {
  const AiChatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => GameState(),
      child: MaterialApp(
        title: 'AI 대화 탐험',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.brown),
          useMaterial3: true,
          fontFamily: 'NotoSansKR',
        ),
        home: const GamePage(),
      ),
    );
  }
}

class GamePage extends StatelessWidget {
  const GamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Consumer<GameState>(
          builder: (context, gameState, _) {
            return AnimatedSwitcher(
              duration: const Duration(milliseconds: 400),
              transitionBuilder: (child, animation) {
                return FadeTransition(opacity: animation, child: child);
              },
              child: _buildCurrentScreen(gameState.currentLocation),
            );
          },
        ),
      ),
    );
  }

  Widget _buildCurrentScreen(Location location) {
    switch (location) {
      case Location.home:
        return const HomeScreen(key: ValueKey('home'));
      case Location.city:
        return const CityScreen(key: ValueKey('city'));
      case Location.bank:
        return const BankScreen(key: ValueKey('bank'));
      case Location.lawyer:
        return const LawyerScreen(key: ValueKey('lawyer'));
      case Location.park:
        return const ParkScreen(key: ValueKey('park'));
    }
  }
}
