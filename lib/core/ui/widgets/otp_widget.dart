import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../generated/l10n.dart';
import '../../constants/app/app_constants.dart';

class OTPWidget extends StatefulWidget {
  final String title;
  final Function(String) onChangeCode;
  final Function() onResendCodeTap;
  final Function() onConfirmButtonTap;

  OTPWidget({
    Key? key,
    required this.title,
    required this.onChangeCode,
    required this.onResendCodeTap,
    required this.onConfirmButtonTap,
  }) : super(key: key);

  @override
  State<OTPWidget> createState() => _OTPWidgetState();
}

class _OTPWidgetState extends State<OTPWidget> {
  final _pinCodeController = PinInputController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // verification text
        _buildVerificationText(),
        22.verticalSpace,

        // enter code text
        Align(alignment: Alignment.center, child: _buildEnterCodeText()),
        67.verticalSpace,

        // pin code
        _buildPinCodeTextField(context),
        31.verticalSpace,

        // confirm button
        _buildConfirmButton(),
        100.verticalSpace,

        // didn't recieve code text
        Align(
          alignment: Alignment.center,
          child: _buildDidnotRecieveCodeText(),
        ),
        25.verticalSpace,

        // resend code
        Align(alignment: Alignment.center, child: _buildResendCodeText()),
      ],
    );
  }

  Text _buildVerificationText() {
    return Text(
      S.current.otpVerification,
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 55.sp),
    );
  }

  Text _buildEnterCodeText() {
    return Text(widget.title, textAlign: TextAlign.center);
  }

  Text _buildDidnotRecieveCodeText() {
    return Text(
      S.current.didnotReceiveAnyCode,
      style: TextStyle(fontSize: 40.sp, color: Colors.grey.shade500),
    );
  }

  Text _buildResendCodeText() {
    return Text.rich(
      TextSpan(
        text: S.current.resendCode,
        recognizer: TapGestureRecognizer()..onTap = widget.onResendCodeTap,
      ),
      style: TextStyle(fontSize: 40.sp, decoration: TextDecoration.underline),
    );
  }

  MaterialPinField _buildPinCodeTextField(BuildContext context) {
    return MaterialPinField(
      autoFocus: true,
      keyboardType: TextInputType.number,
      pinController: _pinCodeController,
      length: AppConstants.OTP_LENGTH,
      theme: MaterialPinTheme(
        entryAnimation: MaterialPinAnimation.fade,
        shape: MaterialPinShape.underlined,
        borderColor: Colors.grey.shade200,
        filledBorderColor: Theme.of(context).colorScheme.primary,
        focusedBorderColor: Theme.of(
          context,
        ).colorScheme.primary.withValues(alpha: .2),
      ),
      onChanged: widget.onChangeCode,
      errorBuilder: (errorText) {
        return Padding(
          padding: const EdgeInsets.all(12),
          child: Text(
            errorText ?? '',
            style: TextStyle(color: Colors.red, fontSize: 24.sp),
          ),
        );
      },

      onCompleted: (_) => widget.onConfirmButtonTap(),
    );
  }

  Widget _buildConfirmButton() {
    return Ink(
      width: 1.0.sw,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.blue, Colors.blue.shade900],
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.blue.shade200,
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: InkWell(
        onTap: widget.onConfirmButtonTap,
        splashColor: Colors.white30,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Text(
            S.current.confirm.toUpperCase(),
            style: const TextStyle(
              color: Colors.white,
              letterSpacing: 1.5,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _pinCodeController.dispose();
    super.dispose();
  }
}
