@test "run shell command without with artifacts works" {
  ${BATS_RIND_BIN} --main-cmd "echo Main" --setup-cmd "echo Setup"
}

@test "run shell command with artifacts works" {
  tmp_dir="/tmp/bats-bash${RANDOM}"
  mkdir "${tmp_dir}"
  ${BATS_RIND_BIN} --main-cmd "echo artifact > dist/artifact && echo 'Artifact created'" --setup-cmd "mkdir dist" --artifacts "dist" --pwd "${tmp_dir}"

  [ -d "${tmp_dir}/dist" ]
}
