import Mathlib

namespace Erdos694

open Filter Topology Real

theorem erdos_694 :
    ∀ᵉ (fmax : ℕ → ℕ) (fmin : ℕ → ℕ), (∀ n, (∃ m, Nat.totient m = n) → IsGreatest (Nat.totient ⁻¹' {n}) (fmax n)) → (∀ n, (∃ m, Nat.totient m = n) → IsLeast (Nat.totient ⁻¹' {n}) (fmin n)) → ∃ o : ℕ → ℝ, Tendsto o atTop (𝓝 0) ∧ ∀ᶠ x : ℕ in atTop, sSup { (fmax n : ℝ) / fmin n | (n : ℕ) (_ : n ≤ x) (_ : ∃ m, Nat.totient m = n) } = (exp eulerMascheroniConstant + o x) * log (log (x : ℝ)) := by
  sorry

end Erdos694
