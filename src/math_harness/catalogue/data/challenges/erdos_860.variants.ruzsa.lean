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

theorem erdos_860.variants.ruzsa :
    Tendsto (fun n : ℕ ↦ (h n : ℝ) / n) atTop atTop := by
  sorry

end Erdos860
