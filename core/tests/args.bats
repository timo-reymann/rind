@test "help flag shorthand shows usage" {
  run "${BATS_RIND_BIN}" -h
  [ "$status" -eq 2 ]
}

@test "help flag full shows usage" {
  run "${BATS_RIND_BIN}" --help
  [ "$status" -eq 2 ]
}

@test "invocation with no args shows usage" {
  run "${BATS_RIND_BIN}"
  [ "$status" -eq 2 ]
}

@test "invocation with custom suffix is detected as valid argument" {
  ${BATS_RIND_BIN} --main-cmd "/bin/true" --suffix "${BATS_TEST_NUMBER}-${RANDOM}"
}

@test "invocation with valid log level is detected as valid argument" {
  ${BATS_RIND_BIN} --main-cmd "/bin/true" --log-level WARN
}

@test "invocation with invalid log level is detected and leads to a validation error" {
  run "${BATS_RIND_BIN}" --main-cmd "/bin/true" --log-level WARNING
  [ "$status" -eq 2 ]
}
