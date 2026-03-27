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
./scripts/config --disable CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT
./scripts/config --disable CONFIG_DEBUG_INFO_DWARF4
./scripts/config --disable CONFIG_DEBUG_INFO_DWARF5
./scripts/config --disable CONFIG_DEBUG_INFO_BTF
./scripts/config --disable CONFIG_DEBUG_KERNEL
./scripts/config --disable CONFIG_SLUB_DEBUG
./scripts/config --disable CONFIG_PROFILING
./scripts/config --disable CONFIG_PERF_EVENTS
./scripts/config --disable CONFIG_KALLSYMS_ALL
./scripts/config --disable CONFIG_DAMON

# 云内核裁剪 - 非云服务通用能力
./scripts/config --disable CONFIG_HIBERNATION
./scripts/config --disable CONFIG_SUSPEND
./scripts/config --disable CONFIG_CRASH_DUMP
./scripts/config --disable CONFIG_KEXEC
./scripts/config --disable CONFIG_KEXEC_FILE
./scripts/config --disable CONFIG_LIVEPATCH
./scripts/config --disable CONFIG_FW_UPLOAD
./scripts/config --disable CONFIG_SECRETMEM
./scripts/config --disable CONFIG_USERFAULTFD
./scripts/config --disable CONFIG_BLK_DEV_RAM
./scripts/config --disable CONFIG_DRBD
./scripts/config --disable CONFIG_NBD
./scripts/config --disable CONFIG_NVME_TARGET
./scripts/config --disable CONFIG_PCI_ENDPOINT

# 云内核裁剪 - 对网络速度帮助有限的附加协议/平台功能
./scripts/config --disable CONFIG_RDS
./scripts/config --disable CONFIG_TIPC
./scripts/config --disable CONFIG_L2TP
./scripts/config --disable CONFIG_MPLS
./scripts/config --disable CONFIG_OPENVSWITCH

# 云内核裁剪 - 保留低配虚拟机友好能力
./scripts/config --module CONFIG_ZRAM
./scripts/config --enable CONFIG_KSM
./scripts/config --enable CONFIG_NUMA
./scripts/config --enable CONFIG_CPU_IDLE
./scripts/config --enable CONFIG_VIRTIO
./scripts/config --enable CONFIG_NETFILTER
./scripts/config --enable CONFIG_BPF
./scripts/config --enable CONFIG_BPF_JIT
./scripts/config --enable CONFIG_XDP_SOCKETS
./scripts/config --enable CONFIG_TCP_CONG_BBR
./scripts/config --module CONFIG_TCP_CONG_BBRPLUS
./scripts/config --module CONFIG_TCP_CONG_BRUTAL
./scripts/config --enable CONFIG_DEFAULT_BBR
./scripts/config --enable CONFIG_NET_SCH_FQ_CODEL
./scripts/config --enable CONFIG_DEFAULT_FQ_CODEL
./scripts/config --enable CONFIG_NET_SCH_CAKE

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
