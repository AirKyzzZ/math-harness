import Mathlib

open scoped Nat

open Filter Real Set

namespace Erdos516

def OfFiniteOrder {E F: Type*} [NormedAddCommGroup E] [NormedSpace ℂ E]
    [NormedAddCommGroup F] [NormedSpace ℂ F] (f : E → F) : Prop :=
  Differentiable ℂ f ∧ ∃ c ≥ 0, ∃ a ≥ 0, ∀ z, ‖f z‖ ≤ c * rexp (‖z‖ ^ a)

noncomputable def ratio (r : ℝ) (f : ℂ → ℂ) : ℝ :=
  (⨅ z : {z : ℂ // ‖z‖ = r}, ‖f z‖).log / (⨆ z : {z : ℂ // ‖z‖ = r}, ‖f z‖).log

theorem erdos_516.variants.limsup_ratio_eq_one {f : ℂ → ℂ} {n : ℕ → ℕ} (hmono : StrictMono n) (hn : ∃ c > (0 : ℝ), ∀ k, n k > k * log k ^ (2 + c)) {a : ℕ → ℂ} (ha : ∀ n, a n ≠ 0) (hfn : ∀ z, HasSum (fun k => a k * z ^ n k) (f z)) :
    limsup (fun r => ratio r f) atTop = 1 := by
  sorry

end Erdos516
