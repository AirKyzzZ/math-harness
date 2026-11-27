import Mathlib

open Filter Real AdditiveCombinatorics

namespace Erdos772

noncomputable def H (k n : ℕ) : ℕ :=
  sSup {r | r ≤ n ∧ ∀ A : Finset ℕ, A.card = n → (∀ m, sumRep A m ≤ k) →
    ∃ S ⊆ A, IsSidon (S : Set ℕ) ∧ r ≤ S.card}

theorem erdos_772.parts.i_neg :
    ¬ (∀ k ≥ 1, Tendsto (fun n : ℕ ↦ (H k n : ℝ) / √n) atTop atTop) := by
  sorry

end Erdos772
