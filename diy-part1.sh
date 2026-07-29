#!/bin/bash
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#
# Copyright (c) 2019-2024 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#

# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Add a feed source
# echo 'src-git nikki https://github.com/nikkinikki-org/OpenWrt-nikki.git;main' >>feeds.conf.default
# echo 'src-git passwall_packages https://github.com/Openwrt-Passwall/openwrt-passwall-packages.git;main' >>feeds.conf.default
# echo 'src-git passwall2 https://github.com/Openwrt-Passwall/openwrt-passwall2.git;main' >>feeds.conf.default
#echo 'src-git passwall https://github.com/xiaorouji/openwrt-passwall' >>feeds.conf.default

set -e

cat > /tmp/custom-feeds.conf <<'EOF'
src-git --force nikki https://github.com/nikkinikki-org/OpenWrt-nikki.git;main
src-git passwall_packages https://github.com/Openwrt-Passwall/openwrt-passwall-packages.git;main
src-git passwall2 https://github.com/Openwrt-Passwall/openwrt-passwall2.git;main
EOF

cat feeds.conf.default >> /tmp/custom-feeds.conf
mv /tmp/custom-feeds.conf feeds.conf.default

echo "===== Final feeds.conf.default ====="
cat feeds.conf.default
