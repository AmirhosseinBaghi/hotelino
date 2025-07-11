import 'package:flutter/material.dart';
import 'package:hotelino/core/constant/constant.dart';
import 'package:hotelino/feachures/booking/data/models/country.dart';

class NumberFormFild extends StatefulWidget {
  static final GlobalKey<NumberFormFildState> numberFormKey =
      GlobalKey<NumberFormFildState>();
  final String title;
  final String hint;
  final String inisialValue;
  final TextInputType keyboardType;
  final FormFieldValidator<String>? validator;
  final FormFieldSetter<String>? onSaved;
  NumberFormFild(
      {required this.title,
      required this.hint,
      required this.inisialValue,
      required this.keyboardType,
      this.validator,
      this.onSaved})
      : super(key: numberFormKey);

  @override
  State<NumberFormFild> createState() => NumberFormFildState();
}

class NumberFormFildState extends State<NumberFormFild> {
  late Country selectedCountry;
  final FocusNode _focusNode = FocusNode();
  final TextEditingController _controller = TextEditingController();
  TextAlign _textAlign = TextAlign.right;

  final List<Country> countries = [
    Country(name: 'ایران', dialCode: '+98', countryCode: 'IR'),
    Country(name: 'ایالات متحده', dialCode: '+1', countryCode: 'US'),
    Country(name: 'بریتانیا', dialCode: '+44', countryCode: 'GB'),
    Country(name: 'آلمان', dialCode: '+49', countryCode: 'DE'),
    Country(name: 'فرانسه', dialCode: '+33', countryCode: 'FR'),
    Country(name: 'اسپانیا', dialCode: '+34', countryCode: 'ES'),
    Country(name: 'ایتالیا', dialCode: '+39', countryCode: 'IT'),
    Country(name: 'استرالیا', dialCode: '+61', countryCode: 'AU'),
    Country(name: 'هند', dialCode: '+91', countryCode: 'IN'),
  ];

  @override
  void initState() {
    selectedCountry = countries[0];
    _controller.text = widget.inisialValue;
    _controller.addListener(
      () {
        setState(() {
          _textAlign =
              _controller.text.isEmpty ? TextAlign.right : TextAlign.left;
        });
      },
    );
    _focusNode.addListener(
      () {
        setState(() {});
      },
    );
    super.initState();
  }

  void resetEnteredNumber() {
    _controller.clear();
    _textAlign = TextAlign.right;
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FormField<String>(
      initialValue: _controller.text,
      validator: widget.validator,
      onSaved: widget.onSaved,
      builder: (FormFieldState<String> field) {
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
            SizedBox(
              height: 56,
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(
                        color: field.hasError
                            ? Theme.of(context).colorScheme.error
                            : _focusNode.hasFocus
                                ? Theme.of(context).colorScheme.primary
                                : Appcolors.lightBorder,
                        width: field.hasError ? 1 : 1.5),
                    borderRadius: BorderRadius.circular(12)),
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  children: [
                    SizedBox(
                      width: 160,
                      child: DropdownButton<Country>(
                        value: selectedCountry,
                        isExpanded: true,
                        items: countries.map(
                          (Country country) {
                            return DropdownMenuItem<Country>(
                                value: country,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Image.network(
                                      'https://flagsapi.com/${country.countryCode}/shiny/64.png',
                                      width: 28,
                                      height: 28,
                                      errorBuilder:
                                          (context, error, stackTrace) =>
                                              const Icon(Icons.flag, size: 28),
                                    ),
                                    const SizedBox(width: 8),
                                    Text(
                                      country.name,
                                      style: const TextStyle(fontSize: 14),
                                    ),
                                    const SizedBox(width: 8),
                                    Text(
                                      country.dialCode,
                                    ),
                                  ],
                                ));
                          },
                        ).toList(),
                        onChanged: (Country? newCountry) {
                          if (newCountry != null) {
                            setState(() {
                              selectedCountry = newCountry;
                            });
                          }
                        },
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Expanded(
                        child: TextField(
                      controller: _controller,
                      focusNode: _focusNode,
                      textAlign: _textAlign,
                      keyboardType: widget.keyboardType,
                      decoration: InputDecoration(
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(vertical: 12),
                          filled: false,
                          border: InputBorder.none,
                          hintText: widget.hint),
                      onChanged: (value) {
                        field.didChange(value);
                      },
                    ))
                  ],
                ),
              ),
            ),
            if (field.hasError)
              Padding(
                padding: EdgeInsets.only(top: 8, right: 12),
                child: Text(
                  field.errorText ?? '',
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.error, fontSize: 12),
                ),
              )
          ],
        );
      },
    );
  }
}
