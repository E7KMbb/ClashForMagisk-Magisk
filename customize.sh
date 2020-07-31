SKIPUNZIP=1
RIRU_PATH="/data/misc/riru"
DATA_DIR=/sdcard/Android/data/com.github.kr328.clash
GeoIP=/sdcard/Android/data/com.github.kr328.clash/Country.mmdb
official_clash_link="https://github.com/Dreamacro/clash/releases"
latest_version=`curl -k -s -I "${official_clash_link}/latest" | grep -i location | grep -o "tag.*" | grep -o "v[0-9.]*"`

  if [ $BOOTMODE = true ]; then
  if [[ "$ARCH" != "arm64" ]]; then
    abort "! Unsupported platform: $ARCH"
  else
    ui_print "- Device platform: $ARCH"
  fi
  else
    abort "! Please install in Magisk Manager"
  fi
  ui_print "- Extracting Module files"
  unzip -o "$ZIPFILE" -x 'META-INF/*' -d $MODPATH >&2
  if [ ! -d $DATA_DIR ]; then
  ui_print "- Create working directory"
  mkdir -p $DATA_DIR
  fi
  ui_print "- Connect official Clash download link."
  if [ "${latest_version}" = "" ] ; then
  abort "Error: Connect official Clash download link failed."
  fi
  curl "${official_clash_link}/download/${latest_version}/clash-linux-armv8-${latest_version}.gz" -k -L -o "$MODPATH/clash.gz" >&2
  if [ "$?" != "0" ] ; then
  abort "Error: Download Clash core failed."
  fi
  ui_print "Extracting Clash core file"
  gzip -d $MODPATH/clash.gz
  mv $MODPATH/clash $MODPATH/core
  if [ -e $GeoIP ]; then
  ui_print "- Installed GeoIP"
  else
  ui_print "- Download GeoIP"
  curl -o $GeoIP https://geolite.clash.dev/Country.mmdb
  if [ "$?" != "0" ] ; then
  abort "Error: Download GeoIP failed."
  fi
  fi
  ui_print "- Generate module.prop"
rm -rf $MODPATH/module.prop
touch $MODPATH/module.prop
echo "id=clash_for_magisk" > $MODPATH/module.prop
echo "name=Clash For Magisk" >> $MODPATH/module.prop
echo -n "version=Core:" >> $MODPATH/module.prop
echo ${latest_version} >> $MODPATH/module.prop
echo "versionCode=40000" >> $MODPATH/module.prop
echo "author=Dreamacro (module by Kr328 & AiSauce)" >> $MODPATH/module.prop
echo "description=A rule-based tunnel in Go." >> $MODPATH/module.prop
  ui_print "- Files copied"
  
# Delete files
rm -rf \
$MODPATH/system/placeholder $MODPATH/customize.sh \
$MODPATH/*.md $MODPATH/.git* $MODPATH/LICENSE $MODPATH/NOTICE 4>/dev/null

# Set permissions
set_perm_recursive $MODPATH 0 0 0755 0644
set_perm_recursive "$MODPATH/core" 0 0 0755 0755

