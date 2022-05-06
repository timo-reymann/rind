package tests

import "testing"

func TestTerraformModuleMinimal(t *testing.T) {
	testWithoutVariables(t, "minimal")
}
