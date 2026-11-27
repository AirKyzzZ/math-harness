import Mathlib

open Finset

namespace Erdos1198

theorem erdos_1198.variants.hindman :
    ∀ c : ℕ → Fin 2, ∃ a : ℕ → ℕ, StrictMono a ∧ 0 < a 0 ∧ ∃ col : Fin 2, ∀ T : Finset ℕ, T.Nonempty → c (∑ i ∈ T, a i) = col := by
  sorry

end Erdos1198
