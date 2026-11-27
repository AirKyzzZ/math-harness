import Mathlib

open Filter Asymptotics

namespace Erdos1183

def IsMonochromatic {n : ℕ} (c : Finset (Fin n) → Bool) (ℱ : Finset (Finset (Fin n))) : Prop :=
  ∃ b : Bool, ∀ A ∈ ℱ, c A = b

noncomputable def f (n : ℕ) : ℕ :=
  sSup {m : ℕ | ∀ c : Finset (Fin n) → Bool, ∃ ℱ : Finset (Finset (Fin n)),
    m ≤ ℱ.card ∧ IsMonochromatic c ℱ ∧ IsSublattice (ℱ : Set (Finset (Fin n)))}

noncomputable def F (n : ℕ) : ℕ :=
  sSup {m : ℕ | ∀ c : Finset (Fin n) → Bool, ∃ ℱ : Finset (Finset (Fin n)),
    m ≤ ℱ.card ∧ IsMonochromatic c ℱ ∧ SupClosed (ℱ : Set (Finset (Fin n)))}

theorem erdos_1183.parts.iii_neg :
    ¬ ((∀ c : ℝ, ∀ᶠ n : ℕ in atTop, (n : ℝ) ^ c < (F n : ℝ)) ∧ ∀ ε : ℝ, 0 < ε → ∀ᶠ n : ℕ in atTop, (F n : ℝ) < (1 + ε) ^ n) := by
  sorry

theorem erdos_1183.variants.f_ge (n : ℕ) : ((n : ℝ) + 1) / 2 ≤ (f n : ℝ) := by
  classical
  -- The chain of initial segments `C k = {i | i < k}` for `0 ≤ k ≤ n`.
  let C : ℕ → Finset (Fin n) := fun k => Finset.univ.filter fun i => (i : ℕ) < k
  have hmono : ∀ j k, j ≤ k → C j ⊆ C k := fun j k hjk i hi => by
    simp only [C, Finset.mem_filter, Finset.mem_univ, true_and] at hi ⊢
    omega
  have hinj : Set.InjOn C (Finset.range (n + 1) : Set ℕ) := by
    intro j hj k hk hjk
    simp only [Finset.coe_range, Set.mem_Iio] at hj hk
    by_contra hne
    rcases Nat.lt_or_gt_of_ne hne with h | h
    · have hmem : (⟨j, by omega⟩ : Fin n) ∈ C k := by simp [C, h]
      rw [← hjk] at hmem
      simp [C] at hmem
    · have hmem : (⟨k, by omega⟩ : Fin n) ∈ C j := by simp [C, h]
      rw [hjk] at hmem
      simp [C] at hmem
  -- Half of the chain, rounded up, is a lower bound for `f n`.
  have hf : (n + 2) / 2 ≤ f n := by
    unfold f
    refine le_csSup ⟨Fintype.card (Finset (Fin n)), fun m hm => ?_⟩ fun c => ?_
    · obtain ⟨ℱ, h, -⟩ := hm fun _ => true
      exact h.trans (Finset.card_le_univ ℱ)
    · set 𝒞 : Finset (Finset (Fin n)) := (Finset.range (n + 1)).image C with h𝒞
      have hcard : 𝒞.card = n + 1 := by
        rw [h𝒞, Finset.card_image_of_injOn hinj, Finset.card_range]
      have hsplit := Finset.card_filter_add_card_filter_not (s := 𝒞) (fun A => c A = true)
      -- Any subfamily of the chain is a sublattice.
      have hsub : ∀ ℱ : Finset (Finset (Fin n)), ℱ ⊆ 𝒞 →
          IsSublattice (ℱ : Set (Finset (Fin n))) := by
        intro ℱ hℱ
        have hchain : ∀ A ∈ ℱ, ∀ B ∈ ℱ, A ≤ B ∨ B ≤ A := by
          intro A hA B hB
          obtain ⟨j, -, rfl⟩ := Finset.mem_image.mp (hℱ hA)
          obtain ⟨k, -, rfl⟩ := Finset.mem_image.mp (hℱ hB)
          rcases le_total j k with h | h
          · exact Or.inl (hmono j k h)
          · exact Or.inr (hmono k j h)
        refine ⟨fun A hA B hB => ?_, fun A hA B hB => ?_⟩
        · rcases hchain A hA B hB with h | h
          · rwa [sup_eq_right.mpr h]
          · rwa [sup_eq_left.mpr h]
        · rcases hchain A hA B hB with h | h
          · rwa [inf_eq_left.mpr h]
          · rwa [inf_eq_right.mpr h]
      by_cases hbig : (n + 2) / 2 ≤ (𝒞.filter fun A => c A = true).card
      · exact ⟨_, hbig, ⟨true, fun A hA => (Finset.mem_filter.mp hA).2⟩,
          hsub _ (Finset.filter_subset _ _)⟩
      · exact ⟨𝒞.filter fun A => ¬ c A = true, by omega,
          ⟨false, fun A hA => by simpa using (Finset.mem_filter.mp hA).2⟩,
          hsub _ (Finset.filter_subset _ _)⟩
  have h2 : n + 1 ≤ 2 * f n := by omega
  have h2' : (n : ℝ) + 1 ≤ 2 * (f n : ℝ) := by exact_mod_cast h2
  linarith

end Erdos1183
