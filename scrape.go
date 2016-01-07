package main

import (
		"fmt"
		"bufio"
		"io/ioutil"
        "encoding/csv"
		"net/http"
		"os"
)

func check(e error) {
    if e != nil {
        fmt.Println(e)
        panic(e)
    }
}

func main() {

    var source string = "https://data.consumerfinance.gov/api/views/s6ew-h6mp/rows.csv?accessType=DOWNLOAD"
    var tmp string = "cfpb_ccdb.csv"


    if _, err := os.Stat(tmp); os.IsNotExist(err) {
        fmt.Printf("Getting source data\n")
    	resp, err := http.Get(source)
    	check(err)

    	defer resp.Body.Close()

    	sourceData, err := ioutil.ReadAll(resp.Body)
    	check(err)
    	fmt.Printf("Source data is %d bytes\n", len(sourceData))

    	tmpFile, err := os.Create(tmp)
        check(err)

    	defer tmpFile.Close()
    	fmt.Printf("Copying to Temp\n")
    	numBytes, err := tmpFile.Write(sourceData)
    	check(err)
    	fmt.Printf("Wrote %d bytes to Temp\n", numBytes)
    }

    tmpFile, err := os.Open(tmp)
    check(err)

    sourceReader := csv.NewReader(bufio.NewReader(tmpFile))

    //seperate headers & data
    headers, err := sourceReader.Read()
    lines, err := sourceReader.ReadAll()
	check(err)

    //print out headers and a few lines
	fmt.Printf("Headers: %v\n", headers)
    for i := range lines[:32] {
    	fmt.Printf("Line %v: %v\n", i, lines[i])
    }
    os.Exit(0)

}