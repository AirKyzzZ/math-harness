import Mathlib

open Set MeasureTheory

open scoped Cardinal ENNReal

namespace Erdos501

theorem erdos_501.variants.hechler_CH :
    (ℵ₁ = 𝔠) → ∃ (A : ℝ → Set ℝ), (∀ x, Bornology.IsBounded (A x)) ∧ (∀ x, volume.toOuterMeasure (A x) < 1) ∧ ¬ ∃ X : Set ℝ, X.Infinite ∧ X.Pairwise (fun x y => x ∉ A y) := by
  sorry

theorem erdos_501.variants.singleton_independent (A : ℝ → Set ℝ) (x : ℝ) :
    ({x} : Set ℝ).Pairwise (fun x y => x ∉ A y) :=
  Set.pairwise_singleton x _

theorem erdos_501.variants.pair_independent_iff (A : ℝ → Set ℝ) {x y : ℝ} (hxy : x ≠ y) :
    ({x, y} : Set ℝ).Pairwise (fun x y => x ∉ A y) ↔ x ∉ A y ∧ y ∉ A x := by
  rw [Set.pairwise_pair]
  exact ⟨fun h => h hxy, fun h _ => h⟩

theorem erdos_501.tests.empty_family_is_valid :
    let A : ℝ → Set ℝ := fun _ => ∅
    (∀ x, Bornology.IsBounded (A x)) ∧
    (∀ x, volume.toOuterMeasure (A x) < 1) ∧
    ∃ X : Set ℝ, X.Infinite ∧ X.Pairwise (fun x y => x ∉ A y) := by
  refine ⟨fun _ => Bornology.isBounded_empty, fun _ => ?_, Set.univ, Set.infinite_univ, ?_⟩
  · simp
  · intro x _ y _ _ hxAy; exact hxAy

theorem erdos_501.tests.singleton_zero_independent (A : ℝ → Set ℝ) :
    ({0} : Set ℝ).Pairwise (fun x y => x ∉ A y) :=
  erdos_501.variants.singleton_independent A 0

theorem erdos_501.tests.pair_independent_empty :
    ({0, 1} : Set ℝ).Pairwise (fun x y => x ∉ (fun _ => (∅ : Set ℝ)) y) := by
  rw [erdos_501.variants.pair_independent_iff _ (by norm_num : (0:ℝ) ≠ 1)]
  exact ⟨Set.notMem_empty _, Set.notMem_empty _⟩

theorem erdos_501.tests.singleton_outer_measure_lt_one (x : ℝ) :
    volume.toOuterMeasure ({x} : Set ℝ) < 1 := by
  simp [Measure.toOuterMeasure_apply]

theorem erdos_501.tests.unit_interval_measure :
    volume.toOuterMeasure (Set.Icc (0:ℝ) 1) = 1 := by
  simp [Measure.toOuterMeasure_apply, Real.volume_Icc]

end Erdos501
