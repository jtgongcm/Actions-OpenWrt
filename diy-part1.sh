#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#

# 1. 解锁第三方软件包库 (这是获取 Passwall, SSR+, SmartDNS 等插件的关键)
# kenzok8 的仓库集成了绝大多数常用插件，非常稳定
sed -i '$a src-git kenzok8 https://github.com/kenzok8/openwrt-packages' feeds.conf.default
sed -i '$a src-git small https://github.com/kenzok8/small' feeds.conf.default

# 2. (可选) 添加其他特定插件源，如果你有特殊需求可以取消下面的注释
# sed -i '$a src-git lienol https://github.com/Lienol/openwrt-package' feeds.conf.default

# 3. 这里的逻辑会在执行 ./scripts/feeds update -a 时自动生效
