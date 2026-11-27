import Mathlib

open scoped Nat

open Filter Real Set

namespace Erdos516

def OfFiniteOrder {E F: Type*} [NormedAddCommGroup E] [NormedSpace ℂ E]
    [NormedAddCommGroup F] [NormedSpace ℂ F] (f : E → F) : Prop :=
  Differentiable ℂ f ∧ ∃ c ≥ 0, ∃ a ≥ 0, ∀ z, ‖f z‖ ≤ c * rexp (‖z‖ ^ a)

noncomputable def ratio (r : ℝ) (f : ℂ → ℂ) : ℝ :=
  (⨅ z : {z : ℂ // ‖z‖ = r}, ‖f z‖).log / (⨆ z : {z : ℂ // ‖z‖ = r}, ‖f z‖).log

theorem erdos_516 {f : ℂ → ℂ} {n : ℕ → ℕ} (hn : HasFabryGaps n) {a : ℕ → ℂ} (ha : ∀ n, a n ≠ 0) (hfn : ∀ z, HasSum (fun k => a k * z ^ n k) (f z)) (hf : OfFiniteOrder f) :
    limsup (fun r => ratio r f) atTop = 1 := by
  sorry

end Erdos516
