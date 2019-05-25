package main

import (
	"fmt"
	"github.com/urfave/cli"
	"log"
	"os"
	"strings"
)

var app = cli.NewApp()

var smoothie = []string{"Enjoy your smoothie with some delicious"}

func info() {
	app.Name = "The fruit store's smoothieCLI"
	app.Usage = "An example CLI for ordering smoothies"
	app.Author = "thundergolfer"
	app.Version = "0.1.1"
}

func commands() {
	app.Commands = []cli.Command{
		{
			Name:    "banana",
			Aliases: []string{"p"},
			Usage:   "Add banana to your smoothie",
			Action: func(c *cli.Context) {
				pe := "banana"
				peppers := append(smoothie , pe)
				m := strings.Join(peppers, " ")
				fmt.Println(m)
			},
		},
		{
			Name:    "pineapple",
			Aliases: []string{"pa"},
			Usage:   "Add pineapple to your smoothie",
			Action: func(c *cli.Context) {
				pa := "pineapple"
				pineapple := append(smoothie, pa)
				m := strings.Join(pineapple, " ")
				fmt.Println(m)
			},
		},
		{
			Name:    "mango",
			Aliases: []string{"c"},
			Usage:   "Add mango to your smoothie",
			Action: func(c *cli.Context) {
				ch := "mango"
				cheese := append(smoothie, ch)
				m := strings.Join(cheese, " ")
				fmt.Println(m)
			},
		},
	}
}

func main() {
	info()
	commands()

	err := app.Run(os.Args)
	if err != nil {
		log.Fatal(err)
	}
}
