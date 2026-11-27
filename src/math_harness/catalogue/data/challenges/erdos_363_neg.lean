import Mathlib

namespace Erdos363

open Finset

def IsInterval (I : Finset ℕ) : Prop :=
  ∃ a b : ℕ, I = Icc a b

def IsValidCollection (S : List (Finset ℕ)) : Prop :=
  (∀ I ∈ S, IsInterval I) ∧
  (∀ I ∈ S, 4 ≤ I.card) ∧
  (∀ I ∈ S, 0 ∉ I) ∧
  S.Pairwise Disjoint ∧
  IsSquare ((S.map (fun I => ∏ m ∈ I, m)).prod)

theorem erdos_363_neg :
    ¬ (¬ ∀ ks : List ℕ, {S : List (Finset ℕ) | IsValidCollection S ∧ S.map Finset.card = ks}.Finite) := by
  sorry

end Erdos363
