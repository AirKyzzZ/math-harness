import Mathlib

open Filter Finset Real

namespace Erdos695

theorem erdos_695_neg :
    ¬ (∀ {q : ℕ → ℕ}, StrictMono q → (∀ i, (q i).Prime) → (∀ i, q (i + 1) % q i = 1) → Tendsto (fun k => (q k : ℝ) ^ (1 / k : ℝ)) atTop atTop) := by
  sorry

end Erdos695
