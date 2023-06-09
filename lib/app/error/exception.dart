class LocationException implements Exception {
  String cause;
  LocationException(this.cause);

  @override
  String toString() {
    return cause;
  }
}

class LocationPermissionException implements Exception {
  String cause;
  LocationPermissionException(this.cause);
  @override
  String toString() {
    return cause;
  }
}
