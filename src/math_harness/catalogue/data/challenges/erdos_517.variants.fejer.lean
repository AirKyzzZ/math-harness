import Mathlib

open Set Filter Topology

namespace Erdos517

theorem erdos_517.variants.fejer {f : ℂ → ℂ} {n : ℕ → ℕ} (hn : HasFejerGaps n) {a : ℕ → ℂ} (ha : ∀ k, a k ≠ 0) (hf : ∀ z, HasSum (fun k => a k * z ^ n k) (f z)) (z : ℂ) :
    {x : ℂ | f x = z}.Infinite := by
  sorry

end Erdos517
