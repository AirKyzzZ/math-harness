import Mathlib

open Filter

namespace Erdos284

def IsRepresentation (k : ℕ) (n : Fin k → ℕ) : Prop :=
  StrictMono n ∧ 0 ∉ Set.range n ∧ 1 = ∑ i, (1 : ℝ) / n i

def firstDenominators (k : ℕ) : Set ℕ :=
  {m | ∃ (hk : 0 < k) (n : Fin k → ℕ), IsRepresentation k n ∧ n ⟨0, hk⟩ = m}

noncomputable def f (k : ℕ) : ℕ :=
  sSup (firstDenominators k)

theorem erdos_284_neg :
    ¬ (Tendsto (fun k : ℕ ↦ (f k : ℝ) / k) atTop (nhds (1 / (Real.exp 1 - 1)))) := by
  sorry

end Erdos284
