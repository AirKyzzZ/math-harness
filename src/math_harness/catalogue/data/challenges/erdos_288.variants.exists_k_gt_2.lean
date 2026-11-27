import Mathlib

namespace Erdos288

theorem erdos_288.variants.exists_k_gt_2 :
    ∃ k > 2, Set.Finite { I : Fin k → ℕ+ × ℕ+ | ∀ j, (I j).1 ≤ (I j).2 ∧ ∃ n : ℕ+, (∑ j : Fin k, ∑ nⱼ ∈ Set.Icc (I j).1 (I j).2, (nⱼ⁻¹ : ℚ)) = n } := by
  sorry

end Erdos288
