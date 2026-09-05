import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

import '../../../../core/common/app_colors.dart';
import '../../../../core/common/text_formatters/iq_number_formatter.dart';
import '../../../../core/common/validators.dart';
import '../../../../core/constants/enums/otp_request_type.dart';
import '../../../../core/navigation/animations/animated_route.dart';
import '../../../../core/ui/dialogs/otp_dialog.dart';
import '../../../../core/ui/error_ui/error_viewer/error_viewer.dart';
import '../../../../core/ui/screens/base_screen.dart';
import '../../../../core/ui/widgets/custom_button.dart';
import '../../../../generated/l10n.dart';
import '../state_m/cubit/account_cubit.dart';
import '../state_m/provider/register_screen_notifier.dart';

class RegisterScreenParam {}

class RegisterScreen extends BaseScreen<RegisterScreenParam> {
  static const routeName = "/RegisterScreen";

  RegisterScreen({required RegisterScreenParam param, Key? key})
    : super(param: param, key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late final RegisterScreenNotifier sn;

  @override
  void initState() {
    super.initState();
    sn = RegisterScreenNotifier(widget.param);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: sn,
      builder: (context, _) {
        context.watch<RegisterScreenNotifier>();

        return Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          appBar: AppBar(title: Text(S.current.signUp)),
          body: Container(
            child: ModalProgressHUD(
              inAsyncCall: sn.inAsyncCall,
              child: BlocListener<AccountCubit, AccountState>(
                bloc: BlocProvider.of<AccountCubit>(context),
                listener: (context, state) {
                  state.maybeWhen(
                    accountLoading: () => sn.inAsyncCall = true,
                    accountError: (error, callback) {
                      sn.inAsyncCall = false;
                      ErrorViewer.showError(
                        context: context,
                        error: error,
                        callback: callback,
                      );
                    },
                    registerLoaded: (data) {
                      sn.inAsyncCall = false;
                      showOtpDialog(
                        phoneNumber:
                            IqNumberInputFormatter.getIraqMobileNumberWithZero(
                              sn.phoneOrEmailController.text,
                            ),
                        otpRequestType: OtpRequestType.ConfirmLoginOrRegister,
                      );
                    },
                    orElse: () {},
                  );
                },
                child: _buildScreen(),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildScreen() {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 32),
          child: Form(
            key: sn.formKey,
            child: Column(
              children: <Widget>[
                SlidingAnimated(
                  initialOffsetX: 1,
                  intervalStart: 0,
                  intervalEnd: 0.1,
                  child: _buildNameField(),
                ),
                32.verticalSpace,
                SlidingAnimated(
                  initialOffsetX: 1,
                  intervalStart: 0.1,
                  intervalEnd: 0.2,
                  child: _buildLastNameField(),
                ),
                32.verticalSpace,
                SlidingAnimated(
                  initialOffsetX: 1,
                  intervalStart: 0.2,
                  intervalEnd: 0.4,
                  child: _buildPhoneField(),
                ),
                // 32.verticalSpace,
                // SlidingAnimated(
                //   initialOffsetX: 1,
                //   intervalStart: 0.4,
                //   intervalEnd: 0.6,
                //   child: _buildPasswordField(),
                // ),
                // 32.verticalSpace,
                // SlidingAnimated(
                //   initialOffsetX: 1,
                //   intervalStart: 0.6,
                //   intervalEnd: 0.8,
                //   child: _buildConfirmPasswordField(),
                // ),
                128.verticalSpace,
                SlidingAnimated(
                  initialOffsetX: 2,
                  intervalStart: 0.2,
                  intervalEnd: 1,
                  child: CustomButton(
                    backgroundColor: Colors.green,
                    child: Text(
                      S.current.signUp,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                    onPressed: () {
                      sn.sendRequest(context);
                    },
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNameField() {
    return TextFormField(
      key: sn.nameKey,
      controller: sn.nameController,
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.text,
      focusNode: sn.myFocusNodeName,
      decoration: InputDecoration(
        fillColor: AppColors.accentColorLight,
        labelText: S.current.firstName,
      ),
      validator: (value) {
        if (sn.turnNameValidate) {
          if (Validators.isValidName(value!))
            return null;
          else
            return S.current.errorEmptyField;
        } else
          return null;
      },
      onFieldSubmitted: (term) {
        sn.myFocusNodeLastName.requestFocus();
      },
      onChanged: (value) {
        if (sn.turnNameValidate) {
          sn.turnNameValidate = false;
          sn.nameKey.currentState!.validate();
        }
      },
    );
  }

  Widget _buildLastNameField() {
    return TextFormField(
      key: sn.lastNameKey,
      controller: sn.lastNameController,
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.text,
      focusNode: sn.myFocusNodeLastName,
      decoration: InputDecoration(
        fillColor: AppColors.accentColorLight,
        labelText: S.current.lastName,
      ),
      validator: (value) {
        if (sn.turnLastNameValidate) {
          if (Validators.isValidName(value!))
            return null;
          else
            return S.current.errorEmptyField;
        } else
          return null;
      },
      onFieldSubmitted: (term) {
        sn.myFocusNodePhoneOrEmail.requestFocus();
      },
      onChanged: (value) {
        if (sn.turnLastNameValidate) {
          sn.turnLastNameValidate = false;
          sn.lastNameKey.currentState!.validate();
        }
      },
    );
  }

  Widget _buildPhoneField() {
    return TextFormField(
      key: sn.phoneOrEmailKey,
      controller: sn.phoneOrEmailController,
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.phone,
      focusNode: sn.myFocusNodePhoneOrEmail,
      inputFormatters: [IqNumberInputFormatter()],
      maxLength: 12,
      decoration: InputDecoration(
        labelText: S.current.phone,
        fillColor: AppColors.accentColorLight,
        counterText: '',
      ),
      validator: (value) {
        if (Validators.isValidPhoneNumber(value!))
          return null;
        else
          return S.current.invalidPhoneNumber;
      },
      onFieldSubmitted: (term) {
        sn.myFocusNodePassword.requestFocus();
      },
      onChanged: (value) {
        if (sn.turnPhoneOrEmailValidate) {
          sn.turnPhoneOrEmailValidate = false;
          sn.phoneOrEmailKey.currentState!.validate();
        }
      },
    );
  }

  // _buildEmailField() {
  //   return MyTextFormField(
  //     color: AppColors.accentColorLight,
  //     formKey: _phoneOrEmailKey,
  //     controller: _phoneOrEmailController,
  //     textInputAction: TextInputAction.next,
  //     keyboardType: TextInputType.emailAddress,
  //     focusNode: myFocusNodePhoneOrEmail,
  //     labelText: S.current.label_email,
  //     validator: (value) {
  //       if (turnPhoneOrEmailValidate) {
  //         if (Validators.isValidEmail(value!))
  //           return null;
  //         else
  //           return S.current.error_inValid_email;
  //       } else
  //         return null;
  //     },
  //     onFieldSubmitted: (term) {
  //       fieldFocusChange(context, myFocusNodePhoneOrEmail, myFocusNodePassword);
  //     },
  //     onChanged: (value) {
  //       if (turnPhoneOrEmailValidate) {
  //         setState(() {
  //           turnPhoneOrEmailValidate = false;
  //         });
  //         _phoneOrEmailKey.currentState!.validate();
  //       }
  //     },
  //   );
  // }

  // Widget _buildPasswordField() {
  //   return TextFormField(
  //     key: sn.passwordKey,
  //     controller: sn.passwordController,
  //     textInputAction: TextInputAction.next,
  //     keyboardType: TextInputType.visiblePassword,
  //     focusNode: sn.myFocusNodePassword,
  //     decoration: InputDecoration(
  //       labelText: S.current.password,
  //       fillColor: AppColors.accentColorLight,
  //       suffixIcon: IconButton(
  //         icon: Icon(
  //           sn.passwordSecure ? Icons.visibility : Icons.visibility_off,
  //           color: AppColors.accentColorLight,
  //         ),
  //         onPressed: () {
  //           sn.passwordSecure = !sn.passwordSecure;
  //         },
  //       ),
  //     ),
  //     onFieldSubmitted: (term) {
  //       sn.myFocusNodeConfirmPassword.requestFocus();
  //     },
  //     validator: (value) {
  //       if (sn.turnPasswordValidate) {
  //         if (Validators.isValidPassword(value!))
  //           return null;
  //         else
  //           return S.current.invalidPassword;
  //       } else
  //         return null;
  //     },
  //     onChanged: (val) {
  //       if (sn.turnPasswordValidate) {
  //         sn.turnPasswordValidate = false;
  //         sn.passwordKey.currentState!.validate();
  //       }
  //     },
  //     obscureText: sn.passwordSecure,
  //   );
  // }

  // Widget _buildConfirmPasswordField() {
  //   return TextFormField(
  //     key: sn.confirmPasswordKey,
  //     controller: sn.confirmPasswordController,
  //     textInputAction: TextInputAction.go,
  //     keyboardType: TextInputType.visiblePassword,
  //     focusNode: sn.myFocusNodeConfirmPassword,
  //     decoration: InputDecoration(
  //       fillColor: AppColors.accentColorLight,
  //       labelText: S.current.confirmPassword,
  //       suffixIcon: IconButton(
  //         icon: Icon(
  //           sn.confirmPasswordSecure ? Icons.visibility : Icons.visibility_off,
  //           color: AppColors.accentColorLight,
  //         ),
  //         onPressed: () {
  //           sn.confirmPasswordSecure = !sn.confirmPasswordSecure;
  //         },
  //       ),
  //     ),
  //     validator: (value) {
  //       if (sn.passwordController.text == value)
  //         return null;
  //       else
  //         return S.current.invalidConfirmPassword;
  //     },
  //     onFieldSubmitted: (term) {
  //       sn.sendRequest(context);
  //     },
  //     onChanged: (value) {
  //       sn.passwordKey.currentState!.validate();
  //     },
  //     obscureText: sn.confirmPasswordSecure,
  //   );
  // }

  @override
  void dispose() {
    sn.closeNotifier();
    super.dispose();
  }
}
