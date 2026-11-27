import Mathlib

open Filter

open SimpleGraph

open Real

namespace Erdos61

def IsErdosHajnalLowerBound {α : Type*} [Fintype α] [DecidableEq α]
  (H : SimpleGraph α) (f : ℕ → ℝ) : Prop :=
  ∀ᶠ n in atTop, ∀ G : SimpleGraph (Fin n),
    (¬∃ g : α ↪ Fin n, H = G.comap g) → G.indepNum ≥ f n ∨ G.cliqueNum ≥ f n

theorem erdos_61.variants.bnss23 :
    ∀ {α : Type*} [Fintype α] [DecidableEq α] (H : SimpleGraph α), ∃ c > (0 : ℝ), IsErdosHajnalLowerBound H (fun n : ℕ => exp (c * sqrt (log n * log (log n)))) := by
  sorry

end Erdos61
