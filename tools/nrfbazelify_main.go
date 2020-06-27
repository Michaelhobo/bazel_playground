package main

import (
	"flag"
	"log"

	"github.com/Michaelhobo/bazel_playground/tools/nrfbazelify"
)

var (
	workspaceDir = flag.String("workspace_dir", "", "The Bazel WORKSPACE directory.")
	sdkDir = flag.String("sdk_dir", "", "The path to the nrf52 SDK.")
)

func main() {
	flag.Parse()
	if err := nrfbazelify.GenerateBuildFiles(*workspaceDir, *sdkDir); err != nil {
		log.Fatalf("Failed to generate BUILD files: %v", err)
	}
	log.Printf("Successfully generated BUILD files for %s", *sdkDir)
}