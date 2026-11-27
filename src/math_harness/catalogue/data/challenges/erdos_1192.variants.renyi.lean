import Mathlib

open Nat Filter Finset Set

open scoped Asymptotics BigOperators

namespace Erdos1192

noncomputable def f_r (A : Set ℕ) (r n : ℕ) : ℕ :=
  { v : Fin r → ℕ | (∀ i, v i ∈ A) ∧ ∑ i, v i = n }.ncard

theorem erdos_1192.f_r_zero_zero (A : Set ℕ) : f_r A 0 0 = 1 := by
  dsimp [f_r]
  have h : { v : Fin 0 → ℕ | (∀ i, v i ∈ A) ∧ ∑ i, v i = 0 } = { default } := by
    ext v
    simp [eq_iff_true_of_subsingleton]
  rw [h, Set.ncard_singleton]

theorem erdos_1192.f_r_empty (r n : ℕ) : f_r ∅ (r + 1) n = 0 := by
  dsimp [f_r]
  have h : { v : Fin (r + 1) → ℕ | (∀ i, v i ∈ (∅ : Set ℕ)) ∧ ∑ i, v i = n } = ∅ := by
    ext v
    simp
  rw [h, Set.ncard_empty]

theorem erdos_1192.f_r_singleton_self (n : ℕ) : f_r {n} 1 n = 1 := by
  dsimp [f_r]
  have h : { v : Fin 1 → ℕ | (∀ i, v i ∈ ({n} : Set ℕ)) ∧ ∑ i, v i = n } = { fun _ ↦ n } := by
    ext v
    simp only [Set.mem_ofPred_eq, Set.mem_singleton_iff]
    constructor
    · rintro ⟨h1, _⟩
      ext i
      exact h1 i
    · rintro rfl
      refine ⟨fun _ ↦ rfl, ?_⟩
      simp
  rw [h, Set.ncard_singleton]

theorem erdos_1192.f_r_no_rep : f_r {0} 1 1 = 0 := by
  dsimp [f_r]
  have h : { v : Fin 1 → ℕ | (∀ i, v i ∈ ({0} : Set ℕ)) ∧ ∑ i, v i = 1 } = ∅ := by
    ext v
    simp only [Set.mem_ofPred_eq, Set.mem_singleton_iff, Set.mem_empty_iff_false, iff_false]
    rintro ⟨h1, h2⟩
    have h3 : v = fun _ ↦ 0 := by ext i; exact h1 i
    rw [h3] at h2
    revert h2
    simp
  rw [h, Set.ncard_empty]

open scoped Classical in
theorem erdos_1192.variants.renyi :
    ∀ r ≥ 2, ∃ A : Set ℕ, ((fun (x : ℕ) ↦ ∑ n ∈ range (x + 1), (f_r A r n : ℝ) ^ 2) =O[atTop] (fun (x : ℕ) ↦ (x : ℝ))) ∧ ((fun (x : ℕ) ↦ (x : ℝ) ^ (1 / (r : ℝ))) =O[atTop] (fun (x : ℕ) ↦ (count (· ∈ A) x : ℝ))) := by
  sorry

end Erdos1192
