import 'package:flutter/material.dart';

const double BODY_PADDING = 22.0;
const double TOP_PADDING = 48.0;

//MediaQuery Width
double width(BuildContext context) => MediaQuery.of(context).size.width;

//MediaQuery Height
double height(BuildContext context) => MediaQuery.of(context).size.height;

SizedBox tiny5HorSpace() => const SizedBox(width: 5);

SizedBox tiny5Space() => const SizedBox(height: 5);

SizedBox tinySpace() => const SizedBox(height: 10);

SizedBox tiny15Space() => const SizedBox(height: 15);

SizedBox tinyHorSpace() => const SizedBox(width: 10);

SizedBox tiny15HorSpace() => const SizedBox(width: 15);

SizedBox smallSpace() => const SizedBox(height: 20);

SizedBox smallHorSpace() => const SizedBox(width: 20);

SizedBox mediumSpace() => const SizedBox(height: 30);

SizedBox mediumHorSpace() => const SizedBox(width: 30);

verticalSpace(context, factor) => SizedBox(height: height(context) * factor);

horizontalSpace(context, factor) => SizedBox(width: width(context) * factor);

const String emailRegex = '[a-zA-Z0-9\+\.\_\%\-\+]{1,256}' +
    '\\@' +
    '[a-zA-Z0-9][a-zA-Z0-9\\-]{0,64}' +
    '(' +
    '\\.' +
    '[a-zA-Z0-9][a-zA-Z0-9\\-]{0,25}' +
    ')+';

String emptyEmailField = 'Email cannot be empty';
String emptyTextField = 'Field cannot be empty';
String emptyPasswordField = 'Password cannot be empty';
String passwordLengthError = 'Password is too short';

const String phoneNumberRegex = r'0[789][01]\d{8}';
const String upperCaseRegex = r'^(?=.*?[A-Z])(?=.*?[a-z]).{8,}$';
const String lowerCaseRegex = r'^(?=.*?[a-z]).{8,}$';
const String symbolRegex = r'^(?=.*?[!@#\$&*~]).{8,}$';
const String digitRegex = r'^(?=.*?[0-9]).{8,}$';
const String passwordDigitErr = 'Password must have at least one digit';
const String passwordUppercaseErr =
    'Password must have at least one Upper case';
const String passwordSymbolErr =
    'Password must have a least one special character';

const String phoneNumberLengthError = 'Phone number must be 11 digits';

const String invalidPhoneNumberField =
    "Number provided isn\'t valid.Try another phone number";

String PHONE_NUMBER_LENGTH_ERROR = 'Password is too short';

List<Map> searchList = [
  {
    "title": "Macbook pro M2",
    "subtitle": "#NE43857340857904",
    'country': "Paris",
    'state': 'Morocco'
  },
  {
    "title": "Summer linen jacket",
    "subtitle": "#NEJ20089934122231",
    'country': "Barcelona",
    'state': 'Paris'
  },
  {
    "title": "Tapered-fit jeans AW",
    "subtitle": "#NE35870264978659",
    'country': "Colombia",
    'state': 'Paris'
  },
  {
    "title": "Slim fit jeans AW",
    "subtitle": "#NE43857340857904",
    'country': "Bogota",
    'state': 'Dhaka'
  },
  {
    "title": "Office setup desk",
    "subtitle": "#NE43857340857904",
    'country': "France",
    'state': 'German'
  },
];

List<Map> shippingHistory = [
  {
    'status': 'loading',
    'arrivaltime': 'Arriving today',
    'details':
        'Your delivery, #NEJ20089934122231\nfrom Atlanta, is arriving today!',
    'amount': '\$230 USD',
    'date': 'Sep 20,20023'
  },
  {
    'status': 'loading',
    'arrivaltime': 'Arriving today',
    'details':
        'Your delivery, #NEJ20089934122231\nfrom Atlanta, is arriving today!',
    'amount': '\$230 USD',
    'date': 'Sep 20,20023'
  },
  {
    'status': 'loading',
    'arrivaltime': 'Arriving today',
    'details':
        'Your delivery, #NEJ20089934122231\nfrom Atlanta, is arriving today!',
    'amount': '\$230 USD',
    'date': 'Sep 20,20023'
  },
  {
    'status': 'in-progress',
    'arrivaltime': 'Arriving today',
    'details':
        'Your delivery, #NEJ20089934122231\nfrom Atlanta, is arriving today!',
    'amount': '\$230 USD',
    'date': 'Sep 20,20023'
  },
  {
    'status': 'pending',
    'arrivaltime': 'Arriving today',
    'details':
        'Your delivery, #NEJ20089934122231\nfrom Atlanta, is arriving today!',
    'amount': '\$230 USD',
    'date': 'Sep 20,20023'
  },
  {
    'status': 'in-progress',
    'arrivaltime': 'Arriving today',
    'details':
        'Your delivery, #NEJ20089934122231\nfrom Atlanta, is arriving today!',
    'amount': '\$230 USD',
    'date': 'Sep 20,20023'
  },
  {
    'status': 'loading',
    'arrivaltime': 'Arriving today',
    'details':
        'Your delivery, #NEJ20089934122231\nfrom Atlanta, is arriving today!',
    'amount': '\$230 USD',
    'date': 'Sep 20,20023'
  },
  {
    'status': 'completed',
    'arrivaltime': 'Arriving today',
    'details':
        'Your delivery, #NEJ20089934122231\nfrom Atlanta, is arriving today!',
    'amount': '\$230 USD',
    'date': 'Sep 20,20023'
  },
  {
    'status': 'pending',
    'arrivaltime': 'Arriving today',
    'details':
        'Your delivery, #NEJ20089934122231\nfrom Atlanta, is arriving today!',
    'amount': '\$230 USD',
    'date': 'Sep 20,20023'
  },
  {
    'status': 'pending',
    'arrivaltime': 'Arriving today',
    'details':
        'Your delivery, #NEJ20089934122231\nfrom Atlanta, is arriving today!',
    'amount': '\$230 USD',
    'date': 'Sep 20,20023'
  }
];
List<Map> itemSendingList = [
  {"Code": "Box", "Name": "Box"},
  {"Code": "Laptop", "Name": "Laptop"},
  {"Code": "Others", "Name": "Others"},
];

List<Map> categoryList = [
  {
    "type": "Documents",
  },
  {
    "type": "Glass",
  },
  {
    "type": "Liquid",
  },
  {
    "type": "Food",
  },
  {
    "type": "Electronic",
  },
  {
    "type": "Product",
  },
  {
    "type": "Others",
  },
];
