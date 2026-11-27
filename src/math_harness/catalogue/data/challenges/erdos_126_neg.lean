import Mathlib

open Filter

namespace Erdos126

def IsMaximalAddFactorsCard (f : ℕ → ℕ) : Prop := ∀ n,
    IsGreatest
      { m | ∀ (A : Finset ℕ), A.card = n →
        m ≤ (∏ ⟨a, b⟩ ∈ A.offDiag, (a + b)).primeFactors.card}
      (f n)

theorem erdos_126_neg :
    ¬ (∀ (f : ℕ → ℕ), IsMaximalAddFactorsCard f → Tendsto (fun n => f n / Real.log n) atTop atTop) := by
  sorry

end Erdos126
