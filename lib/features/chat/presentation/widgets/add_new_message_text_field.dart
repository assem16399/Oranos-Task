import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/styles/colors.dart';
import '../../../../layout/app_layout.dart';
import '../../logic/messages_cubit.dart';

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
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _messageController.clear();
  }

  void _navigateToHomeScreen() {
    Navigator.of(context).popUntil((route) => route.isFirst);
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const AppLayout()));
  }

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
        BlocBuilder<MessagesCubit, MessagesState>(
          buildWhen: (_, nextState) =>
              nextState is MessagesNewMsgAddedSuccessfullyState &&
              nextState.isSelectingCategory,
          builder: (context, state) {
            final messagesCubit = BlocProvider.of<MessagesCubit>(context);
            return IconButton(
                onPressed: () {
                  if (_messageController.text.trim().isNotEmpty &&
                      !messagesCubit.isSelectingCategories) {
                    messagesCubit.addNewMessage(msg: _messageController.text);
                  } else if (messagesCubit.isSelectingCategories) {
                    _navigateToHomeScreen();
                  }
                  _messageController.clear();
                },
                icon: SvgPicture.asset('assets/icons/send_icon.svg'));
          },
        )
      ],
    );
  }
}
