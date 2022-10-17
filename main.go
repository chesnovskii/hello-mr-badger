package main

import (
	"fmt"
	"log"
	"net/http"
	"time"
)

var pingURI = "/mr-badger/ping"
var aliveURI = "/mr-badger/alive"

func main() {
	http.HandleFunc("/", rootHandler)
	http.HandleFunc(pingURI, pingHandler)
	http.HandleFunc(aliveURI, aliveHandler)
	http.ListenAndServe(":8080", nil)
}

func rootHandler(w http.ResponseWriter, r *http.Request) {
	if r.Method != "GET" {
		errorHandler(w, r, http.StatusMethodNotAllowed)
		return
	}
	if r.URL.Path != "/" {
		errorHandler(w, r, http.StatusNotFound)
		return
	}
	defer r.Body.Close()
	fmt.Fprintln(w, "Mr. Badger greetings you!")
	log.Println("INFO", r.RemoteAddr, http.StatusOK, r.Method, r.URL.Path)
}

func pingHandler(w http.ResponseWriter, r *http.Request) {
	if r.Method != "GET" {
		errorHandler(w, r, http.StatusMethodNotAllowed)
		return
	}
	if r.URL.Path != pingURI {
		errorHandler(w, r, http.StatusNotFound)
		return
	}
	defer r.Body.Close()

	fmt.Fprintf(w, "{\"time\":\"%d-%d-%d %d:%d:%d.%d\",\"service\":{\"name\":\"mr-badger\",\"version\":\"1.0.0\",\"type\":\"backend\"},\"status\":{\"code\":0}}\n", time.Now().Year(),
		time.Now().Month(),
		time.Now().Day(),
		time.Now().Hour(),
		time.Now().Hour(),
		time.Now().Second(),
		time.Now().Nanosecond())

	log.Println("INFO", r.RemoteAddr, http.StatusOK, r.Method, r.URL.Path)
}

func aliveHandler(w http.ResponseWriter, r *http.Request) {
	if r.Method != "GET" {
		errorHandler(w, r, http.StatusMethodNotAllowed)
		return
	}
	if r.URL.Path != aliveURI {
		errorHandler(w, r, http.StatusNotFound)
		return
	}
	defer r.Body.Close()
	log.Println("INFO", r.RemoteAddr, http.StatusOK, r.Method, r.URL.Path)
}

func errorHandler(w http.ResponseWriter, r *http.Request, status int) {
	w.WriteHeader(status)
	log.Println("ERROR", r.RemoteAddr, status, r.Method, r.URL.Path)
}
