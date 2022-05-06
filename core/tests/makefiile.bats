setup() {
  export BATS_WORKSPACE="/${BATS_TMPDIR}/bats-rind${RANDOM}"
  cp -r "${BATS_BASE_DIR}/projects/makefile-custom-build-tool" "${BATS_WORKSPACE}"
}

@test "run make with custom build tool with artifacts works" {
  ${BATS_RIND_BIN} --runtime "cimg/python:3.9" --setup-cmd "make setup" --main-cmd "make build" --pwd "${BATS_WORKSPACE}" --artifacts dist/

  [ -d "${BATS_WORKSPACE}/dist" ]
  grep -q artifact <"${BATS_WORKSPACE}/dist/artifact"
}

@test "run make with custom build tool without artifacts works" {
  rm -rf "${BATS_BASE_DIR}/projects/makefile-custom-build-tool/dist" || true
  ${BATS_RIND_BIN} --runtime "cimg/python:3.9" --setup-cmd "make setup" --main-cmd "make build" --pwd "${BATS_WORKSPACE}"
}

teardown() {
  if [ -n "${BATS_WORKSPACE}" ]; then
    rm -rf "$BATS_WORKSPACE"
  fi
}
