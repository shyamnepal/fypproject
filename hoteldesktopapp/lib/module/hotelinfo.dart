class modelHotelInfo {
  final hotelName;
  final zipCode;
  final city;
  final state;
  final hotel_location;

  modelHotelInfo(
      {this.hotelName,
      this.zipCode,
      this.city,
      this.state,
      this.hotel_location});

  factory modelHotelInfo.fromJson(Map<String, dynamic> json) {
    return modelHotelInfo(
      hotelName: json['hotelName'],
      zipCode: json['zipCode'],
      city: json['city'],
      state: json['state'],
      hotel_location: ['hotel_location'],
    );
  }
  Map<String, dynamic> toJson() => {
        'hotelName': hotelName,
        'zipCode': zipCode,
        'city': city,
        'state': state,
        'hotel_location': hotel_location,
      };
}
