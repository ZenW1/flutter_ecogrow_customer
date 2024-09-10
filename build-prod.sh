#!/bin/bash

# fvm checkout
fvm use 3.19.4

# Get packages
fvm flutter pub get

# Build the app
fvm flutter build apk --release --flavor production --target-platform android-arm,android-arm64,android-x64 lib/main_production.dart

# exit with success status
exit 0
