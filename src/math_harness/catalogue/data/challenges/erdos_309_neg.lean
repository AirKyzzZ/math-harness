import Mathlib

open Filter Asymptotics Topology

namespace Erdos309

noncomputable def F (N : ℕ) : ℕ :=
  {m : ℕ | ∃ A : Finset ℕ, A ⊆ Finset.Icc 1 N ∧ ∑ n ∈ A, (1 / n : ℚ) = m}.ncard

theorem erdos_309_neg :
    ¬ (¬ (fun N : ℕ => (F N : ℝ)) =o[atTop] fun N : ℕ => Real.log N) := by
  sorry

end Erdos309
