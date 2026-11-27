import Mathlib

open Filter Asymptotics EuclideanGeometry

namespace Erdos827

def OnCircleOfRadius (S : Finset ℝ²) (r : ℝ) : Prop :=
  ∃ c : ℝ², ∀ p ∈ S, dist p c = r

def HasDistinctCircumradii (S : Finset ℝ²) : Prop :=
  ∀ T ⊆ S, ∀ T' ⊆ S, T.card = 3 → T'.card = 3 → T ≠ T' →
    ∀ r : ℝ, OnCircleOfRadius T r → ¬ OnCircleOfRadius T' r

noncomputable def n (k : ℕ) : ℕ :=
  sInf {m : ℕ | ∀ X : Finset ℝ², X.card = m → InGeneralPosition (X : Set ℝ²) →
    ∃ Y ⊆ X, Y.card = k ∧ HasDistinctCircumradii Y}

theorem n_le {k m : ℕ}
    (h : ∀ X : Finset ℝ², X.card = m → InGeneralPosition (X : Set ℝ²) →
      ∃ Y ⊆ X, Y.card = k ∧ HasDistinctCircumradii Y) :
    n k ≤ m :=
  Nat.sInf_le h

theorem erdos_827.variants.martinez_roldan_pensado :
    (fun k : ℕ ↦ (n k : ℝ)) =O[atTop] fun k : ℕ ↦ (k : ℝ) ^ 9 := by
  sorry

end Erdos827
