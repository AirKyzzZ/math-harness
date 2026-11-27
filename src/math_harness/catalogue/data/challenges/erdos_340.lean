import Mathlib

meta import FormalConjecturesForMathlib.Combinatorics.Basic

open Filter Finset

open scoped Real Pointwise

namespace Erdos340

theorem greedySidon_go_singleton_two : (greedySidon.go {1} (by simp [IsSidon]) 2).val = 2 := by
  norm_num [greedySidon, greedySidon.aux, greedySidon.go, Nat.find_eq_iff, IsSidon]
  lia

theorem greedySidon_go_pair_three : (greedySidon.go {1, 2} (by simp [IsSidon]) 3).val = 4 := by
  norm_num [greedySidon, greedySidon.aux, greedySidon.go, Nat.find_eq_iff, IsSidon]
  lia

theorem greedySidon_zero : greedySidon 0 = 1 := rfl

theorem greedySidon_one : greedySidon 1 = 2 := by
  simp [greedySidon, greedySidon.aux, greedySidon.go]
  norm_num [Nat.find_eq_iff, IsSidon]
  lia

theorem greedySidon_two : greedySidon 2 = 4 := by
  decide +native

theorem greedySidon_three : greedySidon 3 = 8 := by
  decide +native

theorem greedySidon_four : greedySidon 4 = 13 := by
  decide +native

theorem greedySidon_five : greedySidon 5 = 21 := by
  decide +native

theorem greedySidon_ten : greedySidon 10 = 97 := by
  decide +native

theorem erdos_340 (ε : ℝ) (hε : ε > 0) :
    (fun n : ℕ ↦ √n / n ^ ε) =O[atTop] fun n : ℕ ↦ ((Set.range greedySidon ∩ Set.Icc 1 n).ncard : ℝ) := by
  sorry

theorem erdos_340.variants._22_mem_sub :
    22 ∈ Set.range greedySidon - Set.range greedySidon := by
  have h : (22 : ℕ) = greedySidon 14 - greedySidon 13 := by decide +native
  rw [h]
  exact Set.sub_mem_sub (Set.mem_range_self 14) (Set.mem_range_self 13)

-- Formalisation note: there is some slight ambiguity in the meaning of

-- "almost all" so we provide two variants for "all but finitely many"

-- and "outside of a set of density zero"; there may be other reasonable

-- interpretations

end Erdos340
