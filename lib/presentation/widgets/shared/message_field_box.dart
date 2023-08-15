import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  final ValueChanged<String> onValue;
  const MessageFieldBox({required this.onValue, super.key});

  @override
  Widget build(BuildContext context) {
    //final colors = Theme.of(context).colorScheme;
    final textController = TextEditingController();
    final focusNode = FocusNode();

    // outlinInputBorder
    final outlineInputBorder = UnderlineInputBorder(
      borderSide: const BorderSide(color: Colors.transparent),
      borderRadius: BorderRadius.circular(40),
    );

    // inputDecoration
    final inputDecoration = InputDecoration(
        hintText: 'Termina tu mensaje con "?"',
        enabledBorder: outlineInputBorder,
        focusedBorder: outlineInputBorder,
        filled: true,
        suffixIcon: IconButton(
          onPressed: () {
            final textValue = textController.value.text;
            textController.clear();
            onValue(textValue);
          },
          icon: const Icon(Icons.send_outlined),
        ));

    return TextFormField(
      onTapOutside: (event) {
        focusNode.unfocus();
      },
      focusNode: focusNode,
      controller: textController,
      decoration: inputDecoration,
      onFieldSubmitted: (value) {
        onValue(value);
        textController.clear();
        focusNode.requestFocus();
      },
    );
  }
}
