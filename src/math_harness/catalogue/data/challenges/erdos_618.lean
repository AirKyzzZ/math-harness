import Mathlib

namespace Erdos618

open Filter Asymptotics

open scoped Classical in
noncomputable def h2 {n : ℕ} (G : SimpleGraph (Fin n)) : ℕ :=
  sInf {k : ℕ | ∃ H : SimpleGraph (Fin n),
    G ≤ H ∧
    H.CliqueFree 3 ∧
    (∀ x y : Fin n, x ≠ y → H.Adj x y ∨ ∃ z, H.Adj x z ∧ H.Adj z y) ∧
    (H.edgeFinset \ G.edgeFinset).card = k}

open scoped Classical in
theorem erdos_618 :
    ∀ (G : ∀ n : ℕ, SimpleGraph (Fin n)), (∀ n, (G n).CliqueFree 3) → (fun n => ((G n).maxDegree : ℝ)) =o[atTop] (fun n => (n : ℝ) ^ ((1 : ℝ) / 2)) → (fun n => (h2 (G n) : ℝ)) =o[atTop] (fun n => (n : ℝ) ^ 2) := by
  sorry

end Erdos618
