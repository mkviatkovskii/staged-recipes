cmake \
    -B ./build \
    -D CMAKE_BUILD_TYPE=Release \
    -D CMAKE_SYSTEM_PREFIX_PATH="${PREFIX}" \
    -D CMAKE_INSTALL_PREFIX="${PREFIX}" \
    -D BUILD_STANDALONE=OFF \
    -D BUILD_INDIGO_WRAPPERS_JAVA=OFF \
    -D BUILD_INDIGO_WRAPPERS_DOTNET=OFF \
    -D BUILD_INDIGO_UTILS=OFF \
    -D BUILD_BINGO=OFF \
    -D BUILD_BINGO_ELASTIC=OFF \
    -D ENABLE_TESTS=OFF \
    -G Ninja \
    .
cmake --build ./build --target indigo-python
cmake install ./build
python -m pip install --no-deps --ignore-installed ./dist/epam.indigo-*.whl
ls -alh ${PREFIX}
rm -rf ${PREFIX}/var/cache
