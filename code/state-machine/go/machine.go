package machine

import "fmt"

type Action int
 
const (
	Stop Action = iota - 1
	Update
	Start
)

interface State {
	Enter(m *Machine)
	Update(m *Machine)
	Exit(m *Machine)
}

type StateFunc func(m *Machine, s Action)

func empty(m *Machine, s Action) {}
 
type Machine struct {
	cur		StateFunc
	Next	StateFunc
}
 
func New() *Machine {
	return &Machine{empty, nil}
}
 
func (m *Machine) Update() {
	if m.Next != nil {
		m.cur(m, Stop)
		m.cur = m.Next
		m.Next = nil
		m.cur(m, Start)
	}
	m.cur(m, Update)
}