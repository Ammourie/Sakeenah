import 'package:flutter/foundation.dart';

import '../../features/account/domain/entity/profile_entity.dart';

class SessionData extends ChangeNotifier {
  ProfileEntity? profile;
}
