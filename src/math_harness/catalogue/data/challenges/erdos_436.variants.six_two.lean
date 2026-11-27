import Mathlib

open Filter

namespace Erdos436

def IsPowerResidue (k p a : ℕ) : Prop :=
  (a : ZMod p) ≠ 0 ∧ ∃ x : ZMod p, x ^ k = a

noncomputable def r (k m p : ℕ) : ℕ∞ :=
  ⨅ (n : ℕ) (_ : 1 ≤ n ∧ ∀ i < m, IsPowerResidue k p (n + i)), (n : ℕ∞)

noncomputable def runLimsup (k m : ℕ) : ℕ∞ :=
  limsup (r k m) (atTop ⊓ 𝓟 {p | p.Prime})

theorem erdos_436.variants.six_two :
    Λ 6 2 = 202124 := by
  sorry

theorem r_two_two_thirteen : r 2 2 13 = 3 := by
  have h2 : ¬ IsPowerResidue 2 13 2 := by
    unfold IsPowerResidue
    decide
  apply le_antisymm
  · refine iInf₂_le 3 ⟨by norm_num, ?_⟩
    intro i hi
    interval_cases i
    · exact ⟨by decide, 4, by decide⟩
    · exact ⟨by decide, 2, by decide⟩
  · refine le_iInf₂ ?_
    rintro n ⟨hn, h⟩
    have : 3 ≤ n := by
      by_contra hlt
      interval_cases n
      · exact h2 (h 1 (by norm_num))
      · exact h2 (h 0 (by norm_num))
    exact_mod_cast this

end Erdos436
