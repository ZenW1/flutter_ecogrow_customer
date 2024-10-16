
#!/bin/bash

# fvm checkout
fvm use 3.19.4

# Get packages
fvm flutter pub get

# Build the app
fvm flutter build apk --release --flavor development --target lib/main_development.dart

# exit with success status
exit 0
