import Mathlib

open Filter Real

open scoped Topology

namespace Erdos786

open Erdos786

-- TODO : add variants that allow repetition.

-- According to the updated website, Erdos likely intended repetitions to be allowed here

-- however, the analogous questions without repetition are also open.

def Set.IsMulCardSet {α : Type*} [CommMonoid α] (A : Set α) :=
  ∀ (a b : Finset α) (_ :↑a ⊆ A) (_ : ↑b ⊆ A) (_ : a.prod id = b.prod id),
    a.card = b.card

theorem erdos_786.parts.ii :
    ∃ (A : ℕ → Set ℕ) (f : ℕ → ℝ) (_ : f =o[atTop] (1 : ℕ → ℝ)), ∀ N, A N ⊆ Set.Icc 1 (N + 1) ∧ (1 - f N) * N ≤ (A N).ncard ∧ (A N).IsMulCardSet := by
  sorry

theorem erdos_786.parts.i.example (A : Set ℕ) (hA : A = { n | n % 4 = 2 }) :
    A.HasDensity (1 / 4) ∧ A.IsMulCardSet := by
  subst hA
  constructor
  · -- Exactly `(n + 1) / 4` of the naturals below `n` are `≡ 2 (mod 4)`.
    have hfin : ∀ n : ℕ, ((Finset.range n).filter fun m ↦ m % 4 = 2).card = (n + 1) / 4 := by
      intro n
      induction n with
      | zero => simp
      | succ n ih =>
        rw [Finset.range_add_one, Finset.filter_insert]
        split
        · rw [Finset.card_insert_of_notMem (by simp)]; omega
        · omega
    have hcard : ∀ n : ℕ, ({m : ℕ | m % 4 = 2} ∩ Set.Iio n).ncard = (n + 1) / 4 := by
      intro n
      have hset : {m : ℕ | m % 4 = 2} ∩ Set.Iio n
          = ↑((Finset.range n).filter fun m ↦ m % 4 = 2) := by
        ext m; simp [Set.mem_Iio, and_comm]
      rw [hset, Set.ncard_coe_finset, hfin]
    rw [Set.HasDensity]
    have hpd : ∀ n : ℕ, ({m : ℕ | m % 4 = 2}).partialDensity Set.univ n
        = (((n + 1) / 4 : ℕ) : ℝ) / (n : ℝ) := by
      intro n
      rw [Set.partialDensity, Set.inter_univ, Set.univ_inter, hcard, Nat.ncard_Iio]
    simp only [hpd]
    -- Squeeze `⌊(n + 1) / 4⌋ / n` between `1 / 4 - 1 / n` and `1 / 4 + 1 / n`.
    have hbdd : ∀ n : ℕ, 1 ≤ n →
        1 / 4 - 1 / (n : ℝ) ≤ (((n + 1) / 4 : ℕ) : ℝ) / (n : ℝ) ∧
          (((n + 1) / 4 : ℕ) : ℝ) / (n : ℝ) ≤ 1 / 4 + 1 / (n : ℝ) := by
      intro n hn
      have hn0 : (0 : ℝ) < n := by exact_mod_cast hn
      have h1 : 4 * ((n + 1) / 4) ≤ n + 1 := by omega
      have h2 : n + 1 < 4 * ((n + 1) / 4) + 4 := by omega
      have c1 : (4 : ℝ) * (((n + 1) / 4 : ℕ) : ℝ) ≤ (n : ℝ) + 1 := by exact_mod_cast h1
      have c2 : (n : ℝ) + 1 < 4 * (((n + 1) / 4 : ℕ) : ℝ) + 4 := by exact_mod_cast h2
      constructor
      · rw [le_div_iff₀ hn0]; field_simp; linarith
      · rw [div_le_iff₀ hn0]; field_simp; linarith
    have hlim : ∀ c : ℝ, Tendsto (fun n : ℕ ↦ 1 / 4 + c * (1 / (n : ℝ))) atTop (𝓝 (1 / 4)) := by
      intro c
      simpa using Tendsto.const_add (1 / 4 : ℝ)
        (Tendsto.const_mul c tendsto_one_div_atTop_nhds_zero_nat)
    refine tendsto_of_tendsto_of_tendsto_of_le_of_le'
      (by simpa using hlim (-1)) (by simpa using hlim 1)
      (eventually_atTop.2 ⟨1, fun n hn ↦ ?_⟩) (eventually_atTop.2 ⟨1, fun n hn ↦ ?_⟩)
    · simpa using (hbdd n hn).1
    · simpa using (hbdd n hn).2
  · -- Every element of the set is exactly divisible by `2`, so the `2`-adic valuation of a
    -- product of distinct such elements is the number of factors.
    have key : ∀ s : Finset ℕ, ↑s ⊆ {n : ℕ | n % 4 = 2} →
        (s.prod id).factorization 2 = s.card := by
      intro s hs
      have hmem : ∀ i ∈ s, i % 4 = 2 := fun i hi ↦ hs hi
      have h0 : ∀ i ∈ s, id i ≠ 0 := fun i hi ↦ by
        have := hmem i hi; simp only [id]; omega
      rw [Nat.factorization_prod h0]
      simp only [Finsupp.finsetSum_apply]
      rw [Finset.sum_congr rfl (g := fun _ ↦ 1) fun i hi ↦ ?_, Finset.sum_const, smul_eq_mul,
        mul_one]
      have h4 := hmem i hi
      have hi0 : i ≠ 0 := by omega
      have hd1 : 2 ^ 1 ∣ i := by omega
      have hd2 : ¬ (2 ^ 2 ∣ i) := by omega
      rw [Nat.Prime.pow_dvd_iff_le_factorization Nat.prime_two hi0] at hd1
      rw [Nat.Prime.pow_dvd_iff_le_factorization Nat.prime_two hi0] at hd2
      simp only [id]
      omega
    intro a b ha hb hprod
    rw [← key a ha, ← key b hb, hprod]

noncomputable def consecutivePrimesFrom (p : ℕ) (k : ℕ) : Finset ℕ :=
    (Finset.range (k + 1)).image (Nat.nth (fun q ↦ q.Prime ∧ p ≤ q))

theorem nth_zero {p : ℕ} (hp : p.Prime) :
    Nat.nth (fun q ↦ q.Prime ∧ p ≤ q) 0 = p := by
  simpa [Nat.nth_zero] using IsLeast.csInf_eq <| by
    aesop (add simp [IsLeast, mem_lowerBounds])

lemma consecutivePrimesFrom_zero {p : ℕ} (hp : p.Prime) : consecutivePrimesFrom p 0 = {p} := by
  simpa [consecutivePrimesFrom] using nth_zero hp

lemma consecutivePrimesFrom_two_one : consecutivePrimesFrom 2 1 = {2, 3} := by
  have h : Nat.nth (fun q ↦ q.Prime ∧ 2 ≤ q) 1 = 3 := by
    exact Nat.nth_count (p := (fun q ↦ q.Prime ∧ 2 ≤ q)) (by decide : (3).Prime ∧ 2 ≤ 3)
  ext q
  simp only [consecutivePrimesFrom, Finset.mem_image, Finset.mem_range, Finset.mem_insert,
    Finset.mem_singleton]
  constructor
  · rintro ⟨i, hi, hq⟩
    cases i with
    | zero => simpa [← hq] using .inl (nth_zero Nat.prime_two)
    | succ i => grind
  · rintro (rfl | rfl); exact ⟨0, by grind, nth_zero Nat.prime_two⟩; exact ⟨1, by grind⟩

-- Reworded slightly using https://users.renyi.hu/~p_erdos/1969-14.pdf p. 81

-- See https://users.renyi.hu/~p_erdos/1965-02.pdf p. 182 for the multiplicity one condition

end Erdos786
