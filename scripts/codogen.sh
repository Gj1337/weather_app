#!/bin/bash

set -e

flutter pub get
dart run easy_localization:generate --source-dir ./assets/translations -o locale_keys.g.dart -f keys
dart run build_runner build --delete-conflicting-outputs