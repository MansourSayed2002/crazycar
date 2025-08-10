class TripModel {
  final int? id;
  final int? driverId;
  final int? riderId;
  final String? pickUPLocation;
  final String? dropOffLocation;
  final String? pickUPaddress;
  final String? dropOffaddress;
  final String? tripPrice;
  final String? startTime;
  final String? endTime;
  final String? status;

  TripModel({
    this.pickUPLocation,
    this.dropOffLocation,
    this.pickUPaddress,
    this.dropOffaddress,
    this.tripPrice,
    this.startTime,
    this.endTime,
    this.id,
    this.driverId,
    this.riderId,
    this.status,
  });

  factory TripModel.fromJson(Map<String, dynamic> json) {
    return TripModel(
      id: json['id'],
      driverId: json['trips_driver'],
      riderId: json['trips_rider'],
      pickUPLocation: json['trips_pickup_location'],
      dropOffLocation: json['trips_dropoff_location'],
      pickUPaddress: json['trips_pickup_address'],
      dropOffaddress: json['trips_dropoff_address'],
      tripPrice: json['trips_price'],
      startTime: json['trips_start_time'],
      endTime: json['trips_end_time'],
      status: json['trips_status'],
    );
  }

  toJson() {
    return {
      "id": id,
      "trips_driver": driverId,
      "trips_rider": riderId,
      "trips_pickup_location": pickUPLocation,
      "trips_dropoff_location": dropOffLocation,
      "trips_pickup_address": pickUPaddress,
      "trips_dropoff_address": dropOffaddress,
      "trips_price": tripPrice,
      "trips_start_time": startTime,
      "trips_end_time": endTime,
      "trips_status": status,
    };
  }
}
