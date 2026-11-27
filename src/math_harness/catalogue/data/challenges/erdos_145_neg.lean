import Mathlib

namespace Erdos145

open Filter

open scoped Topology

noncomputable abbrev s (n : ℕ) : ℕ := Nat.nth Squarefree n

noncomputable abbrev A (x : ℝ) : Finset ℕ :=
  (Finset.Icc 0 ⌊x⌋₊).preimage s (Nat.nth_injective Nat.squarefree_infinite).injOn

theorem erdos_145_neg :
    ¬ (∀ α ≥ (0 : ℝ), ∃ β : ℝ, atTop.Tendsto (fun x : ℝ ↦ 1 / x * ∑ n ∈ A x, (s (n + 1) - s n : ℝ) ^ α) (𝓝 β)) := by
  sorry

end Erdos145
