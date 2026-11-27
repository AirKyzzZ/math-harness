import Mathlib

open Filter

namespace Erdos494

noncomputable def sumMultiset (A : Finset ℂ) (k : ℕ) : Multiset ℂ :=
  (A.powersetCard k).val.map fun s => s.sum id

def Erdos494Unique (k : ℕ) (card : ℕ) :=
  ∀ A B : Finset ℂ, A.card = card → B.card = card → sumMultiset A k = sumMultiset B k → A = B

noncomputable def prodMultiset (A : Finset ℂ) (k : ℕ) : Multiset ℂ :=
  ((A.powersetCard k).val.map (fun s => s.prod id))

theorem erdos_494.variants.product :
    ∃ (A B : Finset ℂ), 3 < A.card ∧ A.card = B.card ∧ (0 : ℂ) ∉ A ∧ (0 : ℂ) ∉ B ∧ prodMultiset A 3 = prodMultiset B 3 ∧ A ≠ B := by
  sorry

end Erdos494
