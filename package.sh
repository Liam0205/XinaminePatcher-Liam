#!/usr/bin/env package_deb()
set -eux

NEW="$1"
package_name=$(grep Package: "$NEW"/DEBIAN/control | cut -f2 -d ' ')
version=$(grep Version: "$NEW"/DEBIAN/control | cut -f2 -d ' ')
architecture=$(grep Architecture: "$NEW"/DEBIAN/control | cut -f2 -d ' ')
dpkg-deb -b "$NEW" "./${package_name}_${version}_${architecture}.deb"

