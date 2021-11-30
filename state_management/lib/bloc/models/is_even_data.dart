class IsEvenData {
  late bool _isEven;
  late String _ad;

  bool get isEven => _isEven;
  String get ad => _ad;

  IsEvenData.fromJson(Map<String, dynamic> parsedJson) {
    _isEven = parsedJson['iseven'];
    _ad = parsedJson['ad'];
  }
}
