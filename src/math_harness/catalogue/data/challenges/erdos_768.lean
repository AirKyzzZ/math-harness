import Mathlib

namespace Erdos768

open Filter Asymptotics

def HasErdos768Property (n : ℕ) : Prop :=
  ∀ p, p.Prime → p ∣ n → ∃ d, d ∣ n ∧ 1 < d ∧ d % p = 1

theorem hasErdos768Property_thirty : HasErdos768Property 30 := by
  intro p hp hpd
  have hp_le : p ≤ 30 := Nat.le_of_dvd (by decide) hpd
  refine ⟨if p = 2 then 3 else if p = 3 then 10 else 6, ?_⟩
  interval_cases p <;> norm_num at *

theorem not_hasErdos768Property_prime {p : ℕ} (hp : p.Prime) :
    ¬ HasErdos768Property p := by
  intro h
  obtain ⟨d, hd, hgt, hmod⟩ := h p hp (dvd_refl p)
  rcases (Nat.dvd_prime hp).mp hd with rfl | rfl
  · omega
  · simp at hmod

noncomputable def erdos768Count (N : ℕ) : ℕ := by
  classical
  exact ((Finset.Icc 1 N).filter HasErdos768Property).card

noncomputable def erdos768Density (N : ℕ) : ℝ :=
  (erdos768Count N : ℝ) / (N : ℝ)

noncomputable def erdos768Scale (N : ℕ) : ℝ :=
  Real.sqrt (Real.log (N : ℝ)) * Real.log (Real.log (N : ℝ))

theorem erdos_768 :
    ∃ c > 0, ∃ error : ℕ → ℝ, error =o[atTop] (fun _ ↦ (1 : ℝ)) ∧ ∀ᶠ N in atTop, erdos768Density N = Real.exp (-(c + error N) * erdos768Scale N) := by
  sorry

end Erdos768
