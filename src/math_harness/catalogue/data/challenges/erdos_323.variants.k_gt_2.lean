import Mathlib

open Filter

open scoped Asymptotics

namespace Erdos323

noncomputable def f (k m x : ℕ) : ℕ :=
  { n : ℕ | n ≤ x ∧ ∃ (v : Fin m → ℕ), n = ∑ i, v i ^ k }.ncard

theorem erdos_323.variants.k_gt_2 :
    ∀ k > 2, (fun (x : ℕ) ↦ (f k k x : ℝ)) =o[atTop] (fun (x : ℕ) ↦ (x : ℝ)) := by
  sorry

end Erdos323
