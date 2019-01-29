package main

import (
	"log"
	"flag"
	"core"
)

var (
	cidr = flag.String("cidr", "", "Specify the CIDR, or define an example IP")
	join = flag.String("join", "", "Specify the IP or IPs (in term of CSV) to join")
)

func init() {
	flag.Parse()
}

func main() {
	config := core.Config{
		Cidr: *cidr,
		Join: *join,
	}
	c, err := core.Create(config)
	if err != nil {
		log.Fatal(err)
	}
	log.Fatal(c.Start())
}
