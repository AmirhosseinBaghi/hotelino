import 'package:flutter/material.dart';
import 'package:hotelino/feachures/booking/data/models/booking_model.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';

class BookingProvider extends ChangeNotifier {
  final BookingModel _booking = BookingModel();
  BookingModel get booking => _booking;

  void setName(String value) {
    _booking.fullName = value;
    notifyListeners();
  }

  void setDestination(String value) {
    _booking.destination = value;
    notifyListeners();
  }

  void setCheckInOutRangeDate(JalaliRange value) {
    _booking.checkInOutRangeDate = value;
    notifyListeners();
  }

  void setNumberOfGuests(String value) {
    _booking.numberOfGuests = value;
    notifyListeners();
  }

  void setPhoneNumber(String value) {
    _booking.phoneNumber = value;
    notifyListeners();
  }
}
