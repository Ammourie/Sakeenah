import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../features/more/data/request/param/report_problem_param.dart';
import '../../../../features/more/presentation/state_m/cubit/more_cubit.dart';
import '../../../../generated/l10n.dart';
import '../../../constants/app/app_constants.dart';
import '../../widgets/waiting_widget.dart';
import '../error_viewer/error_viewer.dart';
import '../errors_screens/build_error_screen.dart';
import '../errors_screens/error_widget.dart';

class GlobalErrorWidget extends StatefulWidget {
  const GlobalErrorWidget({
    required this.flutterErrorDetails,
  });

  final FlutterErrorDetails flutterErrorDetails;

  @override
  State<GlobalErrorWidget> createState() => _GlobalErrorWidgetState();
}

class _GlobalErrorWidgetState extends State<GlobalErrorWidget> {
  final MoreCubit _cubit = MoreCubit();

  @override
  Widget build(BuildContext context) {
    return _buildGlobalErrorWidget(context);
  }

  Column _buildGlobalErrorWidget(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        buildErrorScreen(
          disableRetryButton: true,
          title: S.of(context).errorOccurred,
          content: S.current.reportError,
          imageUrl: AppConstants.ERROR_UNKNOWING,
          callback: null,
          context: context,
        ),
        BlocConsumer<MoreCubit, MoreState>(
          bloc: _cubit,
          builder: (context, state) {
            return state.maybeWhen(
              orElse: () => const ScreenNotImplementedErrorWidget(),
              moreInit: () => _buildButton(context),
              moreLoading: () => const WaitingWidget(),
              moreError: (error, callback) => _buildButton(context),
              successReportProblem: () => _buildSuccessReport(),
            );
          },
          listener: (BuildContext context, MoreState state) {
            state.maybeWhen(
              orElse: () {},
              moreError: (error, callback) => ErrorViewer.showError(
                context: context,
                error: error,
                callback: callback,
              ),
            );
          },
        ),
      ],
    );
  }

  Row _buildSuccessReport() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          S.current.thankYouForReporting,
        ),
        4.horizontalSpace,
        Icon(Icons.check_circle_outline, color: Colors.teal, size: 20.sp)
      ],
    );
  }

  ElevatedButton _buildButton(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Theme.of(context).primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6.r),
        ),
      ),
      child: Text(
        S.current.send,
        style: const TextStyle(color: Colors.white),
      ),
      onPressed: () {
        _cubit.reportProblem(
          ReportProblemParam(
            errorMessage: widget.flutterErrorDetails.exception.toString(),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _cubit.close();
    super.dispose();
  }
}
