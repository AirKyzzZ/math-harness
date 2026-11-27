import Mathlib

open Finset

namespace Erdos703

noncomputable def T (n r : ℕ) : ℕ :=
  sSup {k | ∃ 𝓕 : Finset (Finset (Fin n)),
    (∀ A ∈ 𝓕, ∀ B ∈ 𝓕, (A ∩ B).card ≠ r) ∧ 𝓕.card = k}

theorem erdos_703.variants.zero (n : ℕ) (hn : 1 ≤ n) : T n 0 = 2 ^ (n - 1) := by
  have : Nonempty (Fin n) := ⟨⟨0, hn⟩⟩
  have hcard : Fintype.card (Finset (Fin n)) = 2 * 2 ^ (n - 1) := by
    rw [Fintype.card_finset, Fintype.card_fin, ← pow_succ']
    congr 1
    omega
  have hiff : ∀ A B : Finset (Fin n), (A ∩ B).card ≠ 0 ↔ ¬ Disjoint A B := by
    intro A B
    rw [Ne, Finset.card_eq_zero, Finset.disjoint_iff_inter_eq_empty]
  unfold T
  apply le_antisymm
  · refine csSup_le' ?_
    rintro _ ⟨𝓕, h𝓕, rfl⟩
    have h : (𝓕 : Set (Finset (Fin n))).Intersecting := by
      intro A hA B hB
      exact (hiff A B).1 (h𝓕 A (Finset.mem_coe.1 hA) B (Finset.mem_coe.1 hB))
    have := h.card_le
    omega
  · have h0 : ((∅ : Finset (Finset (Fin n))) : Set (Finset (Fin n))).Intersecting := by
      simp [Set.intersecting_empty]
    obtain ⟨t, -, ht, hti⟩ := h0.exists_card_eq
    refine le_csSup ⟨2 ^ n, ?_⟩ ⟨t, fun A hA B hB ↦ (hiff A B).2
      (hti (Finset.mem_coe.2 hA) (Finset.mem_coe.2 hB)), by omega⟩
    rintro _ ⟨𝓕, -, rfl⟩
    exact (Finset.card_le_univ 𝓕).trans (by rw [Fintype.card_finset, Fintype.card_fin])

theorem erdos_703.variants.frankl_furedi (r : ℕ) :
    ∀ᶠ n : ℕ in Filter.atTop, T n r = if (n + r) % 2 = 1 then ((univ : Finset (Finset (Fin n))).filter fun A ↦ (n + r : ℝ) / 2 < A.card ∨ A.card < r).card else ((univ : Finset (Finset (Fin n))).filter fun A ↦ (n + r : ℝ) / 2 ≤ (A.filter fun i : Fin n ↦ (i : ℕ) ≠ 0).card ∨ A.card < r).card := by
  sorry

end Erdos703
