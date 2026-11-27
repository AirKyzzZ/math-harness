import Mathlib

open Filter

open scoped Finset

namespace Erdos864

def sumRepresentations (A : Finset ℕ) (n : ℕ) : Finset (ℕ × ℕ) :=
  {p ∈ A ×ˢ A | p.1 ≤ p.2 ∧ p.1 + p.2 = n}

def HasAtMostOneRepeatedSum (A : Finset ℕ) : Prop :=
  ∀ n m : ℕ, 1 < #(sumRepresentations A n) → 1 < #(sumRepresentations A m) → n = m

theorem erdos_864.variants.lower_bound :
    ∀ ε : ℝ, 0 < ε → ∀ᶠ N : ℕ in atTop, ∃ A ⊆ Finset.Icc 1 N, HasAtMostOneRepeatedSum A ∧ (1 - ε) * (2 / Real.sqrt 3) * Real.sqrt (N : ℝ) ≤ #A := by
  sorry

theorem hasAtMostOneRepeatedSum_of_isSidon {A : Finset ℕ} (hA : IsSidon (A : Set ℕ)) :
    HasAtMostOneRepeatedSum A := by
  intro n m hn _
  exfalso
  obtain ⟨p, hp, q, hq, hpq⟩ := Finset.one_lt_card.1 hn
  simp only [sumRepresentations, Finset.mem_filter, Finset.mem_product] at hp hq
  obtain ⟨⟨hp1, hp2⟩, hp3, hp4⟩ := hp
  obtain ⟨⟨hq1, hq2⟩, hq3, hq4⟩ := hq
  rcases hA p.1 (Finset.mem_coe.2 hp1) q.1 (Finset.mem_coe.2 hq1)
      p.2 (Finset.mem_coe.2 hp2) q.2 (Finset.mem_coe.2 hq2) (by omega) with ⟨h1, h2⟩ | ⟨h1, h2⟩
  · exact hpq (Prod.ext h1 h2)
  · exact hpq (Prod.ext (by omega) (by omega))

theorem hasAtMostOneRepeatedSum_one_two_three : HasAtMostOneRepeatedSum {1, 2, 3} := by
  have key : ∀ n, 1 < #(sumRepresentations {1, 2, 3} n) → n = 4 := by
    intro n hn
    obtain ⟨⟨a, b⟩, hp, ⟨c, d⟩, hq, hpq⟩ := Finset.one_lt_card.1 hn
    simp only [sumRepresentations, Finset.mem_filter, Finset.mem_product, Finset.mem_insert,
      Finset.mem_singleton] at hp hq
    have hne : a ≠ c ∨ b ≠ d := by
      rw [Ne, Prod.mk.injEq, not_and_or] at hpq
      exact hpq
    omega
  intro n m hn hm
  rw [key n hn, key m hm]

theorem not_hasAtMostOneRepeatedSum_Icc_one_four :
    ¬ HasAtMostOneRepeatedSum (Finset.Icc 1 4) := by
  intro h
  have h4 : 1 < #(sumRepresentations (Finset.Icc 1 4) 4) := by decide +kernel
  have h5 : 1 < #(sumRepresentations (Finset.Icc 1 4) 5) := by decide +kernel
  have := h 4 5 h4 h5
  omega

end Erdos864
