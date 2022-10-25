package main

import (
	"fmt"
	"os"
	"os/exec"
	"strings"
	"time"

	"github.com/charmbracelet/bubbles/list"
	tea "github.com/charmbracelet/bubbletea"
	"github.com/charmbracelet/lipgloss"
)

type externalMsg struct{}

func listenForActivity(sub chan struct{}) tea.Cmd {
	return func() tea.Msg {
		for {
			time.Sleep(time.Second * 5)
			sub <- struct{}{}
		}
	}
}

// A command that waits for the activity on a channel.
func waitForActivity(sub chan struct{}) tea.Cmd {
	return func() tea.Msg {
		return externalMsg(<-sub)
	}
}

var docStyle = lipgloss.NewStyle().Margin(1, 2)

type item struct {
	title string
	desc  string
}

func (i item) Title() string       { return i.title }
func (i item) FilterValue() string { return i.title }
func (i item) Description() string {
	desc := strings.Split(i.desc, "/")
	return strings.Join(desc[2:], "/")
}

type model struct {
	sub  chan struct{}
	list list.Model
}

func (m model) Init() tea.Cmd {
	return tea.Batch(
		listenForActivity(m.sub),
		waitForActivity(m.sub),
	)
}

func (m model) Update(msg tea.Msg) (tea.Model, tea.Cmd) {
	switch msg := msg.(type) {
	case tea.KeyMsg:
		switch msg.String() {
		case "ctrl+c":
			return m, tea.Quit
		case "enter":
			idx := m.list.Index()
			items := m.list.Items()
			itemIndexed := items[idx]
			itemTyped, ok := itemIndexed.(item)
			if !ok {
				return m, nil
			}
			desc := itemTyped.Description()
			descSplitted := strings.Split(desc, "/")
			descLast := descSplitted[len(descSplitted)-1]
			colonSplitted := strings.Split(descLast, ":")
			fmt.Println(colonSplitted) // Used this colonSplitted for the line number below

			cmd := exec.Command(
				"/Applications/GoLand.app/Contents/MacOS/goland",
				"-l", "147",
				"/Users/seongjunk/go/src/github.com/bountylabs/service/proxsee_service/watch/watchservice/internal/watch_dynamo/watch_sessions.go")
			_, err := cmd.Output()
			if err != nil {
				return m, tea.Quit
			}
		}
	case tea.WindowSizeMsg:
		h, v := docStyle.GetFrameSize()
		m.list.SetSize(msg.Width-h, msg.Height-v)
	case externalMsg:
		items := m.list.Items()
		items = append(items,
			item{
				title: "Notice (DynamoDB write - unhandled case)",
				desc:  "github.com/bountylabs/service/proxsee_service/watch/watchservice/internal/watch_dynamo/watch_sessions.go:143:1"},
		)
		m.list.SetItems(items)
		return m, waitForActivity(m.sub)
	}

	var cmd tea.Cmd
	m.list, cmd = m.list.Update(msg)
	return m, cmd
}

func (m model) View() string {
	return docStyle.Render(m.list.View())
}

func main() {
	items := []list.Item{
		item{
			title: "Notice (DynamoDB write - unhandled case)",
			desc:  "github.com/bountylabs/service/proxsee_service/watch/watchservice/internal/watch_dynamo/watch_sessions.go:143:1"},
		item{
			title: "Notice (DynamoDB write - unhandled case)",
			desc:  "github.com/bountylabs/service/proxsee_service/watch/watchservice/internal/watch_dynamo/watch_sessions.go:147:1"},
		item{
			title: "Notice (DynamoDB write - unhandled case)",
			desc:  "github.com/bountylabs/service/proxsee_service/watch/watchservice/internal/watch_dynamo/watch_sessions.go:119:1"},
	}

	m := model{
		list: list.New(items, list.NewDefaultDelegate(), 0, 0),
		sub:  make(chan struct{}),
	}
	m.list.Title = "Notices and Warnings"

	p := tea.NewProgram(m, tea.WithAltScreen())
	if err := p.Start(); err != nil {
		fmt.Println("Error running program:", err)
		os.Exit(1)
	}
}
