import 'package:flutter/material.dart';
import 'package:histrav_app_flutter/model/custom_colors.dart';
import 'package:histrav_app_flutter/widget/add_item_form.dart';

class AddScreen extends StatelessWidget {
  final FocusNode _destinationFocusNode = FocusNode();
  final FocusNode _cityFocusNode = FocusNode();

   AddScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _destinationFocusNode.unfocus();
        _cityFocusNode.unfocus();
      },
      child: Scaffold(
        backgroundColor: CustomColors.firebaseNavy,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: CustomColors.firebaseNavy,
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 16.0,
              right: 16.0,
              bottom: 20.0,
            ),
            child: AddItemForm(
              destinationFocusNode: _destinationFocusNode,
              cityFocusNode: _cityFocusNode,
            ),
          ),
        ),
      ),
    );
  }
}
