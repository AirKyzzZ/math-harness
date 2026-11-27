import Mathlib

open Cardinal Order

open scoped Cardinal

namespace Erdos1119

theorem erdos_1119.variants.erdos_wetzel_ch (h : 𝔠 = ℵ_ 1) :
    ∃ F : Set (ℂ → ℂ), (∀ f ∈ F, Differentiable ℂ f) ∧ (∀ z₀ : ℂ, {y : ℂ | ∃ f ∈ F, f z₀ = y}.Countable) ∧ ¬ F.Countable := by
  sorry

theorem erdos_1119.test.empty_family (m : Cardinal.{0}) (_hm : ℵ₀ < m) :
    (∀ f ∈ (∅ : Set (ℂ → ℂ)), Differentiable ℂ f) ∧
    (∀ z₀ : ℂ, #{y : ℂ | ∃ f ∈ (∅ : Set (ℂ → ℂ)), f z₀ = y} ≤ m) ∧
    #(∅ : Set (ℂ → ℂ)) ≤ m := by
  refine ⟨fun f hf => absurd hf (Set.notMem_empty f), fun z₀ => ?_, ?_⟩
  · simp
  · simp

end Erdos1119
