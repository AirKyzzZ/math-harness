import Mathlib

open Filter

namespace Erdos690

def kthPrimeFactorSet (k p : ℕ) : Set ℕ :=
  {n | 0 < n ∧ p ∈ n.primeFactors ∧ (n.primeFactors.filter (· < p)).card = k - 1}

def IsUnimodalOnPrimes (f : ℕ → ℝ) : Prop :=
  ∃ m, m.Prime ∧ (∀ p q, p.Prime → q.Prime → p ≤ q → q ≤ m → f p ≤ f q) ∧
    ∀ p q, p.Prime → q.Prime → m ≤ p → p ≤ q → f q ≤ f p

theorem erdos_690.variants.hasDensity (k p : ℕ) (hk : 1 ≤ k) (hp : p.Prime) :
    ∃ δ : ℝ, (kthPrimeFactorSet k p).HasDensity δ := by
  sorry

end Erdos690
