import Mathlib

namespace Erdos358

open Filter Finset

def intervalRepresentations (A : ℕ → ℕ) (n : ℕ) : Set (ℕ × ℕ) :=
  {(u, v) | 0 < u ∧ 0 < v ∧ n = ∑ i ∈ Icc u v, A i}

noncomputable def f (A : ℕ → ℕ) (n : ℕ) : ℕ :=
  Nat.card (intervalRepresentations A n)

def intervalRepresentationsNonTrivial (A : ℕ → ℕ) (n : ℕ) : Set (ℕ × ℕ) :=
  {(u, v) | 0 < u ∧ 0 < v ∧ u < v ∧ n = ∑ i ∈ Icc u v, A i}

noncomputable def g (A : ℕ → ℕ) (n : ℕ) : ℕ :=
  Nat.card (intervalRepresentationsNonTrivial A n)

theorem erdos_358.variants.prime_set :
    atTop.limsup (fun n ↦ (f (Nat.nth Nat.Prime) n : ℕ∞)) = ⊤ := by
  sorry

theorem one_le_g_of_two_le_f {A : ℕ → ℕ} (hA : StrictMono A) {n : ℕ} (hn : 0 < n)
    (hf : 2 ≤ f A n) : 1 ≤ g A n := by
  classical
  have hfin : (intervalRepresentations A n).Finite := by
    rcases Set.finite_or_infinite (intervalRepresentations A n) with h | h
    · exact h
    · rw [f, @Nat.card_eq_zero_of_infinite _ h.to_subtype] at hf
      omega
  have hsub : intervalRepresentationsNonTrivial A n ⊆ intervalRepresentations A n := by
    rintro ⟨u, v⟩ hr
    simp only [intervalRepresentationsNonTrivial, Set.mem_ofPred_eq] at hr
    simp only [intervalRepresentations, Set.mem_ofPred_eq]
    exact ⟨hr.1, hr.2.1, hr.2.2.2⟩
  refine (Set.ncard_pos (hfin.subset hsub)).mpr ?_
  by_contra hempty
  rw [Set.not_nonempty_iff_eq_empty] at hempty
  -- Without a representation of length at least two, every representation is a single term.
  have key : ∀ r ∈ intervalRepresentations A n, r.1 = r.2 ∧ A r.1 = n := by
    rintro ⟨u, v⟩ hr
    simp only [intervalRepresentations, Set.mem_ofPred_eq] at hr
    obtain ⟨hu, hv, hsum⟩ := hr
    have hle : u ≤ v := by
      by_contra hc
      rw [Finset.Icc_eq_empty hc, Finset.sum_empty] at hsum
      omega
    have huv : u = v := by
      rcases eq_or_lt_of_le hle with h | h
      · exact h
      · exact absurd (Set.eq_empty_iff_forall_notMem.mp hempty (u, v)
          (by simp only [intervalRepresentationsNonTrivial, Set.mem_ofPred_eq]
              exact ⟨hu, hv, h, hsum⟩)) (by simp)
    subst huv
    exact ⟨rfl, by simpa using hsum.symm⟩
  -- Injectivity of `A` then makes that single term unique, contradicting `2 ≤ f A n`.
  have := hfin.to_subtype
  obtain ⟨p, hp, q, hq, hpq⟩ := Set.one_lt_ncard_iff_nontrivial.mp hf
  obtain ⟨hp₁, hpn⟩ := key p hp
  obtain ⟨hq₁, hqn⟩ := key q hq
  exact hpq (Prod.ext (hA.injective (hpn.trans hqn.symm))
    (by rw [← hp₁, ← hq₁]; exact hA.injective (hpn.trans hqn.symm)))

theorem erdos_358.variants.one_le :
    ∃ A, StrictMono A ∧ ∀ᶠ n in atTop, 1 ≤ g A n := by
  obtain ⟨A, hA, hf⟩ := erdos_358.parts.ii
  refine ⟨A, hA, ?_⟩
  filter_upwards [hf, eventually_gt_atTop 0] with n hn hn₀
  exact one_le_g_of_two_le_f hA hn₀ hn

end Erdos358
