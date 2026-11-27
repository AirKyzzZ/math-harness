import Mathlib

namespace Erdos603

open Cardinal Filter Asymptotics

theorem erdos_603 :
    ∀ C : Cardinal.{0}, ∃ (V : Type) (F : Set (Set V)), (∀ A ∈ F, Cardinal.mk A = ℵ₀) ∧ F.Pairwise (fun (A B : Set V) ↦ Cardinal.mk ↥(A ∩ B) ≠ 2) ∧ ⋃₀ F = Set.univ ∧ ∀ c : V → C.out, ∃ A ∈ F, ∀ x ∈ A, ∀ y ∈ A, c x = c y := by
  sorry

end Erdos603
