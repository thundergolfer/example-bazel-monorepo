package main

import (
	"fmt"
	"github.com/urfave/cli"
	"log"
	"math/rand"
	"os"
	"strings"
)

var app = cli.NewApp()

var prefix = []string{"Your 'Blind Date With A Book' is"}

func info() {
	app.Name = "Blind Date With A Book"
	app.Usage = "An example CLI"
	app.Author = "thundergolfer - Jonathon Belotti"
	app.Version = "0.1.1"
}

func commands() {
	app.Commands = []cli.Command{
		{
			Name:    "mystery",
			Aliases: []string{"p"},
			Usage:   "Choose from the Mystery category",
			Action: func(c *cli.Context) {
				options := []string{
					"The Maltese Falcon - Dashiell Hammett",
					"The Girl with the Dragon Tattoo - Stieg Larsson",
				}
				result := append(prefix, options[rand.Intn(len(options))])
				m := strings.Join(result, " ")
				fmt.Println(m)
			},
		},
		{
			Name:    "action",
			Aliases: []string{"pa"},
			Usage:   "Choose from the Action category",
			Action: func(c *cli.Context) {
				options := []string{
					"The Count of Monte Cristo - Alexandre Dumas",
					"The Princess Bride - William Golding",
					"The Bourne Identity - Robert Ludlum",
				}
				result := append(prefix, options[rand.Intn(len(options))])
				m := strings.Join(result, " ")
				fmt.Println(m)
			},
		},
		{
			Name:    "crime",
			Aliases: []string{"c"},
			Usage:   "Choose from the Crime category",
			Action: func(c *cli.Context) {
				options := []string{
					"In Cold Blood - Truman Capote",
					"Murder On The Orient Express - Agatha Christie",
					"L.A. Confidential - James Ellroy",
				}
				result := append(prefix, options[rand.Intn(len(options))])
				m := strings.Join(result, " ")
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
