import Mathlib

open Filter Real

namespace Erdos305

noncomputable def D (a b : ℕ) : ℕ :=
  sInf {B | ∃ E : Finset ℕ, 0 ∉ E ∧ (∀ n ∈ E, n ≤ B) ∧
    ∑ n ∈ E, (1 : ℚ) / n = a / b}

noncomputable def Dmax (b : ℕ) : ℕ := (Finset.Ico 1 b).sup fun a ↦ D a b

theorem erdos_305.variants.prime_lower_bound :
    ∃ c : ℝ, 0 < c ∧ ∀ᶠ p : ℕ in atTop, p.Prime → c * p * log p ≤ Dmax p := by
  sorry

end Erdos305
