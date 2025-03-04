
import '../repository/mock/mock_location_repository.dart';
import '../service/locations_service.dart';

void main() {

  // Initialize LocationService with Mock Repository
  LocationsService().initialize(MockLocationRepository());

 // Test 
 print(LocationsService().getLocations());

  
}