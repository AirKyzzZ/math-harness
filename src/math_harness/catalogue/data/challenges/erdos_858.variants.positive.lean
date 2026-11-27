import Mathlib

open Filter Real

namespace Erdos858

def IsAdmissible (A : Finset ℕ) : Prop :=
  ∀ a ∈ A, ∀ b ∈ A, ∀ t : ℕ, a * t = b → t.minFac ≤ a

noncomputable def M (N : ℕ) : ℝ :=
  sSup {m | ∃ A ⊆ Finset.Icc 1 N, IsAdmissible A ∧ ∑ n ∈ A, (1 : ℝ) / n = m}

theorem erdos_858.variants.positive :
    ∃ c : ℝ, 0 < c ∧ Tendsto (fun N : ℕ ↦ M N / log N) atTop (nhds c) := by
  sorry

end Erdos858
