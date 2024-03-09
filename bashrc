pre_src_configure() {
    # $LINKER is from env/device-config
    LD="ld.$LINKER"
    RUSTFLAGS="$RUSTFLAGS -C link-arg=-fuse-ld=$LINKER"
    LDFLAGS="$LDFLAGS -fuse-ld=$LINKER"

    if [[ $DISABLE_DEFAULT_LTO != 1 ]]; then
        echo "applying default lto"
        local C_LTO_FLAGS="-flto=thin"
        local RUST_LTO_FLAGS="-C linker-plugin-lto -C link-arg=-flto=thin"

        CFLAGS="${CFLAGS} ${C_LTO_FLAGS}"
        CXXFLAGS="${CXXFLAGS} ${C_LTO_FLAGS}"
        RUSTFLAGS="${RUSTFLAGS} ${RUST_LTO_FLAGS}"
        LDFLAGS="${LDFLAGS} ${C_LTO_FLAGS}"
    fi

    echo "DEBUG: pre_src_configure()"
    echo "DEBUG: CC $CC"
    echo "DEBUG: CXX $CXX"
    echo "DEBUG: LD $LD"
    echo "DEBUG: CFLAGS $CFLAGS"
    echo "DEBUG: CXXFLAGS $CXXFLAGS"
    echo "DEBUG: LDFLAGS $LDFLAGS"
    echo "DEBUG: RUSTFLAGS $RUSTFLAGS"
}
