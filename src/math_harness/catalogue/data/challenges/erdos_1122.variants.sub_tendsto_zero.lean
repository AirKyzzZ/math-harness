import Mathlib

open Filter

open scoped Topology

namespace Erdos1122

theorem erdos_1122.variants.sub_tendsto_zero (f : ℕ → ℝ) (hf : ∀ᵉ (a > 0) (b > 0), a.Coprime b → f (a * b) = f a + f b) (hdiff : Tendsto (fun n ↦ f (n + 1) - f n) atTop (𝓝 0)) :
    ∃ c : ℝ, ∀ n > 0, f n = c * Real.log n := by
  sorry

theorem const_mul_log (c : ℝ) (hc : 0 ≤ c) (f : ℕ → ℝ) (hf : ∀ n, f n = c * Real.log n) :
    (∀ᵉ (a > 0) (b > 0), a.Coprime b → f (a * b) = f a + f b) ∧
      {n | 1 ≤ n ∧ f (n + 1) < f n}.HasDensity 0 := by
  refine ⟨fun a ha b hb _ ↦ ?_, ?_⟩
  · simp only [hf, Nat.cast_mul]
    rw [Real.log_mul (by positivity) (by positivity), mul_add]
  · convert Set.HasDensity.empty
    refine Set.eq_empty_of_forall_notMem fun n ⟨hn, hlt⟩ ↦ hlt.not_ge ?_
    simp only [hf]
    gcongr
    simp

end Erdos1122
