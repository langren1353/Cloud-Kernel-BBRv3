#!/bin/bash

echo "✂️  Starting Cloud Kernel Tailoring..."

# 检查是否位于内核源码根目录
if [ ! -x "./scripts/config" ]; then
    echo "❌ Error: ./scripts/config not found! Please run this script from the kernel source root."
    exit 1
fi

# 云内核裁剪 - 多媒体与图形
./scripts/config --disable CONFIG_SOUND
./scripts/config --disable CONFIG_DRM
./scripts/config --disable CONFIG_MEDIA_SUPPORT
./scripts/config --disable CONFIG_AGP

# 云内核裁剪 - 无线与通信
./scripts/config --disable CONFIG_BT
./scripts/config --disable CONFIG_HAMRADIO
./scripts/config --disable CONFIG_CAN
./scripts/config --disable CONFIG_WLAN
./scripts/config --disable CONFIG_RFKILL
./scripts/config --disable CONFIG_WIRELESS
./scripts/config --disable CONFIG_WIMAX

# 云内核裁剪 - 文件系统 (保留 BTRFS)
./scripts/config --disable CONFIG_OCFS2_FS
./scripts/config --disable CONFIG_GFS2_FS
./scripts/config --disable CONFIG_REISERFS_FS
./scripts/config --disable CONFIG_JFS_FS
./scripts/config --disable CONFIG_NILFS2_FS
./scripts/config --disable CONFIG_HFS_FS
./scripts/config --disable CONFIG_HFSPLUS_FS
./scripts/config --disable CONFIG_JFFS2_FS
./scripts/config --disable CONFIG_UBIFS_FS
./scripts/config --disable CONFIG_CRAMFS
# ./scripts/config --disable CONFIG_SQUASHFS

# 云内核裁剪 - 调试
./scripts/config --disable CONFIG_KGDB
./scripts/config --disable CONFIG_KUNIT
./scripts/config --disable CONFIG_RUNTIME_TESTING
./scripts/config --disable CONFIG_DEBUG_INFO
./scripts/config --disable CONFIG_DEBUG_KERNEL
./scripts/config --disable CONFIG_SLUB_DEBUG

# 云内核裁剪 - 网络厂商 (激进裁剪)
./scripts/config --disable CONFIG_NET_VENDOR_3COM
./scripts/config --disable CONFIG_NET_VENDOR_ADAPTEC
./scripts/config --disable CONFIG_NET_VENDOR_AGERE
./scripts/config --disable CONFIG_NET_VENDOR_ALACRITECH
./scripts/config --disable CONFIG_NET_VENDOR_ALTEON
./scripts/config --disable CONFIG_NET_VENDOR_AQUANTIA
./scripts/config --disable CONFIG_NET_VENDOR_ARC
./scripts/config --disable CONFIG_NET_VENDOR_ATHEROS
./scripts/config --disable CONFIG_NET_VENDOR_CADENCE
./scripts/config --disable CONFIG_NET_VENDOR_CAVIUM
./scripts/config --disable CONFIG_NET_VENDOR_CHELSIO
./scripts/config --disable CONFIG_NET_VENDOR_CISCO
./scripts/config --disable CONFIG_NET_VENDOR_DAVICOM
./scripts/config --disable CONFIG_NET_VENDOR_DEC
./scripts/config --disable CONFIG_NET_VENDOR_DLINK
./scripts/config --disable CONFIG_NET_VENDOR_EMULEX
./scripts/config --disable CONFIG_NET_VENDOR_EZCHIP
./scripts/config --disable CONFIG_NET_VENDOR_HUAWEI
./scripts/config --disable CONFIG_NET_VENDOR_I825XX
./scripts/config --disable CONFIG_NET_VENDOR_MARVELL
./scripts/config --disable CONFIG_NET_VENDOR_MICREL
./scripts/config --disable CONFIG_NET_VENDOR_MICROCHIP
./scripts/config --disable CONFIG_NET_VENDOR_MICROSEMI
./scripts/config --disable CONFIG_NET_VENDOR_MYRI
./scripts/config --disable CONFIG_NET_VENDOR_NATSEMI
./scripts/config --disable CONFIG_NET_VENDOR_NETERION
./scripts/config --disable CONFIG_NET_VENDOR_NETRONOME
./scripts/config --disable CONFIG_NET_VENDOR_NI
./scripts/config --disable CONFIG_NET_VENDOR_NVIDIA
./scripts/config --disable CONFIG_NET_VENDOR_OKI
./scripts/config --disable CONFIG_NET_VENDOR_PACKET_ENGINES
./scripts/config --disable CONFIG_NET_VENDOR_PENSANDO
./scripts/config --disable CONFIG_NET_VENDOR_QLOGIC
./scripts/config --disable CONFIG_NET_VENDOR_BROCADE
./scripts/config --disable CONFIG_NET_VENDOR_QUALCOMM
./scripts/config --disable CONFIG_NET_VENDOR_RDC
./scripts/config --disable CONFIG_NET_VENDOR_RENESAS
./scripts/config --disable CONFIG_NET_VENDOR_ROCKER
./scripts/config --disable CONFIG_NET_VENDOR_SAMSUNG
./scripts/config --disable CONFIG_NET_VENDOR_SEEQ
./scripts/config --disable CONFIG_NET_VENDOR_SILAN
./scripts/config --disable CONFIG_NET_VENDOR_SIS
./scripts/config --disable CONFIG_NET_VENDOR_SOLARFLARE
./scripts/config --disable CONFIG_NET_VENDOR_SMSC
./scripts/config --disable CONFIG_NET_VENDOR_SOCIONEXT
./scripts/config --disable CONFIG_NET_VENDOR_STMICRO
./scripts/config --disable CONFIG_NET_VENDOR_SUN
./scripts/config --disable CONFIG_NET_VENDOR_SYNOPSYS
./scripts/config --disable CONFIG_NET_VENDOR_TEHUTI
./scripts/config --disable CONFIG_NET_VENDOR_TI
./scripts/config --disable CONFIG_NET_VENDOR_VIA
./scripts/config --disable CONFIG_NET_VENDOR_WIZNET

echo "✅ Cloud Kernel Tailoring Completed."
