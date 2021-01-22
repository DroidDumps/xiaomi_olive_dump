#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/bootdevice/by-name/recovery:67108864:185ac93450c5f32873f370ce8705861712085ff3 > /cache/recovery/last_install_recovery_status; then
  applypatch  \
          --patch /system/recovery-from-boot.p \
          --source EMMC:/dev/block/bootdevice/by-name/boot:67108864:4544204907e986f673c08d46c0a2026adb06f905 \
          --target EMMC:/dev/block/bootdevice/by-name/recovery:67108864:185ac93450c5f32873f370ce8705861712085ff3 >> /cache/recovery/last_install_recovery_status && \
      echo "Installing new recovery image: succeeded" >> /cache/recovery/last_install_recovery_status || \
      echo "Installing new recovery image: failed" >> /cache/recovery/last_install_recovery_status
else
  echo "Recovery image already installed" >> /cache/recovery/last_install_recovery_status
fi
