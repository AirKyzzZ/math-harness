import Mathlib

open Filter

open scoped Topology

namespace Erdos235

noncomputable def N (k : ℕ) : ℕ :=
  primorial (Nat.nth Nat.Prime k)

def coprimeList (n : ℕ) : List ℕ :=
  ({a ∈ Finset.range n | n.Coprime a}).sort (· ≤ ·)

def gaps (n : ℕ) : List ℕ :=
  (coprimeList n).zipWith (fun a b ↦ b - a) (coprimeList n).tail

noncomputable def countGaps (n : ℕ) (c : ℝ) : ℕ :=
  (gaps n).countP fun g ↦ decide ((g : ℝ) ≤ c * (n : ℝ) / (n.totient : ℝ))

noncomputable def proportion (k : ℕ) (c : ℝ) : ℝ :=
  (countGaps (N k) c : ℝ) / ((N k).totient : ℝ)

theorem N_zero : N 0 = 2 := by
  simp [N, Nat.nth_prime_zero_eq_two, primorial_two]

theorem N_one : N 1 = 6 := by
  simp [N, Nat.nth_prime_one_eq_three]
  decide

theorem coprimeList_length (n : ℕ) : (coprimeList n).length = n.totient := by
  rw [coprimeList, Finset.length_sort (· ≤ ·), Nat.totient_eq_card_coprime]

theorem totient_N_pos (k : ℕ) : 0 < (N k).totient := by
  rw [Nat.totient_pos]
  exact primorial_pos (Nat.nth Nat.Prime k)

theorem erdos_235.variants.hooley (c : ℝ) (hc : 0 ≤ c) :
    Tendsto (fun k ↦ proportion k c) atTop (𝓝 (1 - Real.exp (-c))) := by
  sorry

end Erdos235
