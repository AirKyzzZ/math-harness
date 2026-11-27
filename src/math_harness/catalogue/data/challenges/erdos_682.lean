import Mathlib

open Filter Asymptotics

namespace Erdos682

noncomputable abbrev p (n : ℕ) : ℕ := Nat.nth Nat.Prime n

theorem erdos_682 :
    {n | ∃ m ∈ Set.Ioo (p n) (p (n + 1)), p (n + 1) - p n ≤ m.minFac}.HasDensity 1 := by
  sorry

end Erdos682
