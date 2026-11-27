import Mathlib

open Filter SimpleGraph

namespace Erdos720

noncomputable abbrev sizeRamseyNumber {V : Type*} [Fintype V] (G : SimpleGraph V) : ℕ :=
  sizeRamsey G G

theorem erdos_720.variants.beck :
    ∃ C : ℕ, ∀ᶠ n : ℕ in atTop, sizeRamseyNumber (pathGraph (n + 1)) ≤ C * n ∧ sizeRamseyNumber (cycleGraph n) ≤ C * n := by
  sorry

end Erdos720
