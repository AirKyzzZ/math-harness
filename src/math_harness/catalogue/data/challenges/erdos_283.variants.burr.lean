import Mathlib

open Filter Polynomial Finset

namespace Erdos283

def Condition (p : ℚ[X]) : Prop :=
  (∀ n : ℤ, ∃ z : ℤ, p.eval (n : ℚ) = z) → p.leadingCoeff > 0 →
  ¬ (∃ d : ℤ, d ≥ 2 ∧ ∀ n : ℤ, n ≥ 1 → ∃ z : ℤ, p.eval (n : ℚ) = d * z) →
  ∀ᶠ (m : ℤ) in atTop, ∃ k ≥ 1, ∃ n : Fin (k + 1) → ℤ, 0 = n 0 ∧ StrictMono n ∧
  1 = ∑ i ∈ Finset.Icc 1 (Fin.last k), (1 : ℚ) / (n i) ∧
  (m : ℚ) = ∑ i ∈ Finset.Icc 1 (Fin.last k), p.eval (n i : ℚ)

theorem erdos_283.variants.burr :
    ∀ (k : ℕ), k ≥ 1 → ∀ᶠ (m : ℕ) in atTop, ∃ M : Multiset ℕ, (∀ n ∈ M, 1 ≤ n) ∧ (M.map (fun n ↦ 1 / (n : ℚ))).sum = 1 ∧ (M.map (fun n ↦ (n : ℤ)^k)).sum = (m : ℤ) := by
  sorry

end Erdos283
