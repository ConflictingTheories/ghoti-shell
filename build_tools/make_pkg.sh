#!/usr/bin/env bash

# Script to produce an OS X installer .pkg and .app(.zip)

VERSION=$(git describe --always --dirty 2>/dev/null)
if test -z "$VERSION" ; then
  echo "Could not get version from git"
  if test -f version; then
    VERSION=$(cat version)
  fi
fi

echo "Version is $VERSION"

set -x

#Exit on error
set -e

# Respect MAC_CODESIGN_ID and MAC_PRODUCTSIGN_ID, or default for ad-hoc.
# Note the :- means "or default" and the following - is the value.
MAC_CODESIGN_ID=${MAC_CODESIGN_ID:--}
MAC_PRODUCTSIGN_ID=${MAC_PRODUCTSIGN_ID:--}

PKGDIR=$(mktemp -d)

SRC_DIR=$PWD
OUTPUT_PATH=${ghoti_ARTEFACT_PATH:-~/ghoti_built}

mkdir -p "$PKGDIR/build" "$PKGDIR/root" "$PKGDIR/intermediates" "$PKGDIR/dst"
{ cd "$PKGDIR/build" && cmake -DMAC_INJECT_GET_TASK_ALLOW=OFF -DCMAKE_BUILD_TYPE=RelWithDebInfo -DMAC_CODESIGN_ID="${MAC_CODESIGN_ID}" "$SRC_DIR" && make -j 12 && env DESTDIR="$PKGDIR/root/" make install; }
pkgbuild --scripts "$SRC_DIR/build_tools/osx_package_scripts" --root "$PKGDIR/root/" --identifier 'com.ridiculousghoti.ghoti-shell-pkg' --version "$VERSION" "$PKGDIR/intermediates/ghoti.pkg"
productbuild  --package-path "$PKGDIR/intermediates" --distribution "$SRC_DIR/build_tools/osx_distribution.xml" --resources "$SRC_DIR/build_tools/osx_package_resources/" "$OUTPUT_PATH/ghoti-$VERSION.pkg"
productsign --sign "${MAC_PRODUCTSIGN_ID}" "$OUTPUT_PATH/ghoti-$VERSION.pkg" "$OUTPUT_PATH/ghoti-$VERSION-signed.pkg" && mv "$OUTPUT_PATH/ghoti-$VERSION-signed.pkg" "$OUTPUT_PATH/ghoti-$VERSION.pkg"

# Make the app
{ cd "$PKGDIR/build" && make signed_ghoti_macapp && zip -r "$OUTPUT_PATH/ghoti-$VERSION.app.zip" ghoti.app; }

rm -r "$PKGDIR"
