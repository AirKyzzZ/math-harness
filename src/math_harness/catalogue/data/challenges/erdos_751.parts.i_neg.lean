import Mathlib

namespace Erdos751

theorem erdos_751.parts.i_neg :
    ¬ (¬ ∀ k : ℕ, ∃ (V : Type) (G : SimpleGraph V), G.chromaticNumber = 4 ∧ ∀ m ∈ G.cycleLengths, ∀ m' ∈ G.cycleLengths, m < m' → m + k ≤ m') := by
  sorry

end Erdos751
