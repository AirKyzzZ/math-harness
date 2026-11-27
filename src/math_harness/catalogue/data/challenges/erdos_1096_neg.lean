import Mathlib

open Filter

open scoped Topology

namespace Erdos1096

theorem erdos_1096_neg :
    ¬ (∃ ε > 0, ∀ q, 1 < q → q < 1 + ε → ∀ x : ℕ → ℝ, StrictMono x → Set.range x = { ∑ i ∈ S, q ^ i | S : Finset ℕ } → Tendsto (fun k => x (k + 1) - x k) atTop (𝓝 0)) := by
  sorry

-- TODO: add variants and additional material from the Erdős Problems page.

end Erdos1096
