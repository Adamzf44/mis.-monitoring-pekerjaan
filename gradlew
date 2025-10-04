#!/bin/sh
# Minimal gradlew script placeholder that attempts to use included wrapper jar if present.
# If gradle-wrapper.jar is missing, this script will fall back to system 'gradle' if available.
DIR="$(cd "$(dirname "$0")" && pwd)"
if [ -f "$DIR/gradle/wrapper/gradle-wrapper.jar" ]; then
  java -jar "$DIR/gradle/wrapper/gradle-wrapper.jar" "$@"
else
  echo "gradle-wrapper.jar not found. Trying system 'gradle' command..."
  exec gradle "$@"
fi
