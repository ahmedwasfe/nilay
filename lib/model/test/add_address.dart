class AddAddress {
  late String governorate;
  late int governorateId;

  late String region;
  late int regionId;

  late String street;
  late String houseNumber;
  late String address;
  late double lat;
  late double lng;

  AddAddress({
    required this.governorate,
    required this.governorateId,
    required this.region,
    required this.regionId,
    required this.street,
    required this.houseNumber,
    required this.address,
  });
}
