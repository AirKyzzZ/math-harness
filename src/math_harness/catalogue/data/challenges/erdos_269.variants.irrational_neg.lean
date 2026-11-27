import Mathlib

namespace Erdos269

def HasPrimeFactorsIn (P : Set ℕ) (n : ℕ) : Prop :=
  n > 0 ∧ ∀ p, p.Prime → p ∣ n → p ∈ P

noncomputable def a (P : Set ℕ) : ℕ → ℕ := Nat.nth <| HasPrimeFactorsIn P

noncomputable def partialLcm (P : Set ℕ) (n : ℕ) : ℕ :=
  -- We take the LCM of `{a P 0, ..., a P n}`.
  (Finset.range n).lcm (a P)

noncomputable def series (P : Set ℕ) : ℝ :=  ∑' n, (1 : ℝ) / (partialLcm P n)

theorem erdos_269.variants.irrational_neg :
    ¬ (∀ᵉ (P : Finset ℕ) (h : ∀ p ∈ P, p.Prime) (h_card : P.card ≥ 2), Irrational (series (P : Set ℕ))) := by
  sorry

end Erdos269
