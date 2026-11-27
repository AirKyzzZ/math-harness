import Mathlib

open Asymptotics Filter

namespace Erdos3

theorem erdos_3 :
    ∀ A : Set ℕ, (¬ Summable fun a : A ↦ 1 / (a : ℝ)) → ∃ᶠ (k : ℕ) in Filter.atTop, ∃ S ⊆ A, S.IsAPOfLength k := by
  sorry

noncomputable abbrev r := Set.IsAPOfLengthFree.maxCard

end Erdos3
