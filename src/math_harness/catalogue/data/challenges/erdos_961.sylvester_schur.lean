import Mathlib

open Filter Real

namespace Erdos961

noncomputable def Erdos961Prop (k n : ℕ) : Prop :=
  ∀ m ≥ k + 1, ∃ i ∈ Set.Ico m (m + n), ¬ i ∈ Nat.smoothNumbers (k + 1)

theorem erdos_961.sylvester_schur (k : ℕ) (hk : 0 < k) :
    Erdos961Prop k k := by
  sorry

theorem erdos_961.variants.sylvester_schur_1_1 : Erdos961Prop 1 1 := by
  intro m hm
  use m
  constructor
  · simp
  · rw [Nat.mem_smoothNumbers]
    push Not
    intro hm0
    obtain ⟨p, hp, hpm⟩ := Nat.exists_prime_and_dvd (by omega : m ≠ 1)
    exact ⟨p, (Nat.mem_primeFactorsList hm0).mpr ⟨hp, hpm⟩, hp.two_le⟩

theorem erdos_961.variants.well_defined (k : ℕ) (hk : 0 < k): ∃ n, Erdos961Prop k n := by
  use k
  exact erdos_961.sylvester_schur k hk

noncomputable def f (k : ℕ) : ℕ :=
  open scoped Classical in
  if hk : 0 < k then Nat.find (erdos_961.variants.well_defined k hk) else 0

end Erdos961
