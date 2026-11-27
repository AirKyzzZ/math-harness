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

theorem erdos_1182.variants.nikiforov_rousseau :
    ∀ᶠ n : ℕ in atTop, F n < 50 * n := by
  sorry

end Erdos1182
