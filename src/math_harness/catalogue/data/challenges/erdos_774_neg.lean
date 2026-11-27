import Mathlib

open Finset

def Set.IsDissociated (A : Set ℕ) : Prop :=
  { S : Finset ℕ | (S : Set ℕ) ⊆ A }.InjOn fun S ↦ ∑ n ∈ S, n

def Set.IsProportionatelyDissociated (A : Set ℕ) : Prop :=
  ∃ c > (0 : ℝ), ∀ (B : Finset ℕ), (B : Set ℕ) ⊆ A →
    ∃ S ⊆ B, #S ≥ c * #B ∧ (S : Set ℕ).IsDissociated

namespace Erdos774

theorem erdos_774_neg :
    ¬ (∀ (A : Set ℕ), A.Infinite → A.IsProportionatelyDissociated → ∃ (T : Set (Set ℕ)), (∀ S ∈ T, S.IsDissociated) ∧ T.Finite ∧ A = ⋃₀ T) := by
  sorry

end Erdos774
