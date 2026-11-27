import Mathlib

open Filter Asymptotics Topology

namespace Erdos309

noncomputable def F (N : ℕ) : ℕ :=
  {m : ℕ | ∃ A : Finset ℕ, A ⊆ Finset.Icc 1 N ∧ ∑ n ∈ A, (1 / n : ℚ) = m}.ncard

theorem erdos_309.variants.asymptotic :
    Tendsto (fun N : ℕ => (F N : ℝ) / Real.log N) atTop (𝓝 1) := by
  sorry

end Erdos309
