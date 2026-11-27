import Mathlib

open Polynomial

namespace Erdos351

def imageSet {α : Type*} [Semifield α] (P : α[X]) : Set α :=
  Set.range (fun (n : ℕ) ↦ P.eval ↑n + 1 / n)

def IsStronglyComplete {α : Type*} [Semiring α] (A : Set α) : Prop :=
  ∀ B : Finset α,
    ∀ᶠ (m : ℕ) in Filter.atTop,
      ↑m ∈ { ∑ n ∈ X, n | (X : Finset α) (_ : ↑X ⊆ A \ B) }

def HasCompleteImage (P : ℚ[X]) : Prop := IsStronglyComplete (imageSet P)

theorem erdos_351_neg :
    ¬ (∀ P : ℚ[X], 0 < P.natDegree → 0 < P.leadingCoeff → HasCompleteImage P) := by
  sorry

end Erdos351
