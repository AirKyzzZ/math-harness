import Mathlib

namespace Erdos1196

open scoped Asymptotics

-- TODO(Paul-Lez): add this to ForMathlib. I suspect this is the right generalisation from the natural number case?

def IsPrimitive {M : Type*} [CommMonoid M] (A : Set M) : Prop :=
  ∀ᵉ (x ∈ A) (y ∈ A), x ∣ y → Associated x y

theorem erdos_1196 :
    ∃ o : ℕ → ℝ, o =o[Filter.atTop] (1 : ℕ → ℝ) ∧ ∀ x > (0 : ℕ), ∀ A ⊆ Set.Ici x, IsPrimitive A → ∑' (a : A), (1 / ((a.val : ℝ).log * a)) < 1 + o x := by
  sorry

end Erdos1196
