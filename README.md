# Current Weather Application

App is based on Stacked Architecture
with the Model-View-ViewModel (MVVM) architectural pattern

## App has the following features:
User localization:
- Retrieve the user's location.
- Weather retrieval based on position (latitude, longitude) and day:
- Retrieve the temperature.
- Retrieve the wind speed.
- Retrieve any other necessary weather information.

## Used libraries:
- stacked (state management, navigation, dialogs, MVVM, reactive services,...).
- flex_color_scheme for theming.
- geolocator for retrieving current user location and setup permissions.
- retrofit HTTP client.
- mockito for mocking in tests.

## Api for weather data:
https://api.openweathermap.org