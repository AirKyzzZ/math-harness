import Mathlib

open Filter

namespace Erdos494

noncomputable def sumMultiset (A : Finset ℂ) (k : ℕ) : Multiset ℂ :=
  (A.powersetCard k).val.map fun s => s.sum id

def Erdos494Unique (k : ℕ) (card : ℕ) :=
  ∀ A B : Finset ℂ, A.card = card → B.card = card → sumMultiset A k = sumMultiset B k → A = B

theorem erdos_494.variants.k_eq_2_card_pow_two :
    ∀ card : ℕ, (∃ l : ℕ, card = 2 ^ l) → ¬Erdos494Unique 2 card := by
  sorry

noncomputable def prodMultiset (A : Finset ℂ) (k : ℕ) : Multiset ℂ :=
  ((A.powersetCard k).val.map (fun s => s.prod id))

end Erdos494
