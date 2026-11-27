import Mathlib

open Filter Asymptotics

namespace Erdos1182

def IsTriangleGood {n : ℕ} (G : SimpleGraph (Fin n)) : Prop :=
  SimpleGraph.graphRamsey (⊤ : SimpleGraph (Fin 3)) G = 2 * n - 1

noncomputable def f (n : ℕ) : ℕ :=
  sSup {q : ℕ | ∃ G : SimpleGraph (Fin n), G.Connected ∧ G.edgeSet.ncard = q ∧ IsTriangleGood G}

noncomputable def F (n : ℕ) : ℕ :=
  sSup {q : ℕ | q ≤ n.choose 2 ∧
    ∀ G : SimpleGraph (Fin n), G.Connected → G.edgeSet.ncard ≤ q → IsTriangleGood G}

theorem le_F {n q : ℕ} (hq : q ≤ n.choose 2)
    (h : ∀ G : SimpleGraph (Fin n), G.Connected → G.edgeSet.ncard ≤ q → IsTriangleGood G) :
    q ≤ F n := by
  unfold F
  refine le_csSup ⟨n.choose 2, ?_⟩ ⟨hq, h⟩
  rintro p ⟨hp, -⟩
  exact hp

def erdos_1182.parts.ii.answer : ℕ → ℝ := fun n ↦ (n : ℝ)

theorem erdos_1182.variants.small_values :
    (F 2 = 1 ∧ F 3 = 2 ∧ F 4 = 5 ∧ F 5 = 7 ∧ F 6 = 8 ∧ F 7 = 11 ∧ F 8 = 11 ∧ F 9 = 16 ∧ F 10 = 18 ∧ F 11 = 23 ∧ F 12 = 23) ∧ (f 2 = 1 ∧ f 3 = 2 ∧ f 4 = 5 ∧ f 5 = 8 ∧ f 6 = 12 ∧ f 7 = 16 ∧ f 8 = 20 ∧ f 9 = 27 ∧ f 10 = 33 ∧ f 11 = 41 ∧ f 12 = 49) := by
  sorry

end Erdos1182
