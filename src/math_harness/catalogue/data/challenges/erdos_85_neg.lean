import Mathlib

open SimpleGraph Finset Filter

namespace Erdos85

noncomputable def f (n : ℕ) : ℕ :=
  open scoped Classical in
  sInf {k : ℕ | ∀ (G : SimpleGraph (Fin n)), G.minDegree ≥ k → (cycleGraph 4) ⊑ G}

theorem erdos_85_neg :
    ¬ (∀ᶠ n in atTop, f n ≤ f (n + 1)) := by
  sorry

-- TODO: add connection to Ramsey number, weaker version and implied bounds from additional material.

end Erdos85
