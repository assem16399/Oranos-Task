import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:oranos/features/chat/logic/messages_cubit.dart';

import '/core/styles/colors.dart';
import '../widgets/bot_message.dart';
import '../widgets/user_message.dart';

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
                    final messages = BlocProvider.of<MessagesCubit>(context)
                        .conversationMessages;
                    return ListView.separated(
                      itemBuilder: (context, index) => LayoutBuilder(
                        builder: (context, constraint) {
                          return Row(
                            mainAxisAlignment: messages[index].isMe
                                ? MainAxisAlignment.end
                                : MainAxisAlignment.start,
                            children: [
                              if (messages[index].isMe)
                                UserMessage(
                                    maxWidth: constraint.maxWidth,
                                    msgText: messages[index].text),
                              if (!messages[index].isMe)
                                BotMessage(
                                    maxWidth: constraint.maxWidth,
                                    msgText: messages[index].text)
                            ],
                          );
                        },
                      ),
                      itemCount: messages.length,
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

class AddNewMessageTextField extends StatefulWidget {
  const AddNewMessageTextField({
    Key? key,
  }) : super(key: key);

  @override
  State<AddNewMessageTextField> createState() => _AddNewMessageTextFieldState();
}

class _AddNewMessageTextFieldState extends State<AddNewMessageTextField> {
  final _messageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: _messageController,
            decoration: InputDecoration(
              hintText: 'Type Something...',
              hintStyle: Theme.of(context)
                  .textTheme
                  .bodyText2!
                  .copyWith(color: kHintColor),
              prefixIcon: const Icon(
                Icons.language,
                color: kHintColor,
              ),
              suffixIconConstraints:
                  const BoxConstraints(maxWidth: 70, maxHeight: 70),
              suffixIcon: Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: SvgPicture.asset('assets/icons/voice_icon.svg')),
              focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(12))),
              border: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black,
                ),
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
            ),
          ),
        ),
        const SizedBox(width: 10),
        IconButton(
            onPressed: () {
              if (_messageController.text.trim().isNotEmpty) {
                BlocProvider.of<MessagesCubit>(context)
                    .addNewMessage(msg: _messageController.text);
                _messageController.clear();
              }
            },
            icon: SvgPicture.asset('assets/icons/send_icon.svg'))
      ],
    );
  }
}
