import Mathlib

open Filter Asymptotics SimpleGraph

namespace Erdos926

def H (k : ℕ) : SimpleGraph (Unit ⊕ (Fin k ⊕ {p : Fin k × Fin k // p.1 < p.2})) where
  Adj x y :=
    match x, y with
    | Sum.inl _, Sum.inr (Sum.inl _) => True
    | Sum.inr (Sum.inl _), Sum.inl _ => True
    | Sum.inr (Sum.inl i), Sum.inr (Sum.inr p) => i = p.1.1 ∨ i = p.1.2
    | Sum.inr (Sum.inr p), Sum.inr (Sum.inl i) => i = p.1.1 ∨ i = p.1.2
    | _, _ => False
  symm := by
    constructor
    intro x y h
    rcases x with _ | _ | _ <;> rcases y with _ | _ | _ <;> simp_all
  loopless := by
    constructor
    intro x
    rcases x with _ | _ | _ <;> simp

theorem erdos_926.variants.aks :
    ∃ C : ℝ, ∀ k : ℕ, 4 ≤ k → ∀ n : ℕ, (extremalNumber n (H k) : ℝ) ≤ C * k * (n : ℝ) ^ (3 / 2 : ℝ) := by
  sorry

end Erdos926
