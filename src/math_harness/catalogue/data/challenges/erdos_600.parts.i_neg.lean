import Mathlib

open Filter

open scoped Topology

namespace Erdos600

open scoped Classical in
def Erdos600Prop (n : ℕ) (e : ℕ) (r : ℕ) : Prop :=
  ∀ G : SimpleGraph (Fin n), G.edgeFinset.card ≥ e →
  (∀ uv ∈ G.edgeFinset, (G.trianglesContaining uv).Nonempty) →
  ∃ uv ∈ G.edgeFinset, r ≤ (G.trianglesContaining uv).card

noncomputable def eFunction (n : ℕ) (r : ℕ) : ℕ := sInf {e : ℕ | Erdos600Prop n e r}

theorem erdos_600.parts.i_neg :
    ¬ (∀ r : ℕ, 2 ≤ r → Tendsto (fun (n : ℕ) ↦ (eFunction n (r + 1) : ℝ) - (eFunction n r : ℝ)) atTop atTop) := by
  sorry

end Erdos600
