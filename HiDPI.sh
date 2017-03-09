#!/bin/sh
PID=`ioreg -l | grep "DisplayProductID" | sed 's/.*= //g' | head -n 1`
VID=`ioreg -l | grep "DisplayVendorID" | sed 's/.*= //g' | head -n 1`
FOLDER=DisplayVendorID-`echo "obase=16; ${VID}" | bc`
mkdir -p ${FOLDER}
cat > ${FOLDER}/DisplayProductID-`echo "obase=16; ${PID}" | bc` <<EOF
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
  <key>DisplayProductName</key>
  <string>My Monitor</string>
  <key>DisplayProductID</key>
  <integer>${PID}</integer>
  <key>DisplayVendorID</key>
  <integer>${VID}</integer>
  <key>scale-resolutions</key>
  <array>
    <data>AAAKAAAABaAAAAABACAAAA==</data>
    <data>AAAFAAAAAtAAAAABACAAAA==</data>
    <data>AAAPAAAACHAAAAABACAAAA==</data>
    <data>AAAHgAAABDgAAAABACAAAA==</data>
    <data>AAAMgAAABwgAAAABACAAAA==</data>
    <data>AAAGQAAAA4QAAAABACAAAA==</data>
    <data>AAAKAgAABaAAAAABACAAAA==</data>
    <data>AAAKrAAABgAAAAABACAAAA==</data>
    <data>AAAFVgAAAwAAAAABACAAAA==</data>
  </array>
</dict>
</plist>
EOF
