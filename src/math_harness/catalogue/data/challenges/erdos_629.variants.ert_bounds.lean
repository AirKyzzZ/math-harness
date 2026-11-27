import Mathlib

open Filter SimpleGraph

namespace Erdos629

noncomputable def n (k : ℕ) : ℕ :=
  sInf {m : ℕ | ∃ G : SimpleGraph (Fin m), G.Colorable 2 ∧ k < G.listChromaticNumber}

theorem n_le {k m : ℕ} (G : SimpleGraph (Fin m)) (hG : G.Colorable 2)
    (hk : k < G.listChromaticNumber) : n k ≤ m :=
  Nat.sInf_le ⟨G, hG, hk⟩

theorem erdos_629.variants.ert_bounds (k : ℕ) (hk : 1 ≤ k) :
    2 ^ (k - 1) < n k ∧ n k < k ^ 2 * 2 ^ (k + 2) := by
  sorry

end Erdos629
