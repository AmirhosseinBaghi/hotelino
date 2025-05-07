import 'package:flutter/material.dart';
import 'package:hotelino/core/constant/constant.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';

class DatePickerFild extends StatefulWidget {
  final String title;
  final String hint;
  final FormFieldSetter<JalaliRange>? onSaved;
  final FormFieldValidator<JalaliRange>? validator;
  final JalaliRange? initialValue;
  const DatePickerFild(
      {super.key,
      required this.title,
      required this.hint,
      this.onSaved,
      this.validator,
      this.initialValue});

  @override
  State<DatePickerFild> createState() => _DatePickerFildState();
}

class _DatePickerFildState extends State<DatePickerFild> {
  @override
  Widget build(BuildContext context) {
    return FormField<JalaliRange?>(
      initialValue: widget.initialValue,
      onSaved: widget.onSaved,
      validator: widget.validator,
      builder: (FormFieldState<JalaliRange?> state) {
        String dateText = state.value == null
            ? ''
            : "رفت: ${state.value!.start.formatFullDate()}\nبرگشت: ${state.value!.end.formatFullDate()}";

        return Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              widget.title,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            SizedBox(
              height: 8,
            ),
            Directionality(
                textDirection: TextDirection.rtl,
                child: InkWell(
                  onTap: () async {
                    final picked = await showPersianDateRangePicker(
                        context: context,
                        initialDateRange: state.value ??
                            JalaliRange(
                                start: Jalali.now(),
                                end: Jalali.now().addDays(3)),
                        firstDate: Jalali(1385, 8),
                        lastDate: Jalali(1450, 8),
                        initialDate: Jalali.now());
                    if (picked != null) {
                      state.didChange(picked);
                    }
                  },
                  child: InputDecorator(
                    decoration: InputDecoration(
                        hintText: widget.hint,
                        suffixIcon: Icon(Icons.calendar_today_rounded),
                        errorText: state.errorText,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(
                                color: state.hasError
                                    ? Theme.of(context).colorScheme.error
                                    : Appcolors.lightBorder,
                                width: state.hasError ? 1 : 1.5))),
                    child: Text(
                      dateText.isEmpty ? widget.hint : dateText,
                      style: TextStyle(
                          color: dateText.isEmpty ? Colors.grey : Colors.black),
                    ),
                  ),
                ))
          ],
        );
      },
    );
  }
}
