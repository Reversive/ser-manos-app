<p align="center"> <img src="https://i.imgur.com/GgP7mZm.png" width=25%/></p>


## ⚙️ Building
To test the application, clone the project and then install all packages by running:
```
$> flutter pub get
```
After this, you need to let build runner auto-generate certain files by running the following command:
```
$> dart run build_runner watch -d
```

Depending on the target platform you want to test it, you need to provide a [Google API Key](https://console.cloud.google.com/google/maps-apis/credential),
for iOS create a file under `ios/Runner/APIKey.plist` with the following content:
```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
	<key>apiKey</key>
	<string>YOUR_KEY_HERE</string>
</dict>
</plist>
```
For Android create a file under `android/app/src/main/res/values/keys.xml` with the following content:
```xml
<?xml version="1.0" encoding="utf-8"?>
<resources>
    <string name="google_maps_key" translatable="false" templateMergeStrategy="preserve">
        YOUR_KEY_HERE
    </string>
</resources>
```

Now you are good to go, just run the following command:
```
$> flutter run
```
## 📦 Flutter packages
- **intl** and **flutter_localizations** - Handles i18n and formatting (specifically date picker formatting)
- **google_maps_flutter** - Used to display the location card and the volunteering maps screen
- **geolocator** - Used to gather the current coordinates of the user to sort volunteerings based off distance
- **carousel_slider** - Used to display the carousel in the volunteering maps screen
- **widget_to_marker** - Used to create custom google maps markers
- **beamer** - Used to enable declarative navigation throughout the whole application
- **flutter_hooks** and **flutter_riverpod** (with **riverpod_generator** and **hooks_riverpod**) - Used to facilitate state management with reusable hooks
- **firebase_core**, **firebase_auth**, **firebase_storage**, **cloud_firestore**, **firebase_remote_config**, **firebase_analytics**, and **firebase_crashlytics** - Used for backend services for user authentication, data storage, configuration, analytics, and crash reporting
- **freezed_annotation**, **freezed**, **json_annotation**, and **json_serializable** - Used to streamline data modeling and serialization, making it easier to handle JSON data
- **image_picker** and **share_plus** - Used to enable media integration and sharing features
- **url_launcher** - Used to launch external URLs directly from the app (google maps deeplink)
## 🔀 Flows
#### Sign up
<p align="center"><img src="https://i.imgur.com/qYz0G8n.png"> </p>


#### Sign in
<p align="center"><img src="https://i.imgur.com/Dgk3BtP.png"> </p>


#### Apply to volunteering
<p align="center"><img src="https://i.imgur.com/UU49EsP.png"> </p>

#### Get volunteerings
<p align="center"><img src="https://i.imgur.com/spRLSY7.png"> </p>

#### Get vacancies (streamed)
<p align="center"><img src="https://i.imgur.com/VjbDDyH.png"> </p>

#### Get news
<p align="center"><img src="https://i.imgur.com/o0Ursdf.png"> </p>


## 📊 Event Monitoring
### Feature-flagging
### A/B Testing

## 🎯 Testing
To execute tests, run the following command in the root of the project:
```
flutter test
```
If you do not possess the golden test files, append `--update-goldens` to the above command
