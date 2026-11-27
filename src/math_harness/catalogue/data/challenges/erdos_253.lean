import Mathlib

namespace Erdos253

open scoped Topology

@[inline]
def RepresentsAPs (a : ℕ → ℕ) : Prop :=
    StrictMono a ∧ ∀ l, l.IsAPOfLength ⊤ → (subsetSums (Set.range a) ∩ l).Infinite

theorem erdos_253 :
    ¬ ∀ a : ℕ → ℕ, 0 < a 0 → RepresentsAPs a → (Filter.atTop.Tendsto (fun n ↦ (a <| n + 1 : ℝ) / a n) (𝓝 1)) → subsetSums (Set.range a) ∈ Filter.cofinite := by
  sorry

end Erdos253
