import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movemate/colors.dart';
import 'package:movemate/components/Button/index.dart';
import 'package:movemate/components/TextInput.dart';
import 'package:movemate/constants.dart' as Constants;
import 'package:movemate/utils/typography.dart';
import 'package:movemate/validator.dart';

import '../../components/scaffold.dart';
import '../../constants.dart';
import '../../controller/global_controller.dart';
import '../home/index.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _loginFormKey = GlobalKey<FormState>();

  // final PayloadGenerator generator = PayloadGenerator();
  GlobalController _globalController = Get.put(GlobalController());

  // final Encryptionist enc = Encryptionist();
  final emailController = TextEditingController();
  final phoneNumberController = TextEditingController();

  String storedEmailAddress = "";
  String password = "";
  bool _isBioAvailable = true;
  bool isObs = true;

  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TextStore textStore = new TextStore(context);
    double cWidth = MediaQuery.of(context).size.width;

    return WillPopScope(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: CustomScaffold(
            backGroundColor: Colors.white,
            child: Column(
              children: [
                CustomAppBar(
                  // actionWidget: true,
                  onTap: () => null,
                ),
                Expanded(
                  child: Form(
                      key: _loginFormKey,
                      child: Container(
                          width: cWidth * 0.85,
                          child: ListView(
                            padding: EdgeInsets.zero,
                            children: [
                              smallSpace(),
                              Text(
                                'Welcome Back!',
                                style:
                                    textStore.Body16SemiBold(color: PRIMARY40),
                              ),
                              tinySpace(),
                              Text(
                                'Let\'s Get Started',
                                style: textStore.Body13Regular(color: GREY7),
                              ),
                              Constants.verticalSpace(context, 0.03),
                              TextInputForm(
                                  onChanged: (String value) {},
                                  validator: (value) =>
                                      PhoneNumberValidator.validate(value),
                                  controller: phoneNumberController,
                                  maxLength: 11,
                                  keyboardType: TextInputType.phone,
                                  label: 'Phone Number',
                                  hint: 'Phone Number'),
                              TextInputForm(
                                  onChanged: (String value) {
                                    setState(() {
                                      password = value;
                                    });
                                  },
                                  validator: (value) =>
                                      FieldValidator.validate(value),
                                  maxLength: 4,
                                  keyboardType: TextInputType.number,
                                  obscure: isObs,
                                  label: 'Password',
                                  hint: 'Password'),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  TextButton(
                                      onPressed: () {},
                                      child: Text(
                                        'Forgot password?',
                                        textAlign: TextAlign.left,
                                        style: textStore.Capture11Regular(
                                                color: PRIMARY40)
                                            .copyWith(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 13),
                                      )),
                                ],
                              ),
                              Constants.verticalSpace(context, 0.03),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: DefaultButton(
                                    title: 'Login',
                                    onPress: () {
                                      Navigator.pushAndRemoveUntil(context,
                                          MaterialPageRoute(builder: (context) {
                                        return DashboardEntry();
                                      }), (Route<dynamic> route) => false);
                                    }
                                    // }
                                    ),
                              ),
                              mediumSpace(),
                              if (_isBioAvailable)
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: fingerprint(context, textStore),
                                ),
                              tinySpace(),
                              Center(
                                child: TextButton(
                                    onPressed: () {},
                                    child: RichText(
                                      textAlign: TextAlign.center,
                                      text: TextSpan(
                                          style:
                                              textStore.Body13RegularUnderline(
                                                  color: GREYSCALE),
                                          text: 'New User? ',
                                          children: [
                                            TextSpan(
                                              style: textStore
                                                      .Body13RegularUnderline(
                                                          color: PRIMARY40)
                                                  .copyWith(
                                                      decoration: TextDecoration
                                                          .underline),
                                              text: 'Create Account',
                                            )
                                          ]),
                                    )),
                              ),
                              Constants.verticalSpace(context, 0.03),
                            ],
                          ))),
                )
              ],
            ),
          ),
        ),
        onWillPop: () {
          return Future.value(false);
        });
  }

  fingerprint(BuildContext context, TextStore textStore) {
    return InkWell(
      onTap: () {},
      child: Column(
        children: [
          Text(
            'Login with fingerprint',
            textAlign: TextAlign.center,
            style: textStore.Body13RegularUnderline(
              color: GREY8,
            ).copyWith(decoration: TextDecoration.underline, fontSize: 14),
          ),
          smallSpace(),
          Container(
            height: 80,
            width: 80,
            child: Image.asset(
              'assets/images/biometric.png',
            ),
          ),
        ],
      ),
    );
  }
}
