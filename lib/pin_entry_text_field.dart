import 'package:flutter/material.dart';
import 'package:pin_entry_text_field/pin_entry_text_field.dart';

class PinEntryTextField extends StatefulWidget {
  //const PinEntryTextFieldState({ Key? key }) : super(key: key);

final String lastPin;
final int fields;
final onSubmit;
final fieldWidth;
final fontSize;
final isTextObscure;
final showFieldAsBox;

PinEntryTextField(
  {
required this.lastPin,
this.fields: 4,
this.onSubmit,
this.fieldWidth: 40,
this.fontSize: 20,
this.isTextObscure: false,
this.showFieldAsBox: false
  })
  :assert(fields>0);
  @override
   State createState(){
    return PinEntryTextFieldState();
  }}
  //_PinEntryTextFieldStateState createState() => _PinEntryTextFieldStateState();

class _PinEntryTextFieldStateState extends State<PinEntryTextField> {

  late List <String> _pin;
  late List <FocusMode> _focusModes;
  late List<TextEditingController> _textControllers;
  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}

class FocusMode {
}