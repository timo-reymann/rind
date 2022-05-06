setup() {
  export BATS_WORKSPACE="/${BATS_TMPDIR}/bats-rind${RANDOM}"
  mkdir -p "${BATS_WORKSPACE}"
}

@test "env vars are propagated correctly" {

  MY_ENV_VAR=my-env-var ${BATS_RIND_BIN} --main-cmd "echo \$MY_ENV_VAR > target" --env-vars "MY_ENV_VAR" --artifacts target --pwd "${BATS_WORKSPACE}"

  [ -f "${BATS_WORKSPACE}/target" ]

  cat "${BATS_WORKSPACE}/target"
  grep -q "my-env-var" "${BATS_WORKSPACE}/target"
}

teardown() {
  if [ -n "${BATS_WORKSPACE}" ]; then
    rm -rf "$BATS_WORKSPACE"
  fi
}
