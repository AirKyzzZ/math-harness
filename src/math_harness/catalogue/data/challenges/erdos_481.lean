import Mathlib

namespace Erdos481

def T {r : ℕ} (a b : Fin r → ℕ) (A : List ℕ) : List ℕ :=
  (List.finRange r).flatMap (fun i : Fin r => A.map (fun x : ℕ => a i * x + b i))

theorem erdos_481 {r : ℕ} (a b : Fin r → ℕ) (ha : ∀ i, 0 < a i) (hab : 1 < ∑ i, (1 : ℝ) / a i) :
    ∃ k, ¬ ((T a b)^[k] [1]).Nodup := by
  sorry

end Erdos481
