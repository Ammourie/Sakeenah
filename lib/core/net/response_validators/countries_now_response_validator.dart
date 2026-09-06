import '../../common/type_validators.dart';
import '../../errors/app_errors.dart';
import 'response_validator.dart';

class CountriesNowResponseValidator extends ResponseValidator {
  @override
  void processData(dynamic data) {
    if (data is! Map) {
      error = const AppErrors.customError(message: 'Invalid response');
      errorMessage = 'Invalid response';
      return;
    }

    final hasError = boolV(data['error']);
    if (hasError) {
      final message = stringV(data['msg']);
      error = AppErrors.customError(
        message: message.isNotEmpty ? message : 'Invalid response',
      );
      errorMessage = message.isNotEmpty ? message : 'Invalid response';
    }
  }
}
