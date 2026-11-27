import Mathlib

open Filter Real

namespace Erdos305

noncomputable def D (a b : ℕ) : ℕ :=
  sInf {B | ∃ E : Finset ℕ, 0 ∉ E ∧ (∀ n ∈ E, n ≤ B) ∧
    ∑ n ∈ E, (1 : ℚ) / n = a / b}

noncomputable def Dmax (b : ℕ) : ℕ := (Finset.Ico 1 b).sup fun a ↦ D a b

theorem erdos_305.variants.liu_sawhney :
    ∃ C K : ℝ, 0 < C ∧ ∀ᶠ b : ℕ in atTop, (Dmax b : ℝ) ≤ C * b * log b * log (log b) ^ 3 * log (log (log b)) ^ K := by
  sorry

end Erdos305
