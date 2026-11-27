import Mathlib

namespace Erdos810

open Filter

def PairwiseDistinct4 {α : Type _} (a b c d : α) : Prop :=
  a ≠ b ∧ a ≠ c ∧ a ≠ d ∧ b ≠ c ∧ b ≠ d ∧ c ≠ d

def IsC4 {n : ℕ} (G : SimpleGraph (Fin n)) (a b c d : Fin n) : Prop :=
  PairwiseDistinct4 a b c d ∧
    G.Adj a b ∧ G.Adj b c ∧ G.Adj c d ∧ G.Adj d a

def C4RainbowColoring {n : ℕ} (G : SimpleGraph (Fin n))
    (color : Fin n → Fin n → Fin n) : Prop :=
  (∀ a b, G.Adj a b → color a b = color b a) ∧
    ∀ a b c d, IsC4 G a b c d →
      PairwiseDistinct4 (color a b) (color b c) (color c d) (color d a)

theorem erdos_810 :
    ∃ ε > 0, ∀ᶠ n in atTop, ∃ G : SimpleGraph (Fin n), ∃ color : Fin n → Fin n → Fin n, ε * (n : ℝ) ^ 2 ≤ (G.edgeSet.ncard : ℝ) ∧ C4RainbowColoring G color := by
  sorry

end Erdos810
