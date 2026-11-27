import Mathlib

open Filter Topology

namespace Erdos391

noncomputable def t (n : ℕ) : ℕ :=
  sSup {k : ℕ | ∃ a : Fin n → ℕ, ∏ i, a i = n.factorial ∧ ∀ i, k ≤ a i}

theorem erdos_391 :
    Tendsto (fun n : ℕ => (t n : ℝ) / n) atTop (𝓝 (1 / Real.exp 1)) := by
  sorry

end Erdos391
