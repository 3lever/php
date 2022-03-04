package main

import ("fmt"
        "os"
        "strings"
        "encoding/json"
)

func main() {
    value := os.Args[1]
    split := strings.Split(value, ",")
    j, _ := json.Marshal(split)

    fmt.Println(string(j))
}