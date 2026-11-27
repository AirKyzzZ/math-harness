import Mathlib

open Filter Asymptotics

open scoped ArithmeticFunction.omega

namespace Erdos1100

noncomputable def tauPerp (n : ℕ) : ℕ :=
  (Finset.univ.filter fun i : Fin (n.divisors.card - 1) ↦
    Nat.Coprime (Nat.nth (· ∣ n) i) (Nat.nth (· ∣ n) ((i : ℕ) + 1))).card

noncomputable def g (k : ℕ) : ℕ :=
  sSup {t : ℕ | ∃ n : ℕ, Squarefree n ∧ ω n = k ∧ tauPerp n = t}

theorem erdos_1100.variants.omega_le : ∀ n : ℕ, 0 < n → ω n ≤ tauPerp n := by
  intro n hn
  have hf : (Set.ofPred (· ∣ n)).Finite :=
    (Set.finite_Iic n).subset fun d hd => Nat.le_of_dvd hn hd
  have hcard : hf.toFinset.card = n.divisors.card := by
    congr 1
    ext d
    simp [hn.ne']
  have hω : ω n = n.primeFactors.card := by
    rw [ArithmeticFunction.cardDistinctFactors_apply, ← List.card_toFinset]
    rfl
  rw [hω]
  -- Each prime factor `p` is the upper member of a coprime pair of consecutive divisors: the
  -- divisor just below `p` is smaller than `p`, hence coprime to it.
  let S := Finset.univ.filter fun i : Fin (n.divisors.card - 1) ↦
    Nat.Coprime (Nat.nth (· ∣ n) i) (Nat.nth (· ∣ n) ((i : ℕ) + 1))
  have hsub : n.primeFactors ⊆
      S.image fun i : Fin (n.divisors.card - 1) => Nat.nth (· ∣ n) ((i : ℕ) + 1) := by
    intro p hp
    obtain ⟨hpp, hpn, -⟩ := Nat.mem_primeFactors.mp hp
    set j := Nat.count (· ∣ n) p with hj
    have h1 : 1 ≤ j := by
      have := Nat.count_strict_mono (p := (· ∣ n)) (one_dvd n) hpp.one_lt
      omega
    have hlt : j < hf.toFinset.card := Nat.count_lt_card hf hpn
    have hnth : Nat.nth (· ∣ n) (j - 1 + 1) = p := by
      rw [Nat.sub_add_cancel h1, hj, Nat.nth_count (p := (· ∣ n)) hpn]
    have hbelow : Nat.nth (· ∣ n) (j - 1) < p := by
      have := Nat.nth_lt_nth_of_lt_card hf (Nat.sub_lt h1 one_pos) hlt
      rwa [hj, Nat.nth_count (p := (· ∣ n)) hpn, ← hj] at this
    have hdvd : Nat.nth (· ∣ n) (j - 1) ∣ n := Nat.nth_mem_of_lt_card hf (by omega)
    have hpos : 0 < Nat.nth (· ∣ n) (j - 1) := Nat.pos_of_dvd_of_pos hdvd hn
    refine Finset.mem_image.mpr ⟨⟨j - 1, by omega⟩,
      Finset.mem_filter.mpr ⟨Finset.mem_univ _, ?_⟩, hnth⟩
    show Nat.Coprime (Nat.nth (· ∣ n) (j - 1)) (Nat.nth (· ∣ n) (j - 1 + 1))
    rw [hnth]
    exact ((Nat.Prime.coprime_iff_not_dvd hpp).mpr (Nat.not_dvd_of_pos_of_lt hpos hbelow)).symm
  calc n.primeFactors.card
      ≤ (S.image fun i : Fin (n.divisors.card - 1) => Nat.nth (· ∣ n) ((i : ℕ) + 1)).card :=
        Finset.card_le_card hsub
    _ ≤ S.card := Finset.card_image_le
    _ = tauPerp n := rfl

theorem erdos_1100.variants.erdos_tenenbaum_max :
    ∀ δ : ℝ, 0 < δ → ∀ᶠ x : ℝ in atTop, ∃ n : ℕ, (n : ℝ) ≤ x ∧ Real.exp (((Real.log 2) ^ 2 - δ) * Real.log x / (Real.log (Real.log x)) ^ 2) ≤ (tauPerp n : ℝ) := by
  sorry

end Erdos1100
