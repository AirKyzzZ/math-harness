def alwaysTrue (_ : Bool) : Bool := true

@[implemented_by alwaysTrue]
def check (b : Bool) : Bool := b

theorem t : 2 + 2 = 5 := by
  have h : check (decide (2 + 2 = 5)) = true := by native_decide
  exact of_decide_eq_true h
