import 'package:flutter/material.dart';
import 'package:histrav_app_flutter/model/custom_colors.dart';
import 'package:histrav_app_flutter/utils/database.dart';
import 'package:histrav_app_flutter/widget/app_bar_title.dart';
import 'package:histrav_app_flutter/widget/edit_item_form.dart';

class EditScreen extends StatefulWidget {
  final String currentdestination;
  final String currentcity;
  final String currentdescription;
  final String currentprice;
  final String documentId;

  const EditScreen({
    Key? key,
    required this.currentdestination,
    required this.currentcity,
    required this.currentdescription,
    required this.currentprice,
    required this.documentId,
  }) : super(key: key);

  @override
  _EditScreenState createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  final FocusNode _destinationFocusNode = FocusNode();

  final FocusNode _cityFocusNode = FocusNode();

  final FocusNode _descriptionFocusNode = FocusNode();

  final FocusNode _priceFocusNode = FocusNode();

  bool _isDeleting = false;

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
          actions: [
            _isDeleting
                ? const Padding(
                    padding: EdgeInsets.only(
                      top: 10.0,
                      bottom: 10.0,
                      right: 16.0,
                    ),
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        Colors.redAccent,
                      ),
                      strokeWidth: 3,
                    ),
                  )
                : IconButton(
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.redAccent,
                      size: 32,
                    ),
                    onPressed: () async {
                      setState(() {
                        _isDeleting = true;
                      });

                      await Database.deleteItem(
                        docId: widget.documentId,
                      );

                      setState(() {
                        _isDeleting = false;
                      });

                      Navigator.of(context).pop();
                    },
                  ),
          ],
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 16.0,
              right: 16.0,
              bottom: 20.0,
            ),
            child: EditItemForm(
              documentId: widget.documentId,
              destinationFocusNode: _destinationFocusNode,
              cityFocusNode: _cityFocusNode,
              descriptionFocusNode: _descriptionFocusNode,
              priceFocusNode: _priceFocusNode,
              currentdestination: widget.currentdestination,
              currentcity: widget.currentcity,
              currentdescription: widget.currentdescription,
              currentprice: widget.currentprice,
            ),
          ),
        ),
      ),
    );
  }
}
