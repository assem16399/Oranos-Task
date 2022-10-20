import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/features/chat/logic/messages_cubit.dart';
import '../widgets/add_new_message_text_field.dart';
import '../widgets/chat_message.dart';
import '../widgets/selectable_categories_list.dart';

class ChatBotScreen extends StatefulWidget {
  const ChatBotScreen({Key? key}) : super(key: key);

  @override
  State<ChatBotScreen> createState() => _ChatBotScreenState();
}

class _ChatBotScreenState extends State<ChatBotScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<MessagesCubit>(context).startConversation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: BlocBuilder<MessagesCubit, MessagesState>(
                  builder: (context, state) {
                    final messagesCubit =
                        BlocProvider.of<MessagesCubit>(context);
                    final messages = messagesCubit.conversationMessages;

                    return ListView.separated(
                      itemBuilder: (context, index) {
                        return LayoutBuilder(
                          builder: (context, constraint) {
                            if (messagesCubit.isSelectingCategories &&
                                index == messages.length) {
                              return const SelectableCategoriesList();
                            }
                            return ChatMessage(
                              maxWidth: constraint.maxWidth,
                              isMe: messages[index].isMe,
                              text: messages[index].text,
                            );
                          },
                        );
                      },
                      itemCount: messagesCubit.isSelectingCategories
                          ? messages.length + 1
                          : messages.length,
                      separatorBuilder: (_, __) => const SizedBox(height: 10),
                    );
                  },
                ),
              ),
            ),
            const Divider(),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: AddNewMessageTextField(),
            )
          ],
        ),
      ),
    );
  }
}
