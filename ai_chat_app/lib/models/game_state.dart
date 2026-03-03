import 'package:flutter/foundation.dart';
import 'chat_message.dart';
import '../services/chat_service.dart';

enum Location { home, city, bank, lawyer, park }

class GameState extends ChangeNotifier {
  final ChatService _chatService = ChatService();

  Location _currentLocation = Location.home;
  Location get currentLocation => _currentLocation;

  final List<ChatMessage> _bankMessages = [];
  List<ChatMessage> get bankMessages => List.unmodifiable(_bankMessages);

  final List<ChatMessage> _lawyerMessages = [];
  List<ChatMessage> get lawyerMessages => List.unmodifiable(_lawyerMessages);

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  void moveTo(Location location) {
    if (_canMoveTo(location)) {
      _currentLocation = location;
      notifyListeners();
    }
  }

  bool _canMoveTo(Location target) {
    switch (_currentLocation) {
      case Location.home:
        return target == Location.city;
      case Location.city:
        return target == Location.home ||
            target == Location.park ||
            target == Location.bank ||
            target == Location.lawyer;
      case Location.bank:
        return target == Location.city;
      case Location.lawyer:
        return target == Location.city;
      case Location.park:
        return target == Location.city;
    }
  }

  Future<void> sendMessage(String text) async {
    if (text.trim().isEmpty) return;

    final userMessage = ChatMessage(text: text, isUser: true);
    AiCharacter character;

    if (_currentLocation == Location.bank) {
      _bankMessages.add(userMessage);
      character = AiCharacter.banker;
    } else if (_currentLocation == Location.lawyer) {
      _lawyerMessages.add(userMessage);
      character = AiCharacter.lawyer;
    } else {
      return;
    }

    _isLoading = true;
    notifyListeners();

    final response = await _chatService.sendMessage(text, character);

    if (_currentLocation == Location.bank) {
      _bankMessages.add(response);
    } else if (_currentLocation == Location.lawyer) {
      _lawyerMessages.add(response);
    }

    _isLoading = false;
    notifyListeners();
  }
}
