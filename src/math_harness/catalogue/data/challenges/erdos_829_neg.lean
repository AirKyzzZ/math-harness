import Mathlib

open AdditiveCombinatorics Asymptotics Filter

namespace Erdos829

def cubes : Set ℕ := {n | ∃ k, k ^ 3 = n}

lemma mem_cubes_iff (m : ℕ) : m ∈ cubes ↔ ∃ k, k < m + 1 ∧ k ^ 3 = m := by
  constructor
  · rintro ⟨k, rfl⟩
    refine ⟨k, ?_, rfl⟩
    have : k ≤ k ^ 3 := Nat.le_self_pow (by norm_num) k
    omega
  · rintro ⟨k, _, rfl⟩
    exact ⟨k, rfl⟩

theorem erdos_829_neg :
    ¬ (∃ C : ℕ, (fun n : ℕ => (sumRep cubes n : ℝ)) =O[atTop] (fun n : ℕ => (Real.log n) ^ C)) := by
  sorry

theorem sumRep_cubes_zero : sumRep cubes 0 = 1 := by
  simp only [sumRep_def, mem_cubes_iff]
  decide

theorem sumRep_cubes_two : sumRep cubes 2 = 1 := by
  simp only [sumRep_def, mem_cubes_iff]
  decide

theorem sumRep_cubes_three : sumRep cubes 3 = 0 := by
  simp only [sumRep_def, mem_cubes_iff]
  decide

theorem sumRep_cubes_taxicab : sumRep cubes 1729 = 4 := by
  simp only [sumRep_def, mem_cubes_iff]
  decide +native

namespace variants

end variants

end Erdos829
