import Mathlib

open Set

namespace Erdos193

def IsSWalk {V : Type*} [AddCommGroup V] (S : Set V) (a : ℕ → V) : Prop :=
  ∀ n, a (n + 1) - a n ∈ S

def HasCollinearTriple (R) {V : Type*} [DivisionRing R] [AddCommGroup V] [Module R V] (A : Set V) : Prop :=
  ∃ x ∈ A, ∃ y ∈ A, ∃ z ∈ A, x ≠ y ∧ y ≠ z ∧ x ≠ z ∧ Collinear R ({x, y, z} : Set V)

theorem erdos_193_neg :
    ¬ (¬ ∀ S : Set (Fin 3 → ℤ), S.Finite → ∀ a : ℕ → Fin 3 → ℤ, IsSWalk S a → (range a).Infinite → HasCollinearTriple ℚ (range (fun n ↦ (↑) ∘ a n : ℕ → Fin 3 → ℚ))) := by
  sorry

-- TODO(jeangud): For $\mathbb{Z}^3$ the largest number of collinear points can be bounded [GeRa79].

end Erdos193
