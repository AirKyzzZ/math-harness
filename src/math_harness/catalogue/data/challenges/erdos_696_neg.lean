import Mathlib

namespace Erdos696

def ValidChain (n : ℕ) (P : ℕ → Prop) (s : List ℕ) : Prop :=
  s.IsChain (fun a b => a < b ∧ b ≡ 1 [MOD a]) ∧ ∀ d ∈ s, d ∣ n ∧ P d

open Classical in
noncomputable def h (n : ℕ) : ℕ :=
  Nat.findGreatest (fun k => ∃ s : List ℕ, s.length = k ∧ ValidChain n Nat.Prime s) n

open Classical in
noncomputable def H (n : ℕ) : ℕ :=
  Nat.findGreatest
    (fun k => ∃ s : List ℕ, s.length = k ∧ ValidChain n (fun _ => True) s) n

theorem h_one : h 1 = 0 := by
  classical
  rw [h, Nat.findGreatest_eq_zero_iff]
  intro k hk hk_le
  have hk_eq : k = 1 := by omega
  subst k
  rintro ⟨s, hslen, hvalid⟩
  obtain ⟨p, rfl⟩ := List.length_eq_one_iff.mp hslen
  suffices p = 1 by grind [Nat.not_prime_one, ValidChain]
  exact Nat.dvd_one.mp (hvalid.2 p (by simp)).1

theorem erdos_696_neg :
    ¬ (¬ ∀ M : ℝ, {n : ℕ | (h n : ℝ) > 0 ∧ (H n : ℝ) / (h n : ℝ) > M}.HasDensity 1) := by
  sorry

end Erdos696
