import 'package:flutter/material.dart';
import 'package:histrav_app_flutter/model/custom_colors.dart';
import 'package:histrav_app_flutter/utils/database.dart';
import 'package:histrav_app_flutter/utils/validator.dart';
import 'custom_form_field.dart';

class EditItemForm extends StatefulWidget {
  final FocusNode destinationFocusNode;
  final FocusNode cityFocusNode;
  final FocusNode descriptionFocusNode;
  final FocusNode priceFocusNode;
  final String currentdestination;
  final String currentcity;
  final String currentdescription;
  final String currentprice;
  final String documentId;

  const EditItemForm({
    Key? key,
    required this.destinationFocusNode,
    required this.cityFocusNode,
    required this.descriptionFocusNode,
    required this.priceFocusNode,
    required this.currentdestination,
    required this.currentcity,
    required this.currentdescription,
    required this.currentprice,
    required this.documentId,
  }) : super(key: key);

  @override
  _EditItemFormState createState() => _EditItemFormState();
}

class _EditItemFormState extends State<EditItemForm> {
  final _editItemFormKey = GlobalKey<FormState>();

  bool _isProcessing = false;

  late TextEditingController _destinationController;
  late TextEditingController _cityController;
  late TextEditingController _descriptionController;
  late TextEditingController _priceController;

  @override
  void initState() {
    _destinationController = TextEditingController(
      text: widget.currentdestination,
    );

    _cityController = TextEditingController(
      text: widget.currentcity,
    );

    _descriptionController = TextEditingController(
      text: widget.currentdescription,
    );

    _priceController = TextEditingController(
      text: widget.currentprice,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _editItemFormKey,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 8.0,
              right: 8.0,
              bottom: 24.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 24.0),
                const Text(
                  'Course Name',
                  style: TextStyle(
                    color: CustomColors.firebaseGrey,
                    fontSize: 22.0,
                    letterSpacing: 1,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8.0),
                CustomFormField(
                  isLabelEnabled: false,
                  controller: _destinationController,
                  focusNode: widget.destinationFocusNode,
                  keyboardType: TextInputType.text,
                  inputAction: TextInputAction.next,
                  validator: (value) => Validator.validateField(
                    value: value,
                  ),
                  label: 'Course Name',
                  hint: 'Please Enter Course Name',
                ),
                const SizedBox(height: 24.0),
                const Text(
                  'Class Link',
                  style: TextStyle(
                    color: CustomColors.firebaseGrey,
                    fontSize: 22.0,
                    letterSpacing: 1,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8.0),
                CustomFormField(
                  maxLines: 10,
                  isLabelEnabled: false,
                  controller: _cityController,
                  focusNode: widget.cityFocusNode,
                  keyboardType: TextInputType.text,
                  inputAction: TextInputAction.done,
                  validator: (value) => Validator.validateField(
                    value: value,
                  ),
                  label: 'Class Link',
                  hint: 'Please Enter Class Link',
                ),
              ],
            ),
          ),
          _isProcessing
              ? const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                      CustomColors.appPurple1,
                    ),
                  ),
                )
              : Container(
                  padding: const EdgeInsets.all(10),
                  width: double.maxFinite,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        CustomColors.appPurple1,
                      ),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    onPressed: () async {
                      widget.destinationFocusNode.unfocus();
                      widget.cityFocusNode.unfocus();

                      if (_editItemFormKey.currentState!.validate()) {
                        setState(() {
                          _isProcessing = true;
                        });

                        await Database.updateItem(
                          docId: widget.documentId,
                          destination: _destinationController.text,
                          city: _cityController.text,
                          description: _descriptionController.text,
                          price: _priceController.text,
                        );

                        setState(() {
                          _isProcessing = false;
                        });

                        Navigator.of(context).pop();
                      }
                    },
                    child: const Padding(
                      padding: EdgeInsets.only(top: 16.0, bottom: 16.0),
                      child: Text(
                        'UPDATE ITEM',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: CustomColors.firebaseGrey,
                          letterSpacing: 2,
                        ),
                      ),
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
