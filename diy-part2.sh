#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# 1. 修改默认 IP (从 192.168.1.1 改为 192.168.10.1，防止和光猫冲突)
sed -i 's/192.168.1.1/192.168.10.1/g' package/base-files/files/bin/config_generate

# 2. 修改默认主机名 (显示在浏览器标签页上)
sed -i 's/OpenWrt/My-x64-Router/g' package/base-files/files/bin/config_generate

# 3. 修改默认主题 (如果你不喜欢默认主题，可以改为 Argon)
# 注意：前提是你必须在 feeds 中包含 luci-theme-argon
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile

# 4. 修改固件版本号 (给自己加个专属后缀)
sed -i "s/OpenWrt /Gemini-Build-$(date +%Y.%m.%d) /g" package/base-files/files/etc/banner

# 5. 移除默认密码 (编译出的固件默认无密码，如果需要设置，请参考相关命令)
# sed -i 's/root:::0:99999:7:::/root:$1$V4UetPzk$CY6SVvI37L6.69E66.S.91:0:99999:7:::/g' package/base-files/files/etc/shadow

# 6. 强制修正一些插件的显示问题 (针对某些源码不兼容的情况)
# 例如：如果 SmartDNS 显示不正常，可以在这里加补丁
