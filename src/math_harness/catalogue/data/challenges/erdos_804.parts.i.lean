import Mathlib

open Filter Real

namespace Erdos804

def HasLocalIndependence {n : ℕ} (G : SimpleGraph (Fin n)) (m t : ℕ) : Prop :=
  ∀ S : Finset (Fin n), S.card = m → ∃ I ⊆ S, t ≤ I.card ∧ G.IsIndepSet I

noncomputable def f (m n : ℕ) : ℕ :=
  sInf {k | ∃ G : SimpleGraph (Fin n), HasLocalIndependence G m ⌈log n⌉₊ ∧ G.indepNum = k}

theorem erdos_804.parts.i :
    ¬ ∀ ε > 0, ∀ᶠ n : ℕ in atTop, (n : ℝ) ^ (1 / 2 - ε : ℝ) ≤ f ⌊(log n) ^ 2⌋₊ n := by
  sorry

end Erdos804
