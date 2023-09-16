class AddAddress {
  late String governorate;
  late String governorateId;

  late String region;
  late String regionId;

  late String street;
  late String houseNumber;
  late String adsress;
  late double lat;
  late double lng;

  AddAddress({
    required this.governorate,
    required this.governorateId,
    required this.region,
    required this.regionId,
    required this.street,
    required this.houseNumber,
    required this.adsress,
  });
}
