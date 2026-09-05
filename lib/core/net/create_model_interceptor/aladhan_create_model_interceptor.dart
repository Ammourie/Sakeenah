import 'create_model.interceptor.dart';

class AlAdhanCreateModelInterceptor extends CreateModelInterceptor {
  const AlAdhanCreateModelInterceptor();

  @override
  T getModel<T>(dynamic Function(dynamic) modelCreator, dynamic json) {
    return modelCreator(json['data']);
  }
}
