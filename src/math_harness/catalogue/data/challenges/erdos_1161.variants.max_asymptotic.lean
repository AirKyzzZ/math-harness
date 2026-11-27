import Mathlib

open Filter Asymptotics

namespace Erdos1161

noncomputable def f (k n : ℕ) : ℕ :=
  Fintype.card {σ : Equiv.Perm (Fin n) // orderOf σ = k}

noncomputable def maxF (n : ℕ) : ℕ :=
  (Finset.univ.image fun σ : Equiv.Perm (Fin n) ↦ orderOf σ).sup fun k ↦ f k n

theorem f_zero (n : ℕ) : f 0 n = 0 := by
  unfold f
  rw [Fintype.card_eq_zero_iff]
  exact ⟨fun ⟨σ, hσ⟩ => (orderOf_pos σ).ne' hσ⟩

theorem f_one (n : ℕ) : f 1 n = 1 := by
  unfold f
  rw [Fintype.card_eq_one_iff]
  exact ⟨⟨1, orderOf_one⟩, fun ⟨σ, hσ⟩ => Subtype.ext (orderOf_eq_one_iff.mp hσ)⟩

def erdos_1161.answer (n : ℕ) : Set ℕ :=
  {k | IsLeast {m : ℕ | 0 < m ∧ Nat.lcmUpto (n - m) ∣ m} k}

theorem erdos_1161.variants.max_asymptotic :
    (fun n : ℕ ↦ (maxF n : ℝ)) ~[atTop] (fun n : ℕ ↦ ((n - 1).factorial : ℝ)) := by
  sorry

end Erdos1161
