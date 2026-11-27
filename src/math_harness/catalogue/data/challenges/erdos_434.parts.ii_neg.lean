import Mathlib

namespace Erdos434

open Erdos434 Finset

abbrev Nat.IsRepresentableAs (n : ℕ) (A : Set ℕ) :=
    ∃ (S : Multiset ℕ), (∀ a ∈ S, a ∈ A) ∧ S.sum = n

noncomputable abbrev Nat.NcardUnrepresentable (A : Set ℕ) :=
    { n : ℕ | ¬n.IsRepresentableAs A }.ncard

def erdos_434.parts.i.answer (n : ℕ) (k : ℕ) : Set ℕ := Set.Icc (n - k + 1 : ℕ) n

theorem erdos_434.parts.ii_neg :
    ¬ (∀ᵉ (n ≥ 1) (k ≥ 2), k ≤ n → IsGreatest { Nat.NcardUnrepresentable S | (S : Finset ℕ) (_ : S ⊆ Finset.Icc 1 n) (_ : #S = k) (_ : S.gcd id = 1)} (Nat.NcardUnrepresentable <| Set.Icc (n - k + 1 : ℕ) n)) := by
  sorry

end Erdos434
