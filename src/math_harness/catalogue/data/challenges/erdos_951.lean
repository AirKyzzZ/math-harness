import Mathlib

open scoped Finsupp Nat.Prime Topology

open Filter

namespace Erdos951

def Erdos951Prop (a : ℕ → ℝ) : Prop :=
  ∀ (k ℓ : ℕ →₀ ℕ), k ≠ ℓ → |beurlingInteger a k - beurlingInteger a ℓ| ≥ 1

theorem erdos_951.variants.isBeurlingPrimes {a : ℕ → ℝ} (ha : 1 < a 0)
    (hm : StrictMono a) (he : Erdos951Prop a) :
    IsBeurlingPrimes a := by
  refine ⟨ha, hm, tendsto_atTop_atTop.2 fun x => ?_⟩
  by_contra h_contra
  obtain ⟨L, hL⟩ : ∃ L, Filter.Tendsto a Filter.atTop (𝓝 L) :=
    ⟨_, tendsto_atTop_isLUB hm.monotone (isLUB_ciSup ⟨x, Set.forall_mem_range.2 fun n =>
    le_of_not_ge fun hn => h_contra ⟨n, fun m hm' => hn.trans (hm.monotone hm')⟩⟩)⟩
  obtain ⟨N, hN⟩ := Metric.tendsto_atTop.mp hL (1 / 2) (by norm_num)
  have := hm (by linarith : N < N + 1)
  have h_diff : a (N + 1) - a N ≥ 1 := by
    rw [← abs_of_nonneg (by linarith : 0 ≤ a _ - _)]
    simpa using he (.single (N + 1) 1) (.single N 1) (by simpa [Finsupp.ext_iff] using ⟨N, by simp⟩)
  linarith [abs_lt.1 (hN N le_rfl), abs_lt.1 (hN (N + 1) (by grind))]

theorem erdos_951 :
    ∀ a : ℕ → ℝ, 1 < a 0 → StrictMono a → Erdos951Prop a → ∀ᶠ (x : ℝ) in Filter.atTop, {i : ℕ | a i ≤ x}.ncard ≤ π ⌊x⌋₊ := by
  sorry

end Erdos951
