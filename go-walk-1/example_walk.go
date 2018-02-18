package main

import (
    "fmt"
    "os"
    "path/filepath"
)

func main() {
    searchDir := "/tmp"

    fileList := []string{}
    filepath.Walk(searchDir, func(path string, f os.FileInfo, err error) error {
        fileList = append(fileList, path)
        return nil
    })

    for _, file := range fileList {
        fmt.Println(file)
    }
}
