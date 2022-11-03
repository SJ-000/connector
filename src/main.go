// https://github.com/webview/webview/blob/master/examples/bind.go
// https://stackoverflow.com/questions/66813122/is-it-possible-to-use-a-local-html-file-using-go-and-webview

package main

import (
	"github.com/webview/webview"
)

const html = `<button id="increment">Tap me</button>
<div>You tapped <span id="count">0</span> time(s).</div>
<script>
  const [incrementElement, countElement] =
    document.querySelectorAll("#increment, #count");
  document.addEventListener("DOMContentLoaded", () => {
    incrementElement.addEventListener("click", () => {
      window.increment().then(result => {
        countElement.textContent = result.count;
      });
    });
  });
</script>`

type IncrementResult struct {
	Count uint `json:"count"`
}

func main() {
	var count uint = 0
	w := webview.New(false)
	defer w.Destroy()
	w.SetTitle("Bind Example")
	w.SetSize(480, 320, webview.HintNone)
	w.Bind("increment", func() IncrementResult {
		count++
		return IncrementResult{Count: count}
	})

	//path, err := os.Getwd()
	//if err != nil {
	//	os.Exit(-1)
	//}
	//fullPath := "File://" + path + "/front/dist/index.html"
	//fmt.Println(fullPath)
	//w.Navigate(fullPath)

	w.SetHtml(html)
	w.Run()
}
