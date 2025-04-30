import 'package:flutter/material.dart';

class BookingFormFild extends StatelessWidget {
  final String title;
  final String hint;
  final String inisialValue;
  final TextInputType keyboardType;
  final FormFieldValidator<String>? validator;
  final FormFieldSetter<String>? onSaved;
  const BookingFormFild(
      {super.key,
      required this.title,
      required this.hint,
      required this.inisialValue,
      required this.keyboardType,
      this.validator,
      this.onSaved});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        SizedBox(
          height: 8,
        ),
        Directionality(
            textDirection: TextDirection.rtl,
            child: TextFormField(
              initialValue: inisialValue,
              validator: validator,
              textDirection: TextDirection.rtl,
              textAlign: TextAlign.right,
              onSaved: onSaved,
              keyboardType: keyboardType,
              decoration: InputDecoration(hintText: hint),
            ))
      ],
    );
  }
}
