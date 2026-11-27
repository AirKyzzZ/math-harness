import Mathlib

open Set Filter Topology Asymptotics

namespace Erdos375

def Erdos375Prop : Prop := ∀ n ≥ 1, ∀ k, (∀ i < k, ¬ (n + i + 1).Prime) →
    ∃ p : Fin k → ℕ, p.Injective ∧ ∀ i, (p i).Prime ∧ p i ∣ n + i + 1

theorem erdos_375.variants.legendre : Erdos375Prop →
    (∀ᶠ n in atTop, ∃ p ∈ Set.Ioo (n ^ 2) ((n + 1) ^ 2), Nat.Prime p) :=
  fun hp => LegendreConjecture.bounded_gap_legendre (erdos_375.variants.bounded_gap hp)

theorem erdos_375.variants.le_two : ∀ n ≥ 1, ∀ k ≤ 2, (∀ i < k, ¬ (n + i + 1).Prime) →
    ∃ p : Fin k → ℕ, p.Injective ∧ ∀ i, (p i).Prime ∧ p i ∣ n + i + 1 := by
  intro n hn k hk
  interval_cases k <;> intro h
  · simp_all; intro; grind
  · choose! p hp using (n + 1).exists_prime_and_dvd (by linarith)
    exact ⟨fun x => p, fun x => by grind, fun i => by simpa using hp⟩
  · choose! p hp using (fun i : Fin 2 => (n + i + 1).exists_prime_and_dvd (by linarith))
    refine ⟨p, fun x y hxy => ?_, hp⟩
    by_contra! hr
    wlog hq : x < y
    · exact this n hn k hk h p hp y x hxy.symm hr.symm (by grind)
    · have hy : y = x + 1 := by fin_cases x <;> fin_cases y <;> simp_all
      have := hy ▸ Nat.dvd_sub (hp y).2 (hxy ▸ (hp x).2)
      have := (hp 1).1
      simp_all [Nat.not_prime_one]

theorem erdos_375.variants.log :
    ∃ c > 0, ∀ n k : ℕ, k < c * (Real.log n / (Real.log (Real.log n))) ^ 3 → (∀ i < k, ¬ (n + i + 1).Prime) → ∃ p : Fin k → ℕ, p.Injective ∧ ∀ i, (p i).Prime ∧ p i ∣ n + i + 1 := by
  sorry

end Erdos375
