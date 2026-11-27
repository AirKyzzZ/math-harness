import Mathlib

open Filter Finset SimpleGraph

open scoped Topology

namespace Erdos80

variable {α : Type*} [Fintype α] [DecidableEq α] (G : SimpleGraph α) [DecidableRel G.Adj]

noncomputable def bookNumber : ℕ :=
  G.edgeFinset.sup fun e => #(G.trianglesContaining e)

def EveryEdgeInTriangle : Prop :=
  ∀ e ∈ G.edgeFinset, (G.trianglesContaining e).Nonempty

def Admissible (c : ℝ) {n : ℕ} (G : SimpleGraph (Fin n)) [DecidableRel G.Adj] : Prop :=
  c * (n : ℝ) ^ 2 ≤ #G.edgeFinset ∧ EveryEdgeInTriangle G

open Classical in
noncomputable def f (c : ℝ) (n : ℕ) : ℕ :=
  sInf {m | ∃ G : SimpleGraph (Fin n), Admissible c G ∧ bookNumber G = m}

theorem erdos_80.parts.i :
    ¬ ∀ c : ℝ, 0 < c → c < 1 / 2 → ∃ ε > (0 : ℝ), ∀ᶠ n : ℕ in atTop, (n : ℝ) ^ ε < f c n := by
  sorry

omit [DecidableEq α] in

theorem bookNumber_eq_zero_iff :
    bookNumber G = 0 ↔ ∀ e ∈ G.edgeFinset, G.trianglesContaining e = ∅ := by
  simp [bookNumber, Finset.card_eq_zero]

theorem bookNumber_bot {n : ℕ} : bookNumber (⊥ : SimpleGraph (Fin n)) = 0 := by
  simp [bookNumber]

theorem everyEdgeInTriangle_bot {n : ℕ} :
    EveryEdgeInTriangle (⊥ : SimpleGraph (Fin n)) := by
  simp [EveryEdgeInTriangle]

end Erdos80
