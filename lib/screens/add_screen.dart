import 'package:flutter/material.dart';
import 'package:histrav_app_flutter/model/custom_colors.dart';
import 'package:histrav_app_flutter/widget/add_item_form.dart';
import 'package:histrav_app_flutter/widget/app_bar_title.dart';

class AddScreen extends StatelessWidget {
  final FocusNode _destinationFocusNode = FocusNode();
  final FocusNode _cityFocusNode = FocusNode();
  final FocusNode _descriptionFocusNode = FocusNode();
  final FocusNode _priceFocusNode = FocusNode();

  AddScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _destinationFocusNode.unfocus();
        _cityFocusNode.unfocus();
        _descriptionFocusNode.unfocus();
        _priceFocusNode.unfocus();
      },
      child: Scaffold(
        backgroundColor: CustomColors.firebaseNavy,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: CustomColors.firebaseNavy,
          title: const AppBarTitle(),
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
              descriptionFocusNode: _descriptionFocusNode,
              priceFocusNode: _priceFocusNode,
            ),
          ),
        ),
      ),
    );
  }
}
