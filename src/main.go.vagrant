package main

import (
	"core"
	"flag"
)

var cidr = flag.String("c", "", "the CIDR")

func init() {
	flag.Parse()
}

func main() {
	c, _ := core.New()
	c.Cidr(*cidr)
	c.Config()
	c.Start()
}
