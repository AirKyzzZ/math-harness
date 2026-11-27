import Mathlib

namespace Erdos288

theorem erdos_288 :
    Set.Finite { I : Fin 2 → ℕ+ × ℕ+ | ∀ j, (I j).1 ≤ (I j).2 ∧ ∃ n : ℕ+, (∑ j : Fin 2, ∑ nⱼ ∈ Set.Icc (I j).1 (I j).2, (nⱼ⁻¹ : ℚ)) = n } := by
  sorry

end Erdos288
