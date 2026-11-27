import Mathlib

open Filter Asymptotics

namespace Erdos1013

noncomputable def h3 (k : ℕ) : ℕ :=
  sInf {n : ℕ | ∃ G : SimpleGraph (Fin n), G.CliqueFree 3 ∧ G.chromaticNumber = k}

theorem h3_le {k m : ℕ} (G : SimpleGraph (Fin m)) (hG : G.CliqueFree 3)
    (hk : G.chromaticNumber = k) : h3 k ≤ m :=
  Nat.sInf_le ⟨G, hG, hk⟩

theorem h3_one_le : h3 1 ≤ 1 :=
  h3_le (⊥ : SimpleGraph (Fin 1)) (SimpleGraph.cliqueFree_bot (by norm_num))
    (by exact_mod_cast SimpleGraph.chromaticNumber_bot (V := Fin 1))

theorem erdos_1013.parts.ii :
    Tendsto (fun k : ℕ ↦ (h3 (k + 1) : ℝ) / h3 k) atTop (nhds 1) := by
  sorry

end Erdos1013
