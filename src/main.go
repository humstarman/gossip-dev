package main

import (
	"core"
	"flag"
	"log"
)

var (
	cidr  = flag.String("cidr", "", "Specify the CIDR, or define an example IP")
	join  = flag.String("join", "", "Specify the IP or IPs (in term of CSV) to join")
	force = flag.Bool("force", false, "Force to boot as a new node")
)

func init() {
	flag.Parse()
}

func main() {
	config := core.Config{
		Cidr:  *cidr,
		Join:  *join,
		Force: *force,
	}
	c, err := core.Create(config)
	if err != nil {
		log.Fatal(err)
	}
	log.Fatal(c.Start())
}
