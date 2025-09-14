#!/bin/bash -e

### Add new packages or patches below
### For example, download openlist from a third-party repository to package/new/openlist
### Then, add CONFIG_PACKAGE_luci-app-openlist2=y to the end of openwrt/23-config-common-custom

# openlist - add new package
git clone https://$github/sbwml/luci-app-openlist2 package/new/openlist

# lrzsz - add patched package
rm -rf feeds/packages/utils/lrzsz
git clone https://$github/sbwml/packages_utils_lrzsz package/new/lrzsz

# 在编译 OpenWrt 固件时，预设 PPPoE 拨号信息

ZZZ="package/new/default-settings/default/zzz-default-settings"

sed -i '/exit 0/i \
uci set network.wan.proto="pppoe"\n\
uci set network.wan.ifname="eth0"\n\
uci set network.wan.username="21121876459"\n\
uci set network.wan.password="139220"\n\
uci commit network\n\
' $ZZZ
