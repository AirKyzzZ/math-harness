theorem t : ¬ ∀ n : Nat, n < 5 := fun h => absurd (h 5) (by decide)
