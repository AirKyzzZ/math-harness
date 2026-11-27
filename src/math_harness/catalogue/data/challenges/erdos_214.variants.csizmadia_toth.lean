import Mathlib

open scoped Congruent EuclideanGeometry

namespace Erdos214

def unitSquare : Fin 4 → ℝ² := ![!₂[0, 0], !₂[1, 0], !₂[1, 1], !₂[0, 1]]

def UnitDistanceAvoiding (S : Set ℝ²) : Prop := ∀ x ∈ S, ∀ y ∈ S, dist x y ≠ 1

def HasRedCopies (n : ℕ) : Prop :=
  ∀ S : Set ℝ², UnitDistanceAvoiding S → ∀ K : Fin n → ℝ², Function.Injective K →
    ∃ p : Fin n → ℝ², (∀ i, p i ∈ Sᶜ) ∧ (p ≅ K)

noncomputable def k : ℕ := sSup {n | HasRedCopies n}

theorem erdos_214.variants.csizmadia_toth :
    ¬ HasRedCopies 8 := by
  sorry

end Erdos214
