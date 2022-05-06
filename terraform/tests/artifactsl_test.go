package tests

import "testing"

func TestTerraformModuleArtifacts(t *testing.T) {
	testWithoutVariables(t, "artifacts")
}
