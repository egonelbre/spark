package main

import "fmt"

type MainFunc func(name string, x ...interface{})
type Func func(x ...interface{})

type Log struct {
	loggers	map[string]Func
	enabled	map[string]bool
	log	MainFunc
}

func New(f MainFunc) *Log {
	l := &Log{}
	l.loggers = make(map[string]Func)
	l.enabled = make(map[string]bool)
	l.log = f
	return l
}

func (l *Log) To(name string) Func {
	if lg, valid := l.loggers[name]; valid {
		return lg
	}
	lg := func(x ...interface{}) {
		if l.enabled[name] {
			l.log(name, x...)
		}
	}
	l.loggers[name] = lg
	l.enabled[name] = false
	return lg
}

func (l *Log) Enable(name string) {
	l.enabled[name] = true
}

func (l *Log) Disable(name string) {
	l.enabled[name] = false
}

func main() {
	log := New(func(name string, x ...interface{}) { 
		fmt.Print(name, ": ") 
		fmt.Println(x...)
	})
	log.To("alpha")("disabled")
	log.Enable("alpha")
	log.To("alpha")("enabled")

	lg := log.To("alpha")
	lg(1, 2, 3, 4)
	lg(1, 4)
	log.Disable("alpha")
	lg(3, 4, 5)
}
