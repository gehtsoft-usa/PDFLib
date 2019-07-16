#!/bin/bash

COL_RED="\x1b[31;01m"
COL_GREEN="\x1b[32;01m"
COL_BLUE="\x1b[34;01m"
COL_YELLOW="\x1b[33;01m"
COL_RESET="\x1b[39;49;00m"

THIS_DIR=`pwd`
BUILD_TYPE=Release
IOS_DIR=$PWD/ios

function catch_error() {
     echo -e $COL_RED"An error has occured! Script execution stopped."$COL_RESET
     echo -e $COL_BLUE"Error desription:"$COL_RESET" "$1
     exit 1
}

echo -e $COL_BLUE"Building Haru for iOS"$COL_RESET

rm -rf $IOS_DIR/iPhone
rm -rf $IOS_DIR/iPhone32
rm -rf $IOS_DIR/iPhoneSimulator32
rm -rf $IOS_DIR/iPhoneSimulator
rm -rf $IOS_DIR/snapshot

mkdir -p $IOS_DIR/iPhone/lib
mkdir -p $IOS_DIR/iPhone32/lib
mkdir -p $IOS_DIR/iPhoneSimulator32/lib
mkdir -p $IOS_DIR/iPhoneSimulator/lib

chmod +x $IOS_DIR/configure-iphone-simulator
chmod +x $IOS_DIR/configure-iphone

# iPhone simulator 32bit

echo -e $COL_BLUE"Building Haru for iOS simulator 32bit..."$COL_RESET

$IOS_DIR/configure-iphone-simulator iOS32
cmake . -DCMAKE_BUILD_TYPE=$BUILD_TYPE -DMOBILE_CROSS=YES
make clean && make -j4 || catch_error

cp libharu23.a $IOS_DIR/iPhoneSimulator32/lib
rm libharu23.a

# iPhone simulator 64bit

echo -e $COL_BLUE"Building Haru for iOS  simulator 64bit..."$COL_RESET

$IOS_DIR/configure-iphone-simulator iOS
cmake . -DCMAKE_BUILD_TYPE=$BUILD_TYPE -DMOBILE_CROSS=YES
make clean  && make -j4 || catch_error

cp libharu23.a $IOS_DIR/iPhoneSimulator/lib
rm libharu23.a

# iPhone 32bit

echo -e $COL_BLUE"Building Haru for iOS 32bit..."$COL_RESET

$IOS_DIR/configure-iphone iOS32
cmake . -DCMAKE_BUILD_TYPE=$BUILD_TYPE -DMOBILE_CROSS=YES
make clean && make -j4 || catch_error

cp libharu23.a $IOS_DIR/iPhone32/lib
rm libharu23.a

# iPhone 64bit

echo -e $COL_BLUE"Building Haru for iOS 64bit..."$COL_RESET

$IOS_DIR/configure-iphone iOS
cmake . -DCMAKE_BUILD_TYPE=$BUILD_TYPE -DMOBILE_CROSS=YES
make clean && make -j4 || catch_error

cp libharu23.a $IOS_DIR/iPhone/lib
rm libharu23.a

# building universal framework

echo -e $COL_BLUE"building universal Haru framework"$COL_RESET

IPHONEDIR32=$IOS_DIR/iPhone32/lib
SIMULATORDIR32=$IOS_DIR/iPhoneSimulator32/lib
IPHONEDIR=$IOS_DIR/iPhone/lib
SIMULATORDIR=$IOS_DIR/iPhoneSimulator/lib
SNAPSHOTDIR=$IOS_DIR/snapshot/lib

FRAMEWORK_NAME=Haru
FRAMEWORK_BUILD_PATH=$IOS_DIR/snapshot
FW_VERSION=1.0

cd $SIMULATORDIR32
rm -f *.o*

for f in $( ls *.a ); do
ar x $f
done
ar rcs $FRAMEWORK_NAME *.o*

cd $SIMULATORDIR
rm -f *.o*

for f in $( ls *.a ); do
ar x $f
done
ar rcs $FRAMEWORK_NAME *.o*

cd $IPHONEDIR32
rm -f *.o*

for f in $( ls *.a ); do
ar x $f
done
ar rcs $FRAMEWORK_NAME *.o*

cd $IPHONEDIR
rm -f *.o*

for f in $( ls *.a ); do
ar x $f
done
ar rcs $FRAMEWORK_NAME *.o*

cd $THIS_DIR

if ! [ -e $SNAPSHOTDIR ]
then
   mkdir -p $SNAPSHOTDIR
fi

xcrun -sdk iphoneos lipo -create -arch armv7 $IPHONEDIR32/$FRAMEWORK_NAME -arch arm64 $IPHONEDIR/$FRAMEWORK_NAME -arch i386 $SIMULATORDIR32/$FRAMEWORK_NAME -arch x86_64 $SIMULATORDIR/$FRAMEWORK_NAME -output $SNAPSHOTDIR/$FRAMEWORK_NAME

# these never change
FRAMEWORK_VERSION=A
FRAMEWORK_CURRENT_VERSION=1
FRAMEWORK_COMPATIBILITY_VERSION=1

# Clean any existing framework that might be there
if [ -d "$FRAMEWORK_BUILD_PATH" ]
then
echo "Framework: Cleaning framework..."
rm -rf "$FRAMEWORK_BUILD_PATH/$FRAMEWORK_NAME.framework"
fi

# Build the canonical Framework bundle directory structure
echo "Framework: Setting up directories..."
FRAMEWORK_DIR=$FRAMEWORK_BUILD_PATH/$FRAMEWORK_NAME.framework
mkdir -p $FRAMEWORK_DIR
mkdir -p $FRAMEWORK_DIR/Versions
mkdir -p $FRAMEWORK_DIR/Versions/$FRAMEWORK_VERSION
mkdir -p $FRAMEWORK_DIR/Versions/$FRAMEWORK_VERSION/Resources
mkdir -p $FRAMEWORK_DIR/Versions/$FRAMEWORK_VERSION/Headers

echo "Framework: Creating symlinks..."
ln -s $FRAMEWORK_VERSION $FRAMEWORK_DIR/Versions/Current
ln -s Versions/Current/Headers $FRAMEWORK_DIR/Headers
ln -s Versions/Current/Resources $FRAMEWORK_DIR/Resources
ln -s Versions/Current/$FRAMEWORK_NAME $FRAMEWORK_DIR/$FRAMEWORK_NAME

# combine lib files for various platforms into one
echo "Framework: Creating library..."
cp $SNAPSHOTDIR/$FRAMEWORK_NAME "$FRAMEWORK_DIR/Versions/Current/$FRAMEWORK_NAME"

echo "Framework: Copying assets into current version..."
cp -R $THIS_DIR/src/libharu/*.h $FRAMEWORK_DIR/Headers/

cp "$IOS_DIR/Framework.plist" $FRAMEWORK_DIR/Resources/Info.plist

echo "Framework: Packing..."

cd $IOS_DIR/snapshot

tar -cvzf Haru-${FW_VERSION}-iOS.tar.gz $FRAMEWORK_NAME.framework

mv  $SNAPSHOTDIR/$FRAMEWORK_NAME $SNAPSHOTDIR/libharu23.a

echo -e $COL_GREEN"=========================================================="
echo -e "Framework is created successfully. Build duration: $SECONDS sec.\n"$COL_RESET
