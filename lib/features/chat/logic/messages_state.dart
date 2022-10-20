part of 'messages_cubit.dart';

abstract class MessagesState {}

class MessagesInitial extends MessagesState {}

class MessagesConversationStartedSuccessfullyState extends MessagesState {}

class MessagesNewMsgAddedSuccessfullyState extends MessagesState {}
