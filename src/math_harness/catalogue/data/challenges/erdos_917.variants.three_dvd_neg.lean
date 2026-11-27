import Mathlib

open Filter Asymptotics

namespace Erdos917

def IsKCritical {V : Type*} (G : SimpleGraph V) (k : ℕ) : Prop :=
  G.IsCritical k ∧ ∀ e ∈ G.edgeSet, G.IsCriticalEdge e

noncomputable def f (k n : ℕ) : ℕ :=
  sSup {m : ℕ | ∃ G : SimpleGraph (Fin n), IsKCritical G k ∧ G.edgeSet.ncard = m}

theorem edgeSet_ncard_le_f {k n : ℕ} {G : SimpleGraph (Fin n)} (hG : IsKCritical G k) :
    G.edgeSet.ncard ≤ f k n := by
  unfold f
  refine le_csSup ⟨Nat.card (Sym2 (Fin n)), ?_⟩ ⟨G, hG, rfl⟩
  rintro m ⟨H, -, rfl⟩
  exact Set.ncard_le_card _

noncomputable def conjecturedValue (k n : ℕ) : ℝ :=
  1 / 2 * (1 - 1 / ((k / 3 : ℕ) : ℝ)) * (n : ℝ) ^ 2

theorem conjecturedValue_six (n : ℕ) : conjecturedValue 6 n = (n : ℝ) ^ 2 / 4 := by
  have h : ((6 / 3 : ℕ) : ℝ) = 2 := by norm_num
  rw [conjecturedValue, h]
  ring

noncomputable def delta (k : ℕ) : ℝ :=
  if k % 3 = 0 then 0 else if k % 3 = 1 then 1 / 7 else 24 / 69

theorem erdos_917.variants.three_dvd_neg :
    ¬ (∀ k : ℕ, 6 ≤ k → 3 ∣ k → (fun n : ℕ ↦ (f k n : ℝ)) ~[atTop] conjecturedValue k) := by
  sorry

end Erdos917
