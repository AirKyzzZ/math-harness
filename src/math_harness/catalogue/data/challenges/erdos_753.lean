import Mathlib

namespace Erdos753

open SimpleGraph

theorem erdos_753 :
    ¬ ∃ c : ℝ, 0 < c ∧ ∀ n : ℕ, 0 < n → ∀ G : SimpleGraph (Fin n), (n : ℝ) ^ ((1 : ℝ) / 2 + c) < (listChromaticNumber G : ℝ) + (listChromaticNumber Gᶜ : ℝ) := by
  sorry

end Erdos753
