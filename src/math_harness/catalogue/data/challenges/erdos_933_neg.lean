import Mathlib

open Filter

namespace Erdos933

def k (n : ℕ) : ℕ := padicValNat 2 (n * (n + 1))

def l (n : ℕ) : ℕ := padicValNat 3 (n * (n + 1))

theorem erdos_933_neg :
    ¬ (atTop.limsup (fun n : ℕ ↦ ((((2 ^ k n * 3 ^ l n : ℕ) : ℝ) / ((n : ℝ) * Real.log (n : ℝ))) : EReal)) = ⊤) := by
  sorry

theorem erdos_933.variants.lower_bound :
    Set.Infinite { n : ℕ | ((2 ^ k n * 3 ^ l n : ℕ) : ℝ) > (n : ℝ) * Real.log (n : ℝ) } := by
  -- Witness: n = 2^(3^(r+1)); k n = 3^(r+1), l n = r+2 by LTE, and 3 > log 2.
  refine Set.infinite_of_injective_forall_mem
    (f := fun r : ℕ ↦ 2 ^ (3 ^ (r + 1))) ?_ fun r ↦ ?_
  · exact (Nat.pow_right_injective (a := 2) (by norm_num)).comp
      ((Nat.pow_right_injective (a := 3) (by norm_num)).comp (add_left_injective 1))
  let m := 3 ^ (r + 1)
  have hk : k (2 ^ m) = m := by
    rw [k, padicValNat.mul (by positivity) (by positivity), padicValNat.prime_pow,
      padicValNat.eq_zero_of_not_dvd
        ((Even.pow_of_ne_zero (by norm_num) (by positivity)).add_one).not_two_dvd_nat, add_zero]
  have hl : l (2 ^ m) = r + 2 := by
    rw [l, padicValNat.mul (by positivity) (by positivity),
      padicValNat_prime_prime_pow (p := 3) (q := 2) m (by norm_num), zero_add]
    rw [show 2 ^ m + 1 = 2 ^ m + 1 ^ m by simp,
      padicValNat.pow_add_pow (p := 3) (x := 2) (y := 1) (by norm_num)
        (by norm_num) (by norm_num) (by simpa [m] using (by norm_num : Odd 3).pow)]
    simp [m]
    lia
  have hlog : (m : ℝ) * Real.log 2 < (3 : ℝ) ^ (r + 2) := by
    calc
      _ < (m : ℝ) * 3 := mul_lt_mul_of_pos_left (by linarith [Real.log_two_lt_d9]) (by positivity)
      _ = _ := by norm_num [m, pow_succ]
  change 2 ^ m ∈ {n | ((2 ^ k n * 3 ^ l n : ℕ) : ℝ) > (n : ℝ) * Real.log (n : ℝ)}
  simp only [Set.mem_ofPred_eq, hk, hl]
  push_cast
  rw [Real.log_pow]
  exact mul_lt_mul_of_pos_left hlog (by positivity)

end Erdos933
