import Mathlib

open Filter

namespace Erdos126

def IsMaximalAddFactorsCard (f : ℕ → ℕ) : Prop := ∀ n,
    IsGreatest
      { m | ∀ (A : Finset ℕ), A.card = n →
        m ≤ (∏ ⟨a, b⟩ ∈ A.offDiag, (a + b)).primeFactors.card}
      (f n)

theorem erdos_126.variants.IsBigO (f : ℕ → ℕ) (hf : IsMaximalAddFactorsCard f) :
    ((fun (n : ℕ) => Real.log n) =O[atTop] fun (n : ℕ) => (f n : ℝ)) ∧ (fun (n : ℕ) => (f n : ℝ)) =O[atTop] fun (n : ℕ) => n / Real.log n := by
  sorry

end Erdos126
