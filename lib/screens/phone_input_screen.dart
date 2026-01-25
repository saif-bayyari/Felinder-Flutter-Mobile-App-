import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../routes.dart';
import '../custom_widgets/social_sign_in_card.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

final phoneFormatter = MaskTextInputFormatter(
  mask: '(###) ###-####',
  filter: {"#": RegExp(r'[0-9]')}, // Only allows digits in # positions
);


class PhoneInput extends StatelessWidget {
  const PhoneInput({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Phone Input Route')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(40.0),
              child:TextFormField(
                keyboardType: TextInputType.phone,
                inputFormatters: [phoneFormatter],
                validator: FormBuilderValidators.required(),
              )
            ),



          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                // Navigate back to first route when tapped.
                Navigator.pop(context);
              },
              child: const Text('Go back!'),
            ),
          ),
        ],
      ),
    );
  }
}