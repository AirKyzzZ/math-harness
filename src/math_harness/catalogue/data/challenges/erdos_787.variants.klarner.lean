import Mathlib

open Filter Asymptotics

namespace Erdos787

noncomputable def g (G : Type*) [Add G] [DecidableEq G] (n : ℕ) : ℕ :=
  sSup {m : ℕ | ∀ A : Finset G, A.card = n →
    ∃ B ⊆ A, m ≤ B.card ∧ Disjoint B.restrictedSumset A}

theorem disjoint_restrictedSumset_iff {G : Type*} [Add G] [DecidableEq G] (A B : Finset G) :
    Disjoint B.restrictedSumset A ↔ ∀ b₁ ∈ B, ∀ b₂ ∈ B, b₁ ≠ b₂ → b₁ + b₂ ∉ A := by
  unfold Finset.restrictedSumset
  rw [Finset.disjoint_left]
  constructor
  · intro h b₁ hb₁ b₂ hb₂ hne hmem
    have hmem' : b₁ + b₂ ∈ Finset.image (fun p : G × G => p.1 + p.2) B.offDiag :=
      Finset.mem_image.2 ⟨(b₁, b₂), Finset.mem_offDiag.2 ⟨hb₁, hb₂, hne⟩, rfl⟩
    exact h hmem' hmem
  · intro h x hx hxA
    obtain ⟨⟨b₁, b₂⟩, hp, rfl⟩ := Finset.mem_image.1 hx
    obtain ⟨hb₁, hb₂, hne⟩ := Finset.mem_offDiag.1 hp
    exact h b₁ hb₁ b₂ hb₂ hne hxA

theorem le_g {n m : ℕ} (h : ∀ A : Finset ℝ, A.card = n →
    ∃ B ⊆ A, m ≤ B.card ∧ Disjoint B.restrictedSumset A) : m ≤ g ℝ n := by
  refine le_csSup (bddAbove_def.2 ⟨n, fun m' hm' => ?_⟩) h
  have hm'' : ∀ A : Finset ℝ, A.card = n →
      ∃ B ⊆ A, m' ≤ B.card ∧ Disjoint B.restrictedSumset A := hm'
  obtain ⟨A, hA⟩ := Infinite.exists_subset_card_eq ℝ n
  obtain ⟨B, hBA, hmB, -⟩ := hm'' A hA
  exact hmB.trans ((Finset.card_le_card hBA).trans_eq hA)

theorem erdos_787.variants.klarner :
    ∃ c > (0 : ℝ), ∀ᶠ n : ℕ in atTop, c * Real.log n ≤ (g ℝ n : ℝ) := by
  sorry

end Erdos787
