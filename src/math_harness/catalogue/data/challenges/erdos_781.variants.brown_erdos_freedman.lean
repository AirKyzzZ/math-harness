import Mathlib

open Filter Asymptotics

namespace Erdos781

def IsDescendingWave {k : ℕ} (x : Fin k → ℕ) : Prop :=
  StrictMono x ∧
    ∀ i j l : Fin k, (i : ℕ) + 1 = j → (j : ℕ) + 1 = l → x i + x l ≤ 2 * x j

noncomputable def f (k : ℕ) : ℕ :=
  sInf {n | ∀ c : Fin n → Fin 2, ∃ x : Fin k → Fin n,
    IsDescendingWave (fun i ↦ (x i : ℕ)) ∧ ∃ γ, ∀ i, c (x i) = γ}

theorem erdos_781.variants.brown_erdos_freedman (k : ℕ) (hk : 1 ≤ k) :
    k ^ 2 - k + 1 ≤ f k ∧ (f k : ℚ) ≤ (k ^ 3 - 4 * k + 9) / 3 := by
  sorry

end Erdos781
