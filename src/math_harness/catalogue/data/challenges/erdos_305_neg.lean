import Mathlib

open Filter Real

namespace Erdos305

noncomputable def D (a b : ℕ) : ℕ :=
  sInf {B | ∃ E : Finset ℕ, 0 ∉ E ∧ (∀ n ∈ E, n ≤ B) ∧
    ∑ n ∈ E, (1 : ℚ) / n = a / b}

noncomputable def Dmax (b : ℕ) : ℕ := (Finset.Ico 1 b).sup fun a ↦ D a b

theorem erdos_305_neg :
    ¬ (∃ δ : ℕ → ℝ, Tendsto δ atTop (nhds 0) ∧ ∃ C : ℝ, 0 < C ∧ ∀ᶠ b : ℕ in atTop, (Dmax b : ℝ) ≤ C * b * (log b) ^ (1 + δ b)) := by
  sorry

end Erdos305
