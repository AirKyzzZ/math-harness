import Mathlib

open SimpleGraph

namespace Erdos621

open scoped Classical in
theorem erdos_621_neg :
    ¬ (∀ (n : ℕ) (G : SimpleGraph (Fin n)) (a t : ℕ), IsGreatest {k : ℕ | ∃ A ⊆ G.edgeFinset, A.card = k ∧ ∀ x y z : Fin n, G.Adj x y → G.Adj y z → G.Adj x z → (({s(x, y), s(y, z), s(x, z)} : Finset (Sym2 (Fin n))) ∩ A).card ≤ 1} a → IsLeast {k : ℕ | ∃ T ⊆ G.edgeFinset, T.card = k ∧ ∀ x y z : Fin n, G.Adj x y → G.Adj y z → G.Adj x z → (T ∩ ({s(x, y), s(y, z), s(x, z)} : Finset (Sym2 (Fin n)))).Nonempty} t → 4 * (a + t) ≤ n ^ 2) := by
  sorry

end Erdos621
