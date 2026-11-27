import Mathlib

open Finset Filter

namespace Erdos156

noncomputable def minMaximalSidonSet (N : ℕ) : ℕ :=
  open scoped Classical in
  sInf (((Icc 1 N).powerset.filter fun (A : Finset ℕ) ↦
    Set.IsMaximalSidonSetIn (A : Set ℕ) N).image card : Set ℕ)

theorem erdos_156_neg :
    ¬ ((fun N ↦ (minMaximalSidonSet N : ℝ)) =O[atTop] (fun N ↦ (N : ℝ) ^ (1 / 3 : ℝ))) := by
  sorry

theorem greedySidonSet_isSidon (n : ℕ) : IsSidon (Finset.greedySidonBelow n : Set ℕ) := by
  intro i₁ hi₁ j₁ hj₁ i₂ hi₂ j₂ hj₂ eq
  have subset : Finset.greedySidonBelow n ⊆ (Finset.greedySidon.aux n).1 := Finset.filter_subset _ _
  exact (Finset.greedySidon.aux n).1.2 i₁ (subset hi₁) j₁ (subset hj₁) i₂ (subset hi₂) j₂ (subset hj₂) eq

end Erdos156
