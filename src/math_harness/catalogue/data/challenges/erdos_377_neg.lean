import Mathlib

open Filter

open scoped Topology

namespace Erdos377

noncomputable abbrev sumInvPrimesNotDvdCentralBinom (n : ℕ) : ℝ :=
  ∑ p ∈ Finset.Icc 1 n with p.Prime, if p ∣ n.centralBinom then 0 else (1 : ℝ) / p

theorem erdos_377_neg :
    ¬ (∃ C > (0 : ℝ), ∀ (n : ℕ), sumInvPrimesNotDvdCentralBinom n ≤ C) := by
  sorry

end Erdos377
