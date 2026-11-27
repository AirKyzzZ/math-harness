import Mathlib

open Filter SimpleGraph

namespace Erdos629

noncomputable def n (k : ℕ) : ℕ :=
  sInf {m : ℕ | ∃ G : SimpleGraph (Fin m), G.Colorable 2 ∧ k < G.listChromaticNumber}

theorem n_le {k m : ℕ} (G : SimpleGraph (Fin m)) (hG : G.Colorable 2)
    (hk : k < G.listChromaticNumber) : n k ≤ m :=
  Nat.sInf_le ⟨G, hG, hk⟩

theorem erdos_629.variants.radhakrishnan_srinivasan :
    ∃ c > (0 : ℝ), ∀ᶠ k : ℕ in atTop, c * 2 ^ k * Real.sqrt (k / Real.log k) ≤ (n k : ℝ) := by
  sorry

end Erdos629
