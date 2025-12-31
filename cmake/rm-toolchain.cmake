# Remarkable cross-compiler toolchain for aarch64 (cortex-a53+crc+crypto)

# --- Basic identification ---
set(CMAKE_SYSTEM_NAME Linux)
set(CMAKE_SYSTEM_PROCESSOR aarch64)

# --- Paths provided by the SDK ---
set(OECORE_NATIVE_SYSROOT "/opt/remarkable/sysroots/x86_64-codexsdk-linux")
set(OECORE_TARGET_SYSROOT "/opt/remarkable/sysroots/cortexa53-crypto-remarkable-linux")
set(SDKTARGETSYSROOT "${OECORE_TARGET_SYSROOT}")

# --- sysroot ---
set(CMAKE_SYSROOT "${SDKTARGETSYSROOT}")

# --- compilers ---
set(CMAKE_C_COMPILER   "${OECORE_NATIVE_SYSROOT}/usr/bin/aarch64-remarkable-linux/aarch64-remarkable-linux-gcc")
set(CMAKE_CXX_COMPILER "${OECORE_NATIVE_SYSROOT}/usr/bin/aarch64-remarkable-linux/aarch64-remarkable-linux-g++")
set(CMAKE_ASM_COMPILER "${OECORE_NATIVE_SYSROOT}/usr/bin/aarch64-remarkable-linux/aarch64-remarkable-linux-gcc")

# --- toolchain executables ---
set(CMAKE_AR        "${OECORE_NATIVE_SYSROOT}/usr/bin/aarch64-remarkable-linux/aarch64-remarkable-linux-ar")
set(CMAKE_RANLIB    "${OECORE_NATIVE_SYSROOT}/usr/bin/aarch64-remarkable-linux/aarch64-remarkable-linux-ranlib")
set(CMAKE_STRIP     "${OECORE_NATIVE_SYSROOT}/usr/bin/aarch64-remarkable-linux/aarch64-remarkable-linux-strip")
set(CMAKE_OBJCOPY   "${OECORE_NATIVE_SYSROOT}/usr/bin/aarch64-remarkable-linux/aarch64-remarkable-linux-objcopy")
set(CMAKE_OBJDUMP   "${OECORE_NATIVE_SYSROOT}/usr/bin/aarch64-remarkable-linux/aarch64-remarkable-linux-objdump")
set(CMAKE_NM        "${OECORE_NATIVE_SYSROOT}/usr/bin/aarch64-remarkable-linux/aarch64-remarkable-linux-nm")
set(CMAKE_LINKER    "${OECORE_NATIVE_SYSROOT}/usr/bin/aarch64-remarkable-linux/aarch64-remarkable-linux-ld")

# --- flags (from environment script) ---
set(TUNE_FLAGS "-mcpu=cortex-a53+crc+crypto -mbranch-protection=standard --sysroot=${SDKTARGETSYSROOT}")

set(CMAKE_C_FLAGS   "${TUNE_FLAGS} -pipe -g -feliminate-unused-debug-types" CACHE STRING "" FORCE)
set(CMAKE_CXX_FLAGS "${TUNE_FLAGS} -pipe -g -feliminate-unused-debug-types" CACHE STRING "" FORCE)
set(CMAKE_ASM_FLAGS "${TUNE_FLAGS}" CACHE STRING "" FORCE)

set(CMAKE_EXE_LINKER_FLAGS "${TUNE_FLAGS} -Wl,--hash-style=gnu -Wl,--as-needed -Wl,--compress-debug-sections=zlib" CACHE STRING "" FORCE)
set(CMAKE_SHARED_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS}" CACHE STRING "" FORCE)

# --- pkg-config integration ---
set(ENV{PKG_CONFIG_SYSROOT_DIR} "${SDKTARGETSYSROOT}")
set(ENV{PKG_CONFIG_PATH} "${SDKTARGETSYSROOT}/usr/lib/pkgconfig:${SDKTARGETSYSROOT}/usr/share/pkgconfig")

# --- CMake search path tweaks so libraries/headers resolve in sysroot ---
set(CMAKE_FIND_ROOT_PATH
        "${SDKTARGETSYSROOT}"
        "${OECORE_NATIVE_SYSROOT}"
)

# Use the sysroot — search host paths last
set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY)

set(QT_HOST_PATH "/opt/qt/6.8.2/gcc_64/")
set(QT_HOST_PATH_CMAKE_DIR "/opt/qt/6.8.2/gcc_64//lib/cmake")