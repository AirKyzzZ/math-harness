import Mathlib

open Filter Asymptotics SimpleGraph

namespace Erdos133

open scoped Classical in
noncomputable def f (n : ℕ) : ℕ :=
  sInf {d | ∃ G : SimpleGraph (Fin n), G.CliqueFree 3 ∧ G.diam = 2 ∧ ∀ v, G.degree v ≤ d}

theorem erdos_133.variants.hanson_seyffarth :
    ∀ ε : ℝ, 0 < ε → ∀ᶠ n : ℕ in atTop, (f n : ℝ) ≤ (√2 + ε) * √n := by
  sorry

end Erdos133
