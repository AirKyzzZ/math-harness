import Mathlib

namespace Erdos435

theorem erdos_435 (n : ℕ) (hn : n ≠ 0) (hpk : ∀ p k : ℕ, p.Prime → n ≠ p ^ k) :
    IsGreatest {m : ℤ | ¬ ∃ c : ℕ → ℕ, m = ∑ i ∈ Finset.Ico 1 n, (c i : ℤ) * (n.choose i : ℤ)} ((∑ p ∈ n.primeFactors, (∑ d ∈ Finset.Icc 1 (n.factorization p), (n.choose (p ^ d) : ℤ)) * ((p : ℤ) - 1)) - n) := by
  sorry

end Erdos435
