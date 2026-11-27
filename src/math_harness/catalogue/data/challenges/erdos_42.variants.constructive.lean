import Mathlib

open Function Set Filter

open scoped Pointwise

namespace Erdos42

theorem erdos_42.variants.constructive :
    ∃ (f : ℕ → ℕ), ∀ (M N : ℕ) (_ : 1 ≤ M) (_ : f M ≤ N), ∀ (A : Set ℕ) (_ : IsMaximalSidonSetIn A N), ∃ᵉ (B : Set ℕ), B ⊆ Set.Icc 1 N ∧ IsSidon B ∧ B.ncard = M ∧ ((A - A) ∩ (B - B)) = {0} := by
  sorry

theorem example_maximal_sidon : IsMaximalSidonSetIn {1, 2, 4} 4 := by
  refine ⟨?_, ?_, ?_⟩
  · intro x hx
    simp only [Set.mem_insert_iff, Set.mem_singleton_iff] at hx
    rcases hx with rfl | rfl | rfl <;> simp [Set.mem_Icc]
  · intro i₁ hi₁ j₁ hj₁ i₂ hi₂ j₂ hj₂ hsum
    simp only [Set.mem_insert_iff, Set.mem_singleton_iff] at hi₁ hj₁ hi₂ hj₂
    rcases hi₁ with rfl | rfl | rfl <;>
    rcases hj₁ with rfl | rfl | rfl <;>
    rcases hi₂ with rfl | rfl | rfl <;>
    rcases hj₂ with rfl | rfl | rfl <;>
    simp_all
  · intro x hx hxA
    simp only [Set.mem_Icc] at hx; obtain ⟨hx1, hx2⟩ := hx
    simp only [Set.mem_insert_iff, Set.mem_singleton_iff, not_or] at hxA
    obtain ⟨hne1, hne2, hne4⟩ := hxA
    have hx3 : x = 3 := (by omega); subst hx3
    intro hbad
    have := hbad 1 (by simp) 2 (by simp) 3 (by simp) 2 (by simp) (by norm_num)
    rcases this with ⟨h1, h2⟩ | ⟨h1, h2⟩ <;> omega

theorem example_difference_set : ({1, 2, 4} : Set ℕ) - {1, 2, 4} = {0, 1, 2, 3} := by
  ext x
  simp only [Set.mem_sub, Set.mem_insert_iff, Set.mem_singleton_iff]
  constructor
  · rintro ⟨a, ha, b, hb, rfl⟩
    rcases ha with rfl | rfl | rfl <;>
    rcases hb with rfl | rfl | rfl <;>
    simp
  · rintro (rfl | rfl | rfl | rfl)
    · exact ⟨1, by decide, 1, by decide, by decide⟩
    · exact ⟨2, by decide, 1, by decide, by decide⟩
    · exact ⟨4, by decide, 2, by decide, by decide⟩
    · exact ⟨4, by decide, 1, by decide, by decide⟩

theorem maximal_sidon_contains_zero (A : Set ℕ) (N : ℕ) (hN : 1 ≤ N)
    (hA : IsMaximalSidonSetIn A N) : 0 ∈ A - A := by
  obtain ⟨hAsub, hAsidon, hAmax⟩ := hA
  have hne : A.Nonempty
  · by_contra hemp; rw [Set.not_nonempty_iff_eq_empty] at hemp
    exact hAmax (Set.mem_Icc.mpr ⟨le_refl 1, hN⟩)
      (by rw [hemp]; exact id) (by
        rw [hemp, Set.empty_union]
        exact fun _ hi _ hj _ hk _ hl _ => by
          simp only [Set.mem_singleton_iff] at hi hj hk hl
          subst hi
          subst hj
          subst hk
          subst hl
          exact Or.inl ⟨rfl, rfl⟩)
  obtain ⟨a, ha⟩ := hne
  have := Set.sub_mem_sub ha ha
  rwa [Nat.sub_self] at this

end Erdos42
