package tests

import "testing"

func TestTerraformModuleSubDirectory(t *testing.T) {
	testWithoutVariables(t, "subdirectory")
}
