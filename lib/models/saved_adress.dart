class SavedAddress {
  final int id;
  final double lat;
  final double lng;
  final String fullAddress;
  final String street;
  final String suburb;
  final String city;
  final String state;
  final String country;
  final String created;

  SavedAddress({
    required this.id,
    required this.lat,
    required this.lng,
    required this.fullAddress,
    required this.street,
    required this.suburb,
    required this.city,
    required this.state,
    required this.country,
    required this.created,
  });
}
