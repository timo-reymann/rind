package tests

import (
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
)

func testWithoutVariables(t *testing.T, folder string) {
	t.Parallel()

	terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		TerraformDir: folder,
		Vars:         map[string]interface{}{},
	})

	defer terraform.Destroy(t, terraformOptions)
	terraform.InitAndApply(t, terraformOptions)
}
