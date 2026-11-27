import Mathlib

namespace Erdos540

def HasZeroSubsetSum {G : Type*} [AddCommMonoid G] (A : Finset G) : Prop :=
  ∃ S : Finset G, S ⊆ A ∧ S.Nonempty ∧ S.sum id = 0

theorem erdos_540_neg :
    ¬ (∃ C : ℝ, 0 < C ∧ ∀ (N : ℕ), 0 < N → ∀ A : Finset (ZMod N), C * Real.sqrt N ≤ A.card → HasZeroSubsetSum A) := by
  sorry

end Erdos540
