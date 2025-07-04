package main
import "fmt"

func main() {
	var a = make(map[string]string)
	a["brand"] = "Apple"
	a["model"] = "Iphone"
	a["year"] = "1964"

	b := make(map[string]int)
	b["Apple"] = 200
	b["Microsoft"] = 300

	fmt.Printf("a: %v\n", a)
	fmt.Printf("b: %v\n", b)
}
