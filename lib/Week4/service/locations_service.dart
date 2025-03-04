import '../../Week4/model/ride/locations.dart';

import '../dummy_data/dummy_data.dart';
import '../repository/location_repository.dart';

////
///   This service handles:
///   - The list of available rides
///
class LocationsService {

  static const List<Location> availableLocations = fakeLocations; 
  static final LocationsService _instance = LocationsService._internal();
  late LocationRepository _locationRepository;
  // private constructor 
  LocationsService._internal();

  // static method to access the signle instance 
  factory LocationsService() {
    return _instance;
  }
  // initialize method to set the repository
  void initialize(LocationRepository locationRepository) {
    _locationRepository = locationRepository;
  }
  // Method to get the location from repository
  List<Location> getLocations() {
    return _locationRepository.getLocations();
  }
  
  
 
 
}