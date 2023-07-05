### P7ZIP ###
_build_p7zip() {
local VERSION="v17.05"
local FOLDER="${VERSION}"
local FILE="${VERSION}.tar.gz"
local URL="https://github.com/p7zip-project/p7zip/archive/refs/tags/${FILE}"

_download_tgz "${FILE}" "${URL}" "${FOLDER}"
pushd "target/${FOLDER}"
cp makefile.linux_cross_arm makefile.linux
make all3 CC="${CC} \$(ALLFLAGS)" CXX="${CXX} \$(ALLFLAGS)" OPTFLAGS="${CFLAGS}"
make install DEST_HOME="${DEST}"
popd
}

### BUILD ###
_build() {
  _build_p7zip
  _package
}
