import Mathlib

open Asymptotics Filter

namespace Erdos3

noncomputable abbrev r := Set.IsAPOfLengthFree.maxCard

theorem erdos_3.variants.three :
    ∀ A : Set ℕ, (¬ Summable fun a : A ↦ 1 / (a : ℝ)) → ∃ S ⊆ A, S.IsAPOfLength 3 := by
  sorry

end Erdos3
