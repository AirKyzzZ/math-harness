import Mathlib

open Filter

namespace Erdos21

def IsErdosLovaszFamily (n : ℕ) (F : Finset (Finset ℕ)) : Prop :=
  (∀ A ∈ F, A.card = n) ∧ (∀ A ∈ F, ∀ B ∈ F, (A ∩ B).Nonempty) ∧
    ∀ S : Finset ℕ, S.card ≤ n - 1 → ∃ A ∈ F, Disjoint S A

noncomputable def f (n : ℕ) : ℕ :=
  sInf {m : ℕ | ∃ F : Finset (Finset ℕ), IsErdosLovaszFamily n F ∧ F.card = m}

theorem erdos_21.variants.three_n_neg :
    ¬ (∃ C : ℕ, ∀ᶠ n : ℕ in atTop, f n ≤ 3 * n + C ∧ 3 * n ≤ f n + C) := by
  sorry

end Erdos21
