import Mathlib

namespace Erdos873

noncomputable abbrev F (a : ℕ → ℕ) (X : ℝ) (k : ℕ) : ℕ∞ :=
  {i : ℕ | (Finset.range k).lcm (fun m => a (i + m)) < X}.encard

theorem erdos_873 :
    ∀ᵉ (a : ℕ → ℕ) (ε > (0 : ℝ)), 0 < a 0 → StrictMono a → ∃ k, ∀ X > 0, F a X k < (X^ε).toEReal := by
  sorry

end Erdos873
