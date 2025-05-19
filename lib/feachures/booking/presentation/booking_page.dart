import 'package:flutter/material.dart';
import 'package:hotelino/feachures/booking/presentation/provider/booking_provider.dart';
import 'package:hotelino/feachures/booking/presentation/widgets/booking_form_fild.dart';
import 'package:hotelino/feachures/booking/presentation/widgets/date_picker_fild.dart';
import 'package:hotelino/feachures/booking/presentation/widgets/number_form_fild.dart';
import 'package:hotelino/feachures/booking/presentation/widgets/terms_widget.dart';
import 'package:provider/provider.dart';

class BookingPage extends StatefulWidget {
  static final GlobalKey<BookingPageState> bookingPageKey =
      GlobalKey<BookingPageState>();
  BookingPage({Key? key}) : super(key: bookingPageKey);

  @override
  State<BookingPage> createState() => BookingPageState();
}

class BookingPageState extends State<BookingPage> {
  final _formKey = GlobalKey<FormState>();

  void resetForm() {
    Future.delayed(
      Duration(milliseconds: 100),
      () {
        _formKey.currentState?.reset();
        setState(() {});
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'فرم رزرو هتل',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Consumer<BookingProvider>(
            builder: (context, bookingProvider, child) {
              return Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BookingFormFild(
                        title: "نام و نام خانوادگی",
                        hint: "نام و نام خانوادگی خود را وارد کنید...",
                        keyboardType: TextInputType.text,
                        inisialValue: bookingProvider.booking.fullName,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "نام خود را به درستی وارد کنید";
                          }
                          return null;
                        },
                        onSaved: (newValue) {
                          if (newValue != null) {
                            bookingProvider.setName(newValue);
                          }
                        },
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      BookingFormFild(
                        title: "مقصد",
                        hint: "مقصد خود را وارد کنید...",
                        keyboardType: TextInputType.text,
                        inisialValue: bookingProvider.booking.destination,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "لطفا مقصد خود را مشخص کنید";
                          }
                          return null;
                        },
                        onSaved: (newValue) {
                          if (newValue != null) {
                            bookingProvider.setDestination(newValue);
                          }
                        },
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      DatePickerFild(
                        title: "تاریخ اقامت",
                        hint: "بازه زمانی اقامت را مشخص کنید",
                        initialValue:
                            bookingProvider.booking.checkInOutRangeDate,
                        validator: (value) {
                          if (value == null) {
                            return "لطفا بازه زمانی را مشخص کنید";
                          } else {
                            return null;
                          }
                        },
                        onSaved: (newValue) {
                          if (newValue != null) {
                            bookingProvider.setCheckInOutRangeDate(newValue);
                          }
                        },
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      BookingFormFild(
                        title: "تعداد نفرات",
                        hint: "تعداد نفرات خود را وارد کنید...",
                        keyboardType: TextInputType.text,
                        inisialValue: bookingProvider.booking.numberOfGuests,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "لطفا تعداد نفرات خود را مشخص کنید";
                          }
                          return null;
                        },
                        onSaved: (newValue) {
                          if (newValue != null) {
                            bookingProvider.setNumberOfGuests(newValue);
                          }
                        },
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      NumberFormFild(
                        title: "شماره تماس",
                        hint: "شماره تماس خود را وارد کنید...",
                        inisialValue: bookingProvider.booking.phoneNumber,
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'لطفا شماره را به درستی وارد کنید';
                          }
                          return null;
                        },
                        onSaved: (newValue) {
                          if (newValue != null) {
                            bookingProvider.setPhoneNumber(newValue);
                          }
                        },
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      TermsWidget(
                        inisialValue: false,
                        validator: (value) {
                          if (value == null || value == false) {
                            return 'لطفا قوانین و مقررات برنامه را بپذیرید';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                        content: Text(
                                  "درخواست رزرو هتل با موفقیت انجام شد!🎉",
                                  textDirection: TextDirection.rtl,
                                )));
                              }
                            },
                            child: Text("جستوجو هتل ها")),
                      )
                    ],
                  ));
            },
          ),
        ),
      ),
    );
  }
}
