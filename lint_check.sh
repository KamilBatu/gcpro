#!/bin/bash
echo "Running Dart analyzer..."
flutter analyze

if [ $? -ne 0 ]; then
  echo "❌ Linting failed. Please fix the issues above."
  exit 1
else
  echo "✅ Linting passed."
fi
