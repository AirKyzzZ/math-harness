import Mathlib

namespace Erdos845

theorem erdos_845 :
    ¬ ∀ᵉ (C : ℝ) (hC : 0 < C), let f : ℕ × ℕ → ℕ := fun (k, l) ↦ 2 ^ k * 3 ^ l { ∑ x ∈ B, f x | (B : Finset (ℕ × ℕ)) (h : B.Nonempty) (hB : B.sup f ≤ C * B.inf' h f) }.HasDensity 0 := by
  sorry

end Erdos845
