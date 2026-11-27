import Mathlib

open Filter MeasureTheory

open scoped Topology Polynomial

namespace Erdos1152

theorem erdos_1152_neg :
    ¬ (∀ nodes : ℕ → Finset ℝ, (∀ n, (nodes n).card = n) → (∀ n, ∀ x ∈ nodes n, x ∈ Set.Icc (-1 : ℝ) 1) → ∀ ε : ℕ → ℝ, (∀ n, 0 < ε n) → Tendsto ε atTop (𝓝 0) → ∃ f : ℝ → ℝ, ContinuousOn f (Set.Icc (-1 : ℝ) 1) ∧ ∀ p : ℕ → ℝ[X], (∀ n : ℕ, 1 ≤ n → ((p n).natDegree : ℝ) < (1 + ε n) * n) → (∀ n, ∀ x ∈ nodes n, (p n).eval x = f x) → ∀ᵐ t ∂(volume.restrict (Set.Icc (-1 : ℝ) 1)), ¬ Tendsto (fun n => (p n).eval t) atTop (𝓝 (f t))) := by
  sorry

end Erdos1152
