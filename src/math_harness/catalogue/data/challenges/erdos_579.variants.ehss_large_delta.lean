import Mathlib

open Filter SimpleGraph

namespace Erdos579

abbrev octahedron : SimpleGraph (Σ _ : Fin 3, Fin 2) :=
  completeMultipartiteGraph (fun _ : Fin 3 => Fin 2)

open scoped Classical in
theorem erdos_579.variants.ehss_large_delta (δ : ℝ) (hδ : 1 / 8 < δ) :
    ∃ c : ℝ, 0 < c ∧ ∀ᶠ n : ℕ in atTop, ∀ G : SimpleGraph (Fin n), octahedron.Free G → δ * (n : ℝ) ^ 2 ≤ G.edgeFinset.card → c * n ≤ (G.indepNum : ℝ) := by
  sorry

theorem erdos_579.variants.octahedron_not_free : ¬ octahedron.Free octahedron :=
  fun h => h IsContained.rfl

end Erdos579
