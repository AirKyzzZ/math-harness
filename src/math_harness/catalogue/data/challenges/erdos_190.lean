import Mathlib

open Filter

namespace Erdos190

def IsCanonical (N k : ℕ) : Prop :=
  ∀ c : ℕ → ℕ, ∃ S ⊆ Set.Icc 1 N, S.IsAPOfLength k ∧ ((∃ γ, ∀ n ∈ S, c n = γ) ∨ S.InjOn c)

noncomputable def H (k : ℕ) : ℕ := sInf {N | IsCanonical N k}

theorem isCanonical_two_two : IsCanonical 2 2 := by
  intro c
  refine ⟨{1, 2}, ?_, by exact_mod_cast Nat.isAPOfLength_pair (by norm_num : 1 < 2), ?_⟩
  · rintro x (rfl | rfl) <;> simp
  · by_cases h : c 1 = c 2
    · exact Or.inl ⟨c 1, by rintro n (rfl | rfl) <;> simp [h]⟩
    · refine Or.inr ?_
      rintro x (rfl | rfl) y (rfl | rfl) hxy <;> simp_all

theorem not_isCanonical_one_two : ¬ IsCanonical 1 2 := by
  intro h
  obtain ⟨S, hS, ⟨a, d, hcard, -⟩, -⟩ := h id
  have h1 : S.encard ≤ 1 := by
    calc S.encard ≤ (Set.Icc 1 1 : Set ℕ).encard := Set.encard_le_encard hS
      _ = 1 := by simp
  have h2 : S.encard = 2 := by exact_mod_cast hcard
  rw [h2] at h1
  exact absurd h1 (by decide)

theorem H_two : H 2 = 2 := by
  apply le_antisymm (Nat.sInf_le isCanonical_two_two)
  refine le_csInf ⟨2, isCanonical_two_two⟩ fun N hN => ?_
  by_contra hlt
  interval_cases N
  · obtain ⟨S, hS, ⟨a, d, hcard, -⟩, -⟩ := hN id
    have : S = ∅ := by
      ext x; simp only [Set.mem_empty_iff_false, iff_false]; intro hx; simpa using hS hx
    subst this
    simp at hcard
  · exact not_isCanonical_one_two hN

theorem erdos_190 :
    ∀ C : ℕ, ∀ᶠ k in atTop, ∀ N, IsCanonical N k → (C * k) ^ k < N := by
  sorry

end Erdos190
