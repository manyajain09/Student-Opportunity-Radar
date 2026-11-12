#!/bin/sh
# Compile and run Student Opportunity Radar (needs JDK 11+)
cd "$(dirname "$0")"
mkdir -p out
javac -encoding UTF-8 -d out $(find src -name "*.java") || exit 1
java -cp out com.radar.Main
