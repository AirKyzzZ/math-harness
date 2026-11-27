import Mathlib

open AdditiveCombinatorics Set

namespace Erdos1193

theorem erdos_1193.parts.i :
    ¬ ∀ (A : Set ℕ) (g : ℕ → ℕ), Monotone g → (∀ n, 0 < g n) →
      {n : ℕ | sumRep A n = g n}.lowerDensity = 0 := by
  have hset : {n : ℕ | sumRep Set.univ n = n + 1} = Set.univ := by ext n; simp [sumRep_def]

  intro h
  have := h Set.univ (fun n => n + 1) (fun _ _ h => by simpa using h) (fun n => Nat.succ_pos n)
  rw [hset, show (Set.univ : Set ℕ).lowerDensity = 1 from
    Filter.Tendsto.liminf_eq HasDensity.univ_nat_hasDensity_one] at this
  norm_num at this

theorem erdos_1193.parts.ii :
    ¬ ∃ c < (1 : ℝ), ∀ (A : Set ℕ) (g : ℕ → ℕ), Monotone g → (∀ n, 0 < g n) →
      {n : ℕ | sumRep A n = g n}.upperDensity < c := by
  have hset : {n : ℕ | sumRep Set.univ n = n + 1} = Set.univ := by ext n; simp [sumRep_def]

  rintro ⟨c, hc, h⟩
  have := h Set.univ (fun n => n + 1) (fun _ _ h => by simpa using h) (fun n => Nat.succ_pos n)
  rw [hset, show (Set.univ : Set ℕ).upperDensity = 1 from
    Filter.Tendsto.limsup_eq HasDensity.univ_nat_hasDensity_one] at this
  linarith

theorem erdos_1193.variants.sumRep_univ (n : ℕ) :
    sumRep (Set.univ : Set ℕ) n = n + 1 := by
  sorry

theorem erdos_1193.variants.upper_density_pos :
    ∃ (A : Set ℕ) (g : ℕ → ℕ), Monotone g ∧ (∀ n, 0 < g n) ∧
      0 < {n : ℕ | sumRep A n = g n}.upperDensity := by
  have hset : {n : ℕ | sumRep Set.univ n = n + 1} = Set.univ := by ext n; simp [sumRep_def]

  refine ⟨Set.univ, fun n => n + 1, fun _ _ h => by simpa using h, fun n => Nat.succ_pos n, ?_⟩
  rw [hset, show (Set.univ : Set ℕ).upperDensity = 1 from
    Filter.Tendsto.limsup_eq HasDensity.univ_nat_hasDensity_one]
  norm_num

end Erdos1193
