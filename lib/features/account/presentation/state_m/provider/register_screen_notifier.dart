import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/common/custom_modules/screen_notifier.dart';
import '../../../../../core/common/text_formatters/iq_number_formatter.dart';
import '../../../../../core/common/utils/utils.dart';
import '../../../data/request/param/register_request.dart';
import '../../screen/register_screen.dart';
import '../cubit/account_cubit.dart';

class RegisterScreenNotifier extends ScreenNotifier {
  RegisterScreenNotifier(this.param);

  // fields
  final RegisterScreenParam param;

  final cancelToken = CancelToken();

  // Focus nodes
  final myFocusNodeName = FocusNode();
  final myFocusNodeLastName = FocusNode();
  final myFocusNodePhoneOrEmail = FocusNode();
  final myFocusNodePassword = FocusNode();
  final myFocusNodeConfirmPassword = FocusNode();

  // Keys
  final formKey = GlobalKey<FormState>();
  final nameKey = GlobalKey<FormFieldState<String>>();
  final lastNameKey = GlobalKey<FormFieldState<String>>();
  final phoneOrEmailKey = GlobalKey<FormFieldState<String>>();
  final passwordKey = GlobalKey<FormFieldState<String>>();
  final confirmPasswordKey = GlobalKey<FormFieldState<String>>();

  // Controllers
  final nameController = TextEditingController();
  final lastNameController = TextEditingController();
  final phoneOrEmailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  bool _turnPhoneOrEmailValidate = true;
  bool _turnPasswordValidate = true;
  bool _turnLastNameValidate = true;
  bool _turnNameValidate = true;
  bool _inAsyncCall = false;
  bool _passwordSecure = true;
  bool _confirmPasswordSecure = true;

  // Get, Set
  bool get turnPhoneOrEmailValidate => _turnPhoneOrEmailValidate;
  bool get turnPasswordValidate => _turnPasswordValidate;
  bool get turnLastNameValidate => _turnLastNameValidate;
  bool get turnNameValidate => _turnNameValidate;
  bool get inAsyncCall => _inAsyncCall;
  bool get passwordSecure => _passwordSecure;
  bool get confirmPasswordSecure => _confirmPasswordSecure;

  set turnPhoneOrEmailValidate(bool v) {
    _turnPhoneOrEmailValidate = v;
    notifyListeners();
  }

  set turnPasswordValidate(bool v) {
    _turnPasswordValidate = v;
    notifyListeners();
  }

  set turnLastNameValidate(bool v) {
    _turnLastNameValidate = v;
    notifyListeners();
  }

  set turnNameValidate(bool v) {
    _turnNameValidate = v;
    notifyListeners();
  }

  set inAsyncCall(bool v) {
    _inAsyncCall = v;
    notifyListeners();
  }

  set passwordSecure(bool v) {
    _passwordSecure = v;
    notifyListeners();
  }

  set confirmPasswordSecure(bool v) {
    _confirmPasswordSecure = v;
    notifyListeners();
  }

  // methods
  void unFocus(BuildContext context) {
    Utils.unFocus(context);
  }

  void sendRequest(BuildContext context) {
    unFocus(context);

    _turnPhoneOrEmailValidate = true;
    _turnPasswordValidate = true;
    _turnLastNameValidate = true;
    _turnNameValidate = true;
    notifyListeners();

    if (formKey.currentState?.validate() ?? false) {
      BlocProvider.of<AccountCubit>(context).register(
        RegisterRequest(
          name: nameController.text,
          surname: lastNameController.text,
          phoneNumber: IqNumberInputFormatter.getIraqMobileNumberWithZero(
            phoneOrEmailController.text,
          ),
          emailAddress: null,
          gender: null,
          dateOfBirth: null,
          cancelToken: cancelToken,
        ),
      );
    }
  }

  @override
  void closeNotifier() {
    cancelToken.cancel();
    myFocusNodeName.dispose();
    myFocusNodeLastName.dispose();
    myFocusNodePhoneOrEmail.dispose();
    myFocusNodePassword.dispose();
    myFocusNodeConfirmPassword.dispose();
    nameController.dispose();
    lastNameController.dispose();
    phoneOrEmailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    this.dispose();
  }
}
