import Mathlib

open Filter EuclideanGeometry

namespace Erdos103

def separatedSets (n : ℕ) : Set (Finset ℝ²) :=
  {B | B.card = n ∧ Metric.IsSeparated' 1 (B : Set ℝ²)}

def IsMinimiser (n : ℕ) (A : Finset ℝ²) : Prop :=
  A ∈ separatedSets n ∧
    IsMinOn (fun B : Finset ℝ² => Metric.diam (B : Set ℝ²)) (separatedSets n) A

def Congruent (A B : Finset ℝ²) : Prop :=
  ∃ f : ℝ² ≃ᵢ ℝ², f '' A = B

noncomputable def h (n : ℕ) : ℕ∞ :=
  ⨆ (S : Finset (Finset ℝ²)) (_ : (∀ A ∈ S, IsMinimiser n A) ∧
      ∀ A ∈ S, ∀ B ∈ S, A ≠ B → ¬ Congruent A B), (S.card : ℕ∞)

theorem erdos_103.variants.two_le :
    ∀ᶠ n in atTop, 2 ≤ h n := by
  sorry

end Erdos103
