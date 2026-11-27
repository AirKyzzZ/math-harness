import Mathlib

open Filter

namespace Erdos883

def coprimeGraph : SimpleGraph ℕ :=
  SimpleGraph.fromRel Nat.Coprime

open scoped Classical in
theorem erdos_883.parts.ii_neg :
    ¬ (∀ l : ℕ, 1 ≤ l → ∀ᶠ n : ℕ in atTop, ∀ A : Finset ℕ, A ⊆ Finset.Icc 1 n → n / 2 + n / 3 - n / 6 < A.card → (SimpleGraph.completeMultipartiteGraph (fun i : Fin 3 ↦ Fin (![1, l, l] i))).IsContained (coprimeGraph.induce (A : Set ℕ))) := by
  sorry

end Erdos883
