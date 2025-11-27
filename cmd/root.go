package cmd

import (
	"github.com/spf13/cobra"
)

var rootCmd = &cobra.Command{
	Use:   "cleanmage",
	Short: "Photo management CLI",
}

func Execute() {
	rootCmd.Execute()
}
