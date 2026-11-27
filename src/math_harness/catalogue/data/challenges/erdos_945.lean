import Mathlib

open Filter Real

namespace Erdos945

abbrev τ  := fun (n : ℕ) => n.divisors.card

noncomputable def F (x : ℝ) : ℕ :=
  sSup {k | ∃ (n : ℕ), n + k ≤ x ∧ (Set.Ioc n (n + k)).InjOn τ}

-- Implementation note: we define a Prop here and below to be able to easily formulate

-- the equivalence between the two variants. Because the theorems have an unknown `answer` we

-- can't handle this with `type_of%`.

def Erdos945Prop : Prop := ∃ O : ℝ → ℝ, O =O[atTop] (1 : ℝ → ℝ) ∧ ∀ᶠ x in atTop, F x ≤ log x ^ O x

theorem erdos_945 :
    Erdos945Prop := by
  sorry

def Erdos945Constant : Prop :=
  ∃ C > (0 : ℝ),  ∀ᶠ x : ℝ in atTop,
    ∃ a b : ℕ, a ≠ b ∧
    ↑a ∈ Set.Icc x (x + log x ^ C) ∧
    ↑b ∈ Set.Icc x (x + log x ^ C) ∧
    τ a = τ b

-- TODO(firsching): show equivalence

-- TODO(firsching): add observations what follows from Cramér's conjecture and if every sufficient

-- interval contains a squarefree number.

end Erdos945
