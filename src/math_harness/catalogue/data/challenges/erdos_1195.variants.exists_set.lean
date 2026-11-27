import Mathlib

open Filter MeasureTheory

namespace Erdos1195

noncomputable def countingFunction (S : Set ℝ) (x : ℝ) : ℝ :=
  (volume (S ∩ Set.Ioo 0 x)).toReal

def IntegerRatioFree (S : Set ℝ) : Prop :=
  ∀ ⦃x⦄, x ∈ S → ∀ ⦃y⦄, y ∈ S → x ≠ y → ∀ z : ℤ, x / y ≠ z

def IsGrowthRate (F : ℝ → ℝ) : Prop :=
  (∀ x ∈ Set.Ici (1 : ℝ), 0 ≤ F x) ∧ MonotoneOn F (Set.Ici 1) ∧ Tendsto F atTop atTop

def HasSet (F : ℝ → ℝ) : Prop :=
  ∃ S : Set ℝ, MeasurableSet S ∧ volume S = ⊤ ∧ IntegerRatioFree S ∧
    ∀ᶠ x in atTop, F x ≤ countingFunction S x

def erdos_1195.answer : Set (ℝ → ℝ) :=
  {F | IsGrowthRate F ∧ IntegrableOn (fun x ↦ F x / x ^ 2) (Set.Ici 1)}

theorem erdos_1195.variants.exists_set :
    ∃ S : Set ℝ, MeasurableSet S ∧ S ⊆ Set.Ioi 0 ∧ volume S = ⊤ ∧ IntegerRatioFree S := by
  sorry

end Erdos1195
