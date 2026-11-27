import Mathlib

open Filter

namespace Erdos888

def RequiredCondition (A : Finset ℕ) (n : ℕ) : Prop :=
  A ⊆ Finset.Ioc 0 n ∧ ∀ᵉ (a ∈ A) (b ∈ A) (c ∈ A) (d ∈ A),
  a ≤ b → b ≤ c → c ≤ d → IsSquare (a * b * c * d) → a * d = b * c

def p (n : ℕ) (k : ℕ) : Prop := ∃ A : Finset ℕ, RequiredCondition A n ∧ A.card = k

open scoped Classical in
theorem erdos_888 :
    (fun n : ℕ ↦ (Nat.findGreatest (p n) n : ℝ)) =Θ[atTop] (fun n : ℕ ↦ (n : ℝ) * Real.log (Real.log n) / Real.log n) := by
  sorry

end Erdos888
