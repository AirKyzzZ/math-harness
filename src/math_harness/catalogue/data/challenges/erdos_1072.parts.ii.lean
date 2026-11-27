import Mathlib

open Nat Filter Finset Set

open scoped Topology

namespace Erdos1072

noncomputable def f (p : ℕ) : ℕ := sInf {n | (n)! + 1 ≡ 0 [MOD p]}

theorem erdos_1072.parts.ii :
    ∃ (P : Set ℕ), P ⊆ {p | p.Prime} ∧ P.HasDensity 1 {p | p.Prime} ∧ Tendsto (fun p => (f p / p : ℝ)) (atTop ⊓ principal P) (𝓝 0) := by
  sorry

end Erdos1072
