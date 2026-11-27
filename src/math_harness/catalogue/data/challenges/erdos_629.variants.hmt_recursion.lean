import Mathlib

open Filter SimpleGraph

namespace Erdos629

noncomputable def n (k : ℕ) : ℕ :=
  sInf {m : ℕ | ∃ G : SimpleGraph (Fin m), G.Colorable 2 ∧ k < G.listChromaticNumber}

theorem n_le {k m : ℕ} (G : SimpleGraph (Fin m)) (hG : G.Colorable 2)
    (hk : k < G.listChromaticNumber) : n k ≤ m :=
  Nat.sInf_le ⟨G, hG, hk⟩

theorem erdos_629.variants.hmt_recursion (k : ℕ) (hk : 2 ≤ k) :
    n k ≤ k * n (k - 2) + 2 ^ k := by
  sorry

end Erdos629
