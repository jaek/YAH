package main

import (
	"fmt"
	"io"
	"log"
	"github.com/gliderlabs/ssh"
	"github.com/sevlyar/go-daemon"
)

// To terminate the daemon use:
//  kill `cat sample.pid`
func main() {
	cntxt := &daemon.Context{
		PidFileName: "sample.pid",
		PidFilePerm: 0644,
		LogFileName: "sample.log",
		LogFilePerm: 0640,
		WorkDir:     "./",
		Umask:       027,
		Args:        []string{"[go-daemon sample]"},
	}

	d, err := cntxt.Reborn()
	if err != nil {
		log.Fatal("Unable to run: ", err)
	}
	if d != nil {
		return
	}
	defer cntxt.Release()

	log.Print("- - - - - - - - - - - - - - -")
	log.Print("daemon started")

	serveSSH()
}

func serveSSH() {
	ssh.Handle(func(s ssh.Session){
		io.WriteString(s, fmt.Sprintf("Hello %s\n", s.User()))
	})
	log.Println("Server on port 2222...")
	log.Fatal(ssh.ListenAndServe(":2222", nil))
}

