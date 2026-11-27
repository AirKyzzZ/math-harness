import Mathlib

open Filter

open scoped Topology

namespace Erdos967

noncomputable def summand (t : ℝ) (n : ℕ) : ℂ := 1 / (n : ℂ) ^ (1 + t * Complex.I : ℂ)

theorem erdos_967.variants.tauberian (a : ℕ → ℕ) (ha : StrictMono a) (ha₀ : 1 < a 0) (hsum : Summable (fun k : ℕ => 1 / (a k : ℝ))) :
    (∀ t : ℝ, 1 + (∑' k, summand t (a k)) ≠ 0) ↔ ∀ f : ℝ → ℝ, Monotone f → (∀ x : ℝ, 0 ≤ f x) → (∀ x < 1, f x = 0) → (∀ x y : ℝ, BddAbove (f '' Set.Icc x y)) → Tendsto (fun x : ℝ => (f x + ∑' k, f (x / (a k : ℝ))) / x) atTop (𝓝 (1 + ∑' k, 1 / (a k : ℝ))) → Tendsto (fun x : ℝ => f x / x) atTop (𝓝 1) := by
  sorry

end Erdos967
