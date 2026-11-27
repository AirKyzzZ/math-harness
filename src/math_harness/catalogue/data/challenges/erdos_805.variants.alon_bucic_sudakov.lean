import Mathlib

open Filter

namespace Erdos805

def IsLocallyRamsey {n : ℕ} (G : SimpleGraph (Fin n)) (m k : ℕ) : Prop :=
  ∀ S : Finset (Fin n), S.card = m →
    (∃ C ⊆ S, k ≤ C.card ∧ G.IsClique (C : Set (Fin n))) ∧
    (∃ I ⊆ S, k ≤ I.card ∧ G.IsIndepSet (I : Set (Fin n)))

theorem IsLocallyRamsey.mono {n m m' k : ℕ} {G : SimpleGraph (Fin n)}
    (h : IsLocallyRamsey G m k) (hm : m ≤ m') : IsLocallyRamsey G m' k := by
  intro S hS
  obtain ⟨T, hTS, hT⟩ := Finset.exists_subset_card_eq (show m ≤ S.card by omega)
  obtain ⟨⟨C, hCT, hCk, hC⟩, ⟨I, hIT, hIk, hI⟩⟩ := h T hT
  exact ⟨⟨C, hCT.trans hTS, hCk, hC⟩, ⟨I, hIT.trans hTS, hIk, hI⟩⟩

def HasRamseyGraphs (g : ℕ → ℕ) : Prop :=
  ∀ᶠ n : ℕ in atTop, ∃ G : SimpleGraph (Fin n), IsLocallyRamsey G (g n) ⌈Real.log n⌉₊

theorem erdos_805.variants.alon_bucic_sudakov :
    ∀ ε : ℝ, 0 < ε → ε < 1 / 2 → ∀ᶠ n : ℕ in atTop, ∃ G : SimpleGraph (Fin n), IsLocallyRamsey G ⌈(2 : ℝ) ^ ((2 : ℝ) ^ (Real.logb 2 (Real.logb 2 n) ^ (1 / 2 + ε)))⌉₊ ⌈Real.logb 2 n⌉₊ := by
  sorry

end Erdos805
