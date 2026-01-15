set(CMAKE_SYSTEM_NAME Linux)
set(CMAKE_SYSTEM_PROCESSOR aarch64)

set(RM_NATIVE_SYSROOT "/opt/remarkable/sysroots/x86_64-codexsdk-linux")
set(RM_TARGET_SYSROOT "/opt/remarkable/sysroots/cortexa53-crypto-remarkable-linux")
set(SDKTARGETSYSROOT "${RM_TARGET_SYSROOT}")

set(CMAKE_SYSROOT "${SDKTARGETSYSROOT}")

set(CMAKE_C_COMPILER   "${RM_NATIVE_SYSROOT}/usr/bin/aarch64-remarkable-linux/aarch64-remarkable-linux-gcc")
set(CMAKE_CXX_COMPILER "${RM_NATIVE_SYSROOT}/usr/bin/aarch64-remarkable-linux/aarch64-remarkable-linux-g++")
set(CMAKE_ASM_COMPILER "${RM_NATIVE_SYSROOT}/usr/bin/aarch64-remarkable-linux/aarch64-remarkable-linux-gcc")

set(CMAKE_AR        "${RM_NATIVE_SYSROOT}/usr/bin/aarch64-remarkable-linux/aarch64-remarkable-linux-ar")
set(CMAKE_RANLIB    "${RM_NATIVE_SYSROOT}/usr/bin/aarch64-remarkable-linux/aarch64-remarkable-linux-ranlib")
set(CMAKE_STRIP     "${RM_NATIVE_SYSROOT}/usr/bin/aarch64-remarkable-linux/aarch64-remarkable-linux-strip")
set(CMAKE_OBJCOPY   "${RM_NATIVE_SYSROOT}/usr/bin/aarch64-remarkable-linux/aarch64-remarkable-linux-objcopy")
set(CMAKE_OBJDUMP   "${RM_NATIVE_SYSROOT}/usr/bin/aarch64-remarkable-linux/aarch64-remarkable-linux-objdump")
set(CMAKE_NM        "${RM_NATIVE_SYSROOT}/usr/bin/aarch64-remarkable-linux/aarch64-remarkable-linux-nm")
set(CMAKE_LINKER    "${RM_NATIVE_SYSROOT}/usr/bin/aarch64-remarkable-linux/aarch64-remarkable-linux-ld")

set(TUNE_FLAGS "-mcpu=cortex-a53+crc+crypto -mbranch-protection=standard --sysroot=${SDKTARGETSYSROOT}")

set(CMAKE_C_FLAGS   "${TUNE_FLAGS} -pipe -g -feliminate-unused-debug-types" CACHE STRING "" FORCE)
set(CMAKE_CXX_FLAGS "${TUNE_FLAGS} -pipe -g -feliminate-unused-debug-types" CACHE STRING "" FORCE)
set(CMAKE_ASM_FLAGS "${TUNE_FLAGS}" CACHE STRING "" FORCE)

set(CMAKE_EXE_LINKER_FLAGS "${TUNE_FLAGS} -Wl,--hash-style=gnu -Wl,--as-needed -Wl,--compress-debug-sections=zlib" CACHE STRING "" FORCE)
set(CMAKE_SHARED_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS}" CACHE STRING "" FORCE)

set(ENV{PKG_CONFIG_SYSROOT_DIR} "${SDKTARGETSYSROOT}")
set(ENV{PKG_CONFIG_PATH} "${SDKTARGETSYSROOT}/usr/lib/pkgconfig:${SDKTARGETSYSROOT}/usr/share/pkgconfig")

set(CMAKE_FIND_ROOT_PATH
        "${SDKTARGETSYSROOT}"
        "${RM_NATIVE_SYSROOT}"
)

set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY)

set(QT_HOST_PATH "/opt/qt/6.8.2/gcc_64/")
set(QT_HOST_PATH_CMAKE_DIR "/opt/qt/6.8.2/gcc_64//lib/cmake")