import 'package:bloc/bloc.dart';

import '../data/models/message.dart';

part 'messages_state.dart';

class MessagesCubit extends Cubit<MessagesState> {
  MessagesCubit() : super(MessagesInitial());

  var _botMessageCurrentIndex = 0;
  var isSelectingCategories = false;
  final List<Message> _botMessages = [
    Message(id: '1', text: 'Hi, What is your first name?', isMe: false),
    Message(id: '2', text: 'What is your last name?', isMe: false),
    Message(id: '3', text: 'What is your title?', isMe: false),
    Message(
        id: '4', text: 'What Categories you will need expert In?', isMe: false),
  ];

  final List<Message> conversationMessages = [];

  void startConversation() {
    if (conversationMessages.isEmpty) {
      _addBotMessage();
      emit(MessagesConversationStartedSuccessfullyState());
    }
  }

  void _addBotMessage() {
    conversationMessages.add(_botMessages[_botMessageCurrentIndex]);
    _botMessageCurrentIndex++;
    if (_botMessageCurrentIndex == _botMessages.length) {
      isSelectingCategories = true;
    }
  }

  void addNewMessage({required String msg}) {
    if (_botMessageCurrentIndex < _botMessages.length) {
      conversationMessages
          .add(Message(id: DateTime.now().toString(), text: msg, isMe: true));

      _addBotMessage();

      emit(MessagesNewMsgAddedSuccessfullyState(
          isSelectingCategory: isSelectingCategories));
    }
  }
}