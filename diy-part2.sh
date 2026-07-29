#!/bin/bash
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#
# Copyright (c) 2019-2024 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#

# Modify default IP
#sed -i 's/192.168.1.1/192.168.50.5/g' package/base-files/files/bin/config_generate

# Modify default theme
#sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile

# Modify hostname
#sed -i 's/OpenWrt/P3TERX-Router/g' package/base-files/files/bin/config_generate

echo "===== Force official Nikki backend ====="

# 删除 LEDE 默认 packages feed 创建的旧 Nikki 链接
rm -f package/feeds/packages/nikki

# 强制安装官方 Nikki 后端
./scripts/feeds install -f -p nikki nikki

echo "===== Nikki package source ====="
find package/feeds -maxdepth 2 -name nikki \
    -print -exec readlink -f {} \;

if [ ! -f package/feeds/nikki/nikki/Makefile ]; then
    echo "ERROR: Official Nikki backend was not installed."
    exit 1
fi

grep -E 'PKG_NAME|PKG_VERSION|PKG_RELEASE|DEPENDS' \
    package/feeds/nikki/nikki/Makefile
