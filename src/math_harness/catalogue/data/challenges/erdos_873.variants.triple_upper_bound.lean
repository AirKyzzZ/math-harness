import Mathlib

namespace Erdos873

noncomputable abbrev F (a : ℕ → ℕ) (X : ℝ) (k : ℕ) : ℕ∞ :=
  {i : ℕ | (Finset.range k).lcm (fun m => a (i + m)) < X}.encard

theorem erdos_873.variants.triple_upper_bound :
    ∃ C : ℝ, 0 < C ∧ ∀ (a : ℕ → ℕ), 0 < a 0 → StrictMono a → ∀ᶠ X : ℝ in Filter.atTop, (F a X 3 : EReal) ≤ (C * X ^ (1 / 3 : ℝ) * Real.log X).toEReal := by
  sorry

end Erdos873
