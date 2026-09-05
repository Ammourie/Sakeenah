import '../../common/type_validators.dart';
import '../../errors/app_errors.dart';
import 'response_validator.dart';

class AlAdhanResponseValidator extends ResponseValidator {
  @override
  void processData(dynamic data) {
    if (data is! Map) {
      error = const AppErrors.customError(message: 'Invalid response');
      errorMessage = 'Invalid response';
      return;
    }

    final code = data['code'];
    final status = stringV(data['status']);
    final isOk = code == 200 || code == '200' || status == 'OK';

    if (!isOk) {
      final message = status.isNotEmpty ? status : 'Invalid response';
      error = AppErrors.customError(message: message);
      errorMessage = message;
    }
  }
}
