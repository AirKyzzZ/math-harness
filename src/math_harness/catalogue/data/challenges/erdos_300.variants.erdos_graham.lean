import Mathlib

open Filter Topology

namespace Erdos300

noncomputable def A (N : ℕ) : ℕ :=
  sSup {m : ℕ | ∃ B : Finset ℕ, B ⊆ Finset.Icc 1 N ∧ (∀ S ⊆ B, ∑ n ∈ S, (1 / n : ℚ) ≠ 1) ∧
    B.card = m}

theorem erdos_300.variants.erdos_graham :
    ¬ Tendsto (fun N : ℕ => (A N : ℝ) / N) atTop (𝓝 1) := by
  sorry

end Erdos300
