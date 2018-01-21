#!/bin/bash
#script to build losos automagically for all devices
#run from root dir of sources
cp losos/.repo/local_manifests/roomservice.xml .repo/local_manifests/roomservice.xml
./repo sync
cp -r losos/* ./
rm -r losos/packages/apps/*/Android.mk
rm -r out/target/product/*/*.zip
brunch d855
brunch d850
brunch d851
brunch d852
brunch vs985
brunch ls990
brunch f400
