import Mathlib

open Filter Real ComplexityTheory

namespace Erdos78

def explicitGraph (adj : List Bool × ℕ × ℕ → Bool) (n : ℕ) : SimpleGraph (Fin n) :=
  SimpleGraph.fromRel fun u v ↦ adj (List.replicate n true, u, v)

def stronglyExplicitGraph (adj : ℕ × ℕ × ℕ → Bool) (n : ℕ) : SimpleGraph (Fin n) :=
  SimpleGraph.fromRel fun u v ↦ adj (n, u, v)

def NoHomogeneousSet {V : Type*} (G : SimpleGraph V) (m : ℕ) : Prop :=
  G.CliqueFree m ∧ Gᶜ.CliqueFree m

theorem erdos_78.variants.nonconstructive :
    ∃ C > (1 : ℝ), ∀ᶠ k in atTop, C ^ k < (SimpleGraph.diagonalRamsey k : ℝ) := by
  sorry

end Erdos78
