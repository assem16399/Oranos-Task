import 'package:bloc/bloc.dart';

import '../data/models/message.dart';

part 'messages_state.dart';

class MessagesCubit extends Cubit<MessagesState> {
  MessagesCubit() : super(MessagesInitial());

  var _botMessageCurrentIndex = 0;
  var isSelectingCategories = false;
  final _userMessages = [];
  final List<Message> _botMessages = [
    Message(id: '1', text: 'Hi, What is your first name?', isMe: false),
    Message(id: '2', text: 'What is your last name?', isMe: false),
    Message(id: '3', text: 'What is your title?', isMe: false),
    Message(
        id: '4', text: 'What Categories you will need expert In?', isMe: false),
  ];

  final List<Message> _conversationMessages = [];
  List<Message> get conversationMessages {
    return [..._conversationMessages];
  }

  void startConversation() {
    if (_conversationMessages.isEmpty) {
      _addBotMessage();
      emit(MessagesConversationStartedSuccessfullyState());
    }
  }

  void _addBotMessage() {
    _conversationMessages.add(_botMessages[_botMessageCurrentIndex]);
    _botMessageCurrentIndex++;
    if (_botMessageCurrentIndex == _botMessages.length) {
      isSelectingCategories = true;
    }
  }

  void addNewMessage({required String msg}) {
    if (_botMessageCurrentIndex < _botMessages.length) {
      _userMessages.add(msg);
      _conversationMessages
          .add(Message(id: DateTime.now().toString(), text: msg, isMe: true));
      _customizeBotMessages();
      _addBotMessage();
      emit(MessagesNewMsgAddedSuccessfullyState(
          isSelectingCategory: isSelectingCategories));
    }
  }

  void _customizeBotMessages() {
    if (_botMessageCurrentIndex == 1) {
      _botMessages[_botMessageCurrentIndex] =
          _botMessages[_botMessageCurrentIndex].copyWith(
              text: 'What is your last name, ${_userMessages.first}?');
    } else if (_botMessageCurrentIndex == 2) {
      _botMessages[_botMessageCurrentIndex] =
          _botMessages[_botMessageCurrentIndex].copyWith(
              text:
                  'What is your your title, ${_userMessages.first} ${_userMessages[1]}?');
    }
  }
}
