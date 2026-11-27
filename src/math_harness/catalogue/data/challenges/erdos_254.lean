import Mathlib

open Filter Set

namespace Erdos254

def IsSumOfDistinct (A : Set ℕ) (n : ℕ) : Prop :=
  ∃ S : Finset ℕ, (S : Set ℕ) ⊆ A ∧ S.sum (fun x ↦ x) = n

theorem not_summable_iff_tendsto_partial_sums (A : Set ℕ) (θ : ℝ) :
    ¬ Summable (fun n : A ↦ distToNearestInt (θ * (n : ℝ))) ↔
      Tendsto (fun N : ℕ =>
          ∑ n ∈ Finset.range N, A.indicator (fun n => distToNearestInt (θ * (n : ℝ))) n)
        atTop atTop :=
  not_summable_subtype_iff_tendsto_sum_indicator
    (f := fun m : ℕ => distToNearestInt (θ * (m : ℝ))) fun _ => distToNearestInt_nonneg _

theorem erdos_254 :
    ∀ (A : Set ℕ), (Tendsto (fun x : ℕ ↦ (A ∩ Icc 1 (2 * x)).ncard - (A ∩ Icc 1 x).ncard) atTop atTop) ∧ (∀ θ : ℝ, 0 < θ → θ < 1 → ¬ Summable (fun n : A ↦ distToNearestInt (θ * (n : ℝ)))) → ∀ᶠ m in atTop, IsSumOfDistinct A m := by
  sorry

end Erdos254
