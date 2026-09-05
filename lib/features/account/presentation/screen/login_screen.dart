import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

import '../../../../core/common/responsive/responsive_utils.dart';
import '../../../../core/common/text_formatters/iq_number_formatter.dart';
import '../../../../core/common/validators.dart';
import '../../../../core/constants/enums/otp_request_type.dart';
import '../../../../core/navigation/nav.dart';
import '../../../../core/ui/dialogs/otp_dialog.dart';
import '../../../../core/ui/error_ui/error_viewer/error_viewer.dart';
import '../../../../core/ui/screens/base_screen.dart';
import '../../../../core/ui/show_toast.dart';
import '../../../../core/ui/widgets/custom_button.dart';
import '../../../../generated/l10n.dart';
import '../state_m/cubit/account_cubit.dart';
import '../state_m/provider/login_screen_notifier.dart';
import 'register_screen.dart';

class LoginScreenParam {}

class LoginScreen extends BaseScreen<LoginScreenParam> {
  static const routeName = "/LoginScreen";

  LoginScreen({required LoginScreenParam param, Key? key})
    : super(param: param, key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late final LoginScreenNotifier sn;

  @override
  void initState() {
    super.initState();
    sn = LoginScreenNotifier(widget.param);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: sn,
      builder: (context, _) {
        context.watch<LoginScreenNotifier>();

        return Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          body: ModalProgressHUD(
            inAsyncCall: sn.inAsyncCall,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: BlocListener<AccountCubit, AccountState>(
                bloc: BlocProvider.of<AccountCubit>(context),
                listener: (context, state) {
                  state.maybeWhen(
                    accountInit: () {},
                    accountLoading: () => sn.inAsyncCall = true,
                    loginLoaded: (data) {
                      sn.inAsyncCall = false;

                      if (data.isUserExist) {
                        showOtpDialog(
                          otpRequestType: OtpRequestType.ConfirmLoginOrRegister,
                          phoneNumber:
                              IqNumberInputFormatter.getIraqMobileNumberWithZero(
                                sn.phoneOrEmailController.text,
                              ),
                        );
                      } else {
                        showToast(S.current.userDoesNotExist);
                      }
                    },
                    registerLoaded: (_) {},
                    accountError: (error, callback) {
                      sn.inAsyncCall = false;

                      return ErrorViewer.showError(
                        context: context,
                        error: error,
                        callback: callback,
                      );
                    },
                    successLogout: () {},
                    orElse: () {},
                  );
                },
                child: Container(
                  height: ScreenUtil().screenHeight,
                  width: ScreenUtil().screenWidth,
                  child: getValueForOrientation(
                    context,
                    portrait: _buildPortrait(),
                    landscape: _buildLandscape(),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildPortrait() {
    return Container(
      height: ScreenUtil().screenHeight,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          64.verticalSpace,
          Text(
            S.current.welcome,
            style: Theme.of(context).textTheme.bodyLarge!,
          ),
          64.verticalSpace,
          _buildPhoneNumberField(),
          32.verticalSpace,
          // _buildPasswordField(),
          64.verticalSpace,
          _buildButtons(),
        ],
      ),
    );
  }

  Widget _buildLandscape() {
    return Row(
      children: [
        Container(
          width: 1.w * 0.6,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                S.current.welcome,
                style: Theme.of(context).textTheme.bodyLarge!,
              ),
              32.verticalSpace,
              _buildPhoneNumberField(),
              32.verticalSpace,
              // _buildPasswordField(),
            ],
          ),
        ),
        32.horizontalSpace,
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            64.verticalSpace,
            CustomButton(
              backgroundColor: Colors.green,
              child: Text(
                S.current.login,
                style: const TextStyle(color: Colors.black),
              ),
              onPressed: () => sn.sendRequest(context),
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            ),
            12.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  S.current.or,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ],
            ),
            32.verticalSpace,
            CustomButton(
              backgroundColor: Theme.of(context).colorScheme.primary,
              child: Text(
                S.current.signUp,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
              onPressed: () {
                sn.unFocus(context);
                Nav.to(
                  RegisterScreen.routeName,
                  arguments: RegisterScreenParam(),
                );
              },
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildPhoneNumberField() {
    return TextFormField(
      key: sn.phoneOrEmailKey,
      controller: sn.phoneOrEmailController,
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.phone,
      focusNode: sn.myFocusNodeUserName,
      maxLength: 12,
      decoration: InputDecoration(labelText: S.current.phone, counterText: ''),
      inputFormatters: [IqNumberInputFormatter()],
      validator: (value) {
        if (sn.turnPhoneOrEmailValidate) {
          if (Validators.isValidPhoneNumber(value!))
            return null;
          else
            return S.current.invalidPhoneNumber;
        } else
          return null;
      },
      onFieldSubmitted: (term) {
        sn.myFocusNodePassword.requestFocus();
      },
      onChanged: (val) {
        if (sn.turnPhoneOrEmailValidate) {
          sn.turnPhoneOrEmailValidate = false;
          sn.phoneOrEmailKey.currentState!.validate();
        }
      },
    );
  }

  // Widget _buildPasswordField() {
  //   return TextFormField(
  //     key: sn.passwordKey,
  //     controller: sn.passwordController,
  //     textInputAction: TextInputAction.go,
  //     keyboardType: TextInputType.text,
  //     focusNode: sn.myFocusNodePassword,
  //     decoration: InputDecoration(
  //       labelText: S.current.password,
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
  //     validator: (value) {
  //       if (sn.turnPasswordValidate) {
  //         if (Validators.isValidPassword(value!))
  //           return null;
  //         else
  //           return S.current.invalidPassword;
  //       } else
  //         return null;
  //     },
  //     onFieldSubmitted: (term) => sn.sendRequest(context),
  //     onChanged: (val) {
  //       if (sn.turnPasswordValidate) {
  //         sn.turnPasswordValidate = false;
  //         sn.passwordKey.currentState!.validate();
  //       }
  //     },
  //     obscureText: sn.passwordSecure,
  //   );
  // }

  Widget _buildButtons() {
    return Column(
      children: [
        CustomButton(
          backgroundColor: Colors.green,
          child: Text(
            S.current.login,
            style: const TextStyle(color: Colors.black),
          ),
          onPressed: () => sn.sendRequest(context),
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        ),
        32.verticalSpace,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              S.current.or,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: Theme.of(context).primaryColor,
              ),
            ),
          ],
        ),
        32.verticalSpace,
        CustomButton(
          backgroundColor: Theme.of(context).colorScheme.primary,
          child: Text(
            S.current.signUp,
            style: const TextStyle(color: Colors.black),
          ),
          onPressed: () {
            sn.unFocus(context);
            Nav.to(RegisterScreen.routeName, arguments: RegisterScreenParam());
          },
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        ),
      ],
    );
  }

  @override
  void dispose() {
    sn.closeNotifier();
    super.dispose();
  }
}
