import Mathlib

namespace Erdos273

theorem erdos_273 :
    ∃ c : StrictCoveringSystem ℤ, ∀ i, ∃ (p : ℕ), p.Prime ∧ 5 ≤ p ∧ c.moduli i = Ideal.span {↑(p - 1)} := by
  sorry

theorem erdos_273.variants.three : ∃ c : StrictCoveringSystem ℕ, ∀ i, ∃ p, p.Prime ∧ 3 ≤ p ∧
    c.moduli i = Ideal.span {↑(p - 1)} := by
  -- TODO(Paul-Lez): find reference for this and perhaps formalize the proof?
  sorry

end Erdos273
