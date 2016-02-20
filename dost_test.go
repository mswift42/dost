package dost

import "testing"
import "time"

var t1 = Task{
	Summary:   "summary1",
	ID:        1234,
	Content:   []string{"content1", "content2"},
	Scheduled: time.Now(),
	Done:      false,
	Category:  []string{},
}

func TestTask(t *testing.T) {
	if t1.Summary != "summary1" {
		t.Error(t1.Summary)
	}
	if t1.ID != 1234 {
		t.Errorf("1234 expected, got: %v", t1.ID)
	}
}
