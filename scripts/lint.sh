#!/bin/bash

set -e

dart format --set-exit-if-changed .
dart analyze . 
dart run custom_lint