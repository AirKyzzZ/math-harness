import Mathlib

open Filter

open scoped Asymptotics Nat.Prime

namespace Erdos950

noncomputable def f (n : ℕ) : ℝ :=
  ∑ p ∈ (Finset.range n).filter Prime, (1 : ℝ) / (n - p : ℝ)

theorem erdos_950.variants.debruijn_erdos_turan :
    (fun x : ℕ ↦ ∑ n ∈ Finset.range x, f n) ~[atTop] (fun x : ℕ ↦ (x : ℝ)) ∧ (fun x : ℕ ↦ ∑ n ∈ Finset.range x, (f n) ^ 2) ~[atTop] (fun x : ℕ ↦ (x : ℝ)) := by
  sorry

end Erdos950
