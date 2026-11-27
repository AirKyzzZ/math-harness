import Mathlib

open Filter Asymptotics

namespace Erdos860

def HasPrimeMultiples (n m L : ℕ) : Prop :=
  ∃ a : Fin (Nat.primeCounting n) → ℕ,
    Function.Injective a ∧ ∀ i, m < a i ∧ a i < m + L ∧ Nat.nth Nat.Prime i.val ∣ a i

noncomputable def h (n : ℕ) : ℕ :=
  sInf {L : ℕ | ∀ m, 1 ≤ m → HasPrimeMultiples n m L}

theorem h_le {n L : ℕ} (hL : ∀ m, 1 ≤ m → HasPrimeMultiples n m L) : h n ≤ L :=
  Nat.sInf_le hL

theorem erdos_860.variants.erdos_pomerance_upper :
    (fun n : ℕ ↦ (h n : ℝ)) =O[atTop] fun n : ℕ ↦ (n : ℝ) ^ (3 / 2 : ℝ) / Real.sqrt (Real.log n) := by
  sorry

end Erdos860
