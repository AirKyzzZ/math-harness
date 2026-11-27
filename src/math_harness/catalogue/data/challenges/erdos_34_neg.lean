import Mathlib

namespace Erdos34

open scoped BigOperators

def consecutiveSums (n : ℕ) (p : Equiv.Perm (Fin n)) : Finset ℕ :=
  (Finset.univ.filter (fun x : Fin n × Fin n => x.1 ≤ x.2)).image
    (fun x => ∑ k ∈ Finset.Icc x.1 x.2, ((p k : ℕ) + 1))

theorem erdos_34_neg :
    ¬ (¬ ∀ c : ℝ, 0 < c → ∃ N : ℕ, ∀ n ≥ N, ∀ p : Equiv.Perm (Fin n), ((consecutiveSums n p).card : ℝ) < c * (n : ℝ) ^ 2) := by
  sorry

end Erdos34
