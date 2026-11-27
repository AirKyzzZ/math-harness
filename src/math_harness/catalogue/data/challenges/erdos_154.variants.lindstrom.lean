import Mathlib

open Filter Finset

open scoped Pointwise

namespace Erdos154

theorem erdos_154.variants.lindstrom :
    ∀ (m : ℕ) (hm : 2 ≤ m) (N : ℕ → ℕ) (A : ℕ → Finset ℕ), Tendsto (fun k => (N k : ℝ)) atTop atTop → (∀ k, ∀ x ∈ A k, x ≤ N k) → (∀ k, IsSidon (A k : Set ℕ)) → Tendsto (fun k => ((A k).card : ℝ) / Real.sqrt (N k)) atTop (nhds 1) → ∀ i < m, Tendsto (fun k => (((A k).filter (fun a => a % m = i)).card : ℝ) / Real.sqrt (N k)) atTop (nhds (1 / m)) := by
  sorry

end Erdos154
