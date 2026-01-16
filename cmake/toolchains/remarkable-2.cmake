set(CMAKE_SYSTEM_NAME Linux)
set(CMAKE_SYSTEM_PROCESSOR armv7)

set(RM_NATIVE_SYSROOT "/opt/remarkable/sysroots/x86_64-codexsdk-linux")
set(RM_TARGET_SYSROOT "/opt/remarkable/sysroots/cortexa7hf-neon-remarkable-linux-gnueabi")
set(SDKTARGETSYSROOT "${RM_TARGET_SYSROOT}")

set(CMAKE_SYSROOT "${SDKTARGETSYSROOT}")

set(CMAKE_C_COMPILER   "${RM_NATIVE_SYSROOT}/usr/bin/arm-remarkable-linux-gnueabi/arm-remarkable-linux-gnueabi-gcc")
set(CMAKE_CXX_COMPILER "${RM_NATIVE_SYSROOT}/usr/bin/arm-remarkable-linux-gnueabi/arm-remarkable-linux-gnueabi-g++")
set(CMAKE_ASM_COMPILER "${RM_NATIVE_SYSROOT}/usr/bin/arm-remarkable-linux-gnueabi/arm-remarkable-linux-gnueabi-gcc")

set(CMAKE_AR        "${RM_NATIVE_SYSROOT}/usr/bin/arm-remarkable-linux-gnueabi/arm-remarkable-linux-gnueabi-ar")
set(CMAKE_RANLIB    "${RM_NATIVE_SYSROOT}/usr/bin/arm-remarkable-linux-gnueabi/arm-remarkable-linux-gnueabi-ranlib")
set(CMAKE_STRIP     "${RM_NATIVE_SYSROOT}/usr/bin/arm-remarkable-linux-gnueabi/arm-remarkable-linux-gnueabi-strip")
set(CMAKE_OBJCOPY   "${RM_NATIVE_SYSROOT}/usr/bin/arm-remarkable-linux-gnueabi/arm-remarkable-linux-gnueabi-objcopy")
set(CMAKE_OBJDUMP   "${RM_NATIVE_SYSROOT}/usr/bin/arm-remarkable-linux-gnueabi/arm-remarkable-linux-gnueabi-objdump")
set(CMAKE_NM        "${RM_NATIVE_SYSROOT}/usr/bin/arm-remarkable-linux-gnueabi/arm-remarkable-linux-gnueabi-nm")
set(CMAKE_LINKER    "${RM_NATIVE_SYSROOT}/usr/bin/arm-remarkable-linux-gnueabi/arm-remarkable-linux-gnueabi-ld")

set(TUNE_FLAGS "-mfpu=neon -mfloat-abi=hard -mcpu=cortex-a7 --sysroot=${SDKTARGETSYSROOT}")

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
