enum UserType {
  admin(1),
  customers(2),
  none(-1);

  final int mapToInt;

  const UserType(this.mapToInt);

  static UserType mapToType(int? v) {
    switch (v) {
      case 1:
        return UserType.admin;
      case 2:
        return UserType.customers;
      default:
        return UserType.none;
    }
  }
}
