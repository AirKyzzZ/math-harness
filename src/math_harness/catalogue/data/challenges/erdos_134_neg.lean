import Mathlib

namespace Erdos134

theorem erdos_134_neg :
    ¬ (∀ (ε δ : ℝ) (hε : 0 < ε) (hδ : 0 < δ), ∃ N : ℕ, ∀ n ≥ N, ∀ (G : SimpleGraph (Fin n)) [DecidableRel G.Adj], G.CliqueFree 3 → (∀ v : Fin n, (G.degree v : ℝ) < Real.rpow (n : ℝ) ((1 : ℝ) / 2 - ε)) → ∃ (H : SimpleGraph (Fin n)) (_ : DecidableRel H.Adj), G ≤ H ∧ H.CliqueFree 3 ∧ (∀ x y : Fin n, x ≠ y → H.Adj x y ∨ ∃ z, H.Adj x z ∧ H.Adj z y) ∧ ((H.edgeFinset \ G.edgeFinset).card : ℝ) ≤ δ * (n : ℝ) ^ 2) := by
  sorry

end Erdos134
