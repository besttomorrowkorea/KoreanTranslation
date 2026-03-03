import '../models/chat_message.dart';

enum AiCharacter { banker, lawyer }

class ChatService {
  // 실제 AI API 연동 시 이 메서드를 교체합니다.
  // 현재는 캐릭터별 모의 응답을 반환합니다.
  Future<ChatMessage> sendMessage(String userMessage, AiCharacter character) async {
    // 네트워크 지연 시뮬레이션
    await Future.delayed(const Duration(milliseconds: 800));

    final response = _generateResponse(userMessage, character);
    return ChatMessage(text: response, isUser: false);
  }

  String _generateResponse(String message, AiCharacter character) {
    switch (character) {
      case AiCharacter.banker:
        return _bankerResponse(message);
      case AiCharacter.lawyer:
        return _lawyerResponse(message);
    }
  }

  String _bankerResponse(String message) {
    final lower = message.toLowerCase();
    if (lower.contains('계좌') || lower.contains('통장')) {
      return '계좌 개설을 원하시나요? 신분증을 지참하시면 바로 처리해 드리겠습니다.';
    }
    if (lower.contains('대출') || lower.contains('loan')) {
      return '대출 상담을 도와드리겠습니다. 현재 신용 대출과 담보 대출 상품이 있습니다. 어떤 상품에 관심이 있으신가요?';
    }
    if (lower.contains('이자') || lower.contains('금리')) {
      return '현재 예금 금리는 연 3.5%이며, 적금 금리는 연 4.2%입니다. 자세한 내용은 상품별로 안내해 드리겠습니다.';
    }
    if (lower.contains('송금') || lower.contains('이체')) {
      return '송금 서비스를 이용하시려면 계좌번호와 금액을 알려주세요. 수수료는 건당 500원입니다.';
    }
    if (lower.contains('안녕') || lower.contains('hello')) {
      return '안녕하세요! 저는 이곳 은행의 직원입니다. 무엇을 도와드릴까요? 계좌, 대출, 송금 등 다양한 서비스를 제공하고 있습니다.';
    }
    return '네, 알겠습니다. 은행 업무와 관련하여 더 궁금하신 점이 있으시면 편하게 말씀해 주세요.';
  }

  String _lawyerResponse(String message) {
    final lower = message.toLowerCase();
    if (lower.contains('계약') || lower.contains('contract')) {
      return '계약서 검토를 도와드리겠습니다. 계약서의 주요 조항과 특약 사항을 꼼꼼히 살펴보겠습니다.';
    }
    if (lower.contains('소송') || lower.contains('재판')) {
      return '소송 절차에 대해 안내해 드리겠습니다. 먼저 사건의 개요를 말씀해 주시겠어요?';
    }
    if (lower.contains('부동산') || lower.contains('집')) {
      return '부동산 관련 법률 상담이시군요. 매매, 임대차, 등기 등 어떤 분야의 상담이 필요하신가요?';
    }
    if (lower.contains('이혼') || lower.contains('가족')) {
      return '가사 사건에 대해 상담해 드리겠습니다. 민감한 사안인 만큼 비밀이 철저히 보장됩니다.';
    }
    if (lower.contains('안녕') || lower.contains('hello')) {
      return '안녕하세요, 변호사 김법무입니다. 법률 상담이 필요하시면 편하게 말씀해 주세요. 계약, 소송, 부동산 등 다양한 분야를 다루고 있습니다.';
    }
    return '네, 잘 알겠습니다. 법률적인 부분에서 더 도움이 필요하시면 말씀해 주세요.';
  }
}
