import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  final ValueChanged<String> onValue;

  const CustomSearchBar({super.key, required this.onValue});

  @override
  Widget build(BuildContext context) {
    final texController = TextEditingController();
    final focusNode = FocusNode();

    final outlineInputBorder = UnderlineInputBorder(
        borderSide: const BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.circular(20));

    final inputDecoration = InputDecoration(
        hintText: 'Search pokémon',
        enabledBorder: outlineInputBorder,
        focusedBorder: outlineInputBorder,
        filled: true,
        suffixIcon: IconButton(
          icon: const Icon(Icons.search_outlined),
          onPressed: () {
            final value = texController.value.text;
            focusNode.unfocus();
            onValue(value);
          },
        ));

    return TextFormField(
      focusNode: focusNode,
      controller: texController,
      decoration: inputDecoration,
      onFieldSubmitted: (value) {
        focusNode.unfocus();
        onValue(value);
      },
      onTapOutside: (_) {
        focusNode.unfocus();
      },
    );
  }
}