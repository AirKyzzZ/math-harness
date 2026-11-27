import Mathlib

open Filter Real

open scoped BigOperators

namespace Erdos968

noncomputable def u (n : ℕ) : ℝ :=
  (n.nth Nat.Prime : ℝ) / (n + 1)

theorem erdos_968.variants.sum_abs_diff_isTheta_log_sq :
    (fun x : ℕ => ∑ n < Nat.primeCounting' x, |u (n + 1) - u n|) =Θ[atTop] fun x : ℕ => log x ^ 2 := by
  sorry

end Erdos968
