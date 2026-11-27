import Mathlib

open Filter

namespace Erdos21

def IsErdosLovaszFamily (n : ℕ) (F : Finset (Finset ℕ)) : Prop :=
  (∀ A ∈ F, A.card = n) ∧ (∀ A ∈ F, ∀ B ∈ F, (A ∩ B).Nonempty) ∧
    ∀ S : Finset ℕ, S.card ≤ n - 1 → ∃ A ∈ F, Disjoint S A

noncomputable def f (n : ℕ) : ℕ :=
  sInf {m : ℕ | ∃ F : Finset (Finset ℕ), IsErdosLovaszFamily n F ∧ F.card = m}

theorem erdos_21.variants.small_values :
    f 1 = 1 ∧ f 2 = 3 ∧ f 3 = 6 ∧ f 4 = 9 ∧ f 5 = 13 := by
  sorry

end Erdos21
