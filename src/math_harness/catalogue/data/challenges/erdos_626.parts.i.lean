import Mathlib

open Filter

open scoped Topology

namespace Erdos626

noncomputable def g (k n : ℕ) : ℕ :=
  sSup {m : ℕ | ∃ G : SimpleGraph (Fin n), G.chromaticNumber = k ∧ (m : ℕ∞) < G.egirth}

noncomputable def h (m n : ℕ) : ℕ :=
  sSup {c : ℕ | ∃ G : SimpleGraph (Fin n), (m : ℕ∞) < G.egirth ∧ G.chromaticNumber = c}

theorem h_of_le_two (m n : ℕ) (hm : m ≤ 2) : h m n = n := by
  unfold h
  apply IsGreatest.csSup_eq
  refine ⟨⟨⊤, ?_, by simp [SimpleGraph.chromaticNumber_top]⟩, ?_⟩
  · exact lt_of_lt_of_le (by exact_mod_cast (by omega : m < 3))
      (⊤ : SimpleGraph (Fin n)).three_le_egirth
  · rintro c ⟨G, -, hG⟩
    have hle := G.chromaticNumber_le_card
    rw [hG, Fintype.card_fin] at hle
    exact_mod_cast hle

theorem erdos_626.parts.i :
    ∀ k : ℕ, 4 ≤ k → ∃ L : ℝ, Tendsto (fun n : ℕ ↦ (g k n : ℝ) / Real.log n) atTop (𝓝 L) := by
  sorry

end Erdos626
