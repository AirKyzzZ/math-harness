import Mathlib

open Filter Real

namespace Erdos804

def HasLocalIndependence {n : ℕ} (G : SimpleGraph (Fin n)) (m t : ℕ) : Prop :=
  ∀ S : Finset (Fin n), S.card = m → ∃ I ⊆ S, t ≤ I.card ∧ G.IsIndepSet I

noncomputable def f (m n : ℕ) : ℕ :=
  sInf {k | ∃ G : SimpleGraph (Fin n), HasLocalIndependence G m ⌈log n⌉₊ ∧ G.indepNum = k}

theorem erdos_804.variants.alon_sudakov :
    ∃ c₂ C₂ c₃ C₃ : ℝ, 0 < c₂ ∧ 0 < C₂ ∧ 0 < c₃ ∧ 0 < C₃ ∧ ∀ᶠ n : ℕ in atTop, c₂ * ((log n) ^ 2 / log (log n)) ≤ f ⌊(log n) ^ 2⌋₊ n ∧ (f ⌊(log n) ^ 2⌋₊ n : ℝ) ≤ C₂ * (log n) ^ 2 ∧ c₃ * ((log n) ^ 2 / log (log n)) ≤ f ⌊(log n) ^ 3⌋₊ n ∧ (f ⌊(log n) ^ 3⌋₊ n : ℝ) ≤ C₃ * ((log n) ^ 2 / log (log n)) := by
  sorry

end Erdos804
