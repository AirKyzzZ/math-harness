import Mathlib

open Finset SimpleGraph

open scoped Nat

namespace Erdos835

variable {n k : ℕ}

def Property (k : ℕ) : Prop :=
  let K := {s : Finset (Fin (2 * k)) // s.card = k}
  ∃ c : K → Fin (k + 1),
    ∀ A : Finset (Fin (2 * k)), A.card = k + 1 →
      (image c {s : K | s.val ⊂ A}) = (univ : Finset (Fin (k+1)))

theorem erdos_835_neg :
    ¬ (∃ k > 2, Property k) := by
  sorry

def johnsonBound : ℕ → ℕ → ℕ → ℕ
  | 0, _d, _w => 1
  | _n, _d, 0 => 1
  | n + 1, d, w + 1 => if 2 * (w + 1) < d then 1 else (n + 1) * johnsonBound n d w / (w + 1)

lemma div_johnsonBound_le_chromaticNum_johnson :
    ⌈(n.choose k / johnsonBound n 4 k : ℚ≥0)⌉₊ ≤ χ(J(n, k)) := by
  obtain hnk | hkn := lt_or_ge n k
  · simp [Nat.choose_eq_zero_of_lt, *]
  have : Nonempty {s : Finset (Fin n) // #s = k} := by
    simpa [Finset.Nonempty] using Finset.powersetCard_nonempty (s := .univ).2 <| by simpa
  grw [← card_div_indepNum_le_chromaticNumber, indepNum_johnson_le_johnsonBound] <;> simp

theorem chromaticNumber_johnson_2k_k_lower_bound_odd (hk : 3 ≤ k) (hk' : k ≤ 300) (hk_odd : Odd k) :
    k + 1 < J(2 * k, k).chromaticNumber := by
  grw [← div_johnsonBound_le_chromaticNum_johnson]
  decide +revert +kernel

theorem johnsonGraph_chromaticNumber_odd_of_johnson_chromaticNumber_composite :
    (type_of% johnson_chromaticNumber_composite) → (type_of% johnson_chromaticNumber_odd) := by
  intro h k hk h_odd
  refine h k hk ⟨by omega, ?_⟩
  rw [Nat.not_prime_iff_exists_dvd_lt (by omega)]
  use 2
  constructor
  · exact even_iff_two_dvd.mp (Odd.add_one h_odd)
  · omega

end Erdos835
