import 'create_model.interceptor.dart';

class GeoNamesCreateModelInterceptor extends CreateModelInterceptor {
  const GeoNamesCreateModelInterceptor();

  @override
  T getModel<T>(dynamic Function(dynamic) modelCreator, dynamic json) {
    return modelCreator(json['geonames']);
  }
}
