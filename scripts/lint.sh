#!/bin/bash

dart format --set-exit-if-changed .
dart analyze . 
dart run custom_lint