import Mathlib

open Filter

namespace Erdos155

noncomputable abbrev F (N : ℕ) : ℕ := Finset.maxSidonSubsetCard (Finset.Icc 1 N)

theorem erdos_155_neg :
    ¬ (∀ k ≥ 1, ∀ᶠ N in atTop, F (N + k) ≤ F N + 1) := by
  sorry

-- TODO: This may even hold with $k \approx ε * N ^ (1 / 2)$.

end Erdos155
