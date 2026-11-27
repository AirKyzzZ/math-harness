import Mathlib

open Nat Filter

namespace Erdos1101

def ASet (u : ℕ → ℕ) : Set ℕ :=
  { a | ∀ i, ¬ u i ∣ a }

noncomputable def A (u : ℕ → ℕ) (n : ℕ) : ℕ :=
  Nat.nth (fun a => a ∈ ASet u) n

noncomputable def t (u : ℕ → ℕ) (x : ℕ) : ℕ :=
  sSup { k | ∏ i ∈ Finset.range k, u i ≤ x }

def IsGood (u : ℕ → ℕ) : Prop :=
  StrictMono u ∧
  (∀ i j, i ≠ j → Coprime (u i) (u j)) ∧
  Summable (fun n => 1 / (u n : ℝ)) ∧
  ∀ ε > 0, ∀ᶠ x in atTop,
    ∀ k, A u k < x →
      (A u (k + 1) : ℝ) - A u k < (1 + ε) * (t u x : ℝ) * (∏' i : ℕ, (1 - 1 / (u i : ℝ)))⁻¹

theorem erdos_1101.parts.ii :
    ∃ u, IsGood u ∧ (fun n => Real.log (u n : ℝ)) =o[atTop] (fun n => (n : ℝ)) := by
  sorry

end Erdos1101
