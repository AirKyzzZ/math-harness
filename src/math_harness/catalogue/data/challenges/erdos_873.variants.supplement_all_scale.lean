import Mathlib

namespace Erdos873

noncomputable abbrev F (a : ℕ → ℕ) (X : ℝ) (k : ℕ) : ℕ∞ :=
  {i : ℕ | (Finset.range k).lcm (fun m => a (i + m)) < X}.encard

theorem erdos_873.variants.supplement_all_scale :
    ¬ ∃ (a : ℕ → ℕ) (c : ℝ), 0 < a 0 ∧ StrictMono a ∧ 0 < c ∧ ∀ᶠ X : ℝ in Filter.atTop, (c * X ^ (1 / 3 : ℝ) * Real.log X).toEReal ≤ (F a X 3 : EReal) := by
  sorry

end Erdos873
