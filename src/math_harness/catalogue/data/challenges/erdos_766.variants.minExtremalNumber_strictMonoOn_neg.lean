import Mathlib

open Filter

open scoped SimpleGraph

namespace Erdos766

noncomputable def forcingNumber (n k l : ℕ) : ℕ :=
  sInf {m : ℕ | ∀ G : SimpleGraph (Fin n), G.edgeSet.ncard = m →
    ∃ H : SimpleGraph (Fin k), H.edgeSet.ncard = l ∧ H ⊑ G}

theorem forcingNumber_le {n k l m : ℕ} (h : ∀ G : SimpleGraph (Fin n), G.edgeSet.ncard = m →
    ∃ H : SimpleGraph (Fin k), H.edgeSet.ncard = l ∧ H ⊑ G) : forcingNumber n k l ≤ m :=
  Nat.sInf_le h

theorem forcingNumber_zero {n k : ℕ} (hkn : k ≤ n) : forcingNumber n k 0 = 0 :=
  Nat.eq_zero_of_le_zero <| forcingNumber_le fun _ _ ↦
    ⟨⊥, by simp, SimpleGraph.bot_isContained_iff_card_le.2 (by simpa using hkn)⟩

theorem forcingNumber_le_extremalNumber_add_one (n : ℕ) {k l : ℕ} (G : SimpleGraph (Fin k))
    (h : G.edgeSet.ncard = l) : forcingNumber n k l ≤ SimpleGraph.extremalNumber n G + 1 := by
  classical
  refine forcingNumber_le fun G' hG' ↦ ⟨G, h, ?_⟩
  refine SimpleGraph.IsContained.of_extremalNumber_lt_card_edgeFinset ?_
  rw [Fintype.card_fin, ← Set.ncard_coe_finset, SimpleGraph.coe_edgeFinset, hG']
  exact Nat.lt_succ_self _

noncomputable def minExtremalNumber (n k l : ℕ) : ℕ∞ :=
  ⨅ (G : SimpleGraph (Fin k)) (_ : G.edgeSet.ncard = l), (SimpleGraph.extremalNumber n G : ℕ∞)

theorem minExtremalNumber_le (n : ℕ) {k l : ℕ} (G : SimpleGraph (Fin k))
    (h : G.edgeSet.ncard = l) : minExtremalNumber n k l ≤ SimpleGraph.extremalNumber n G :=
  iInf₂_le G h

theorem minExtremalNumber_zero_one (n : ℕ) : minExtremalNumber n 0 1 = ⊤ := by
  simp [minExtremalNumber, Set.eq_empty_of_isEmpty]

theorem erdos_766.variants.minExtremalNumber_strictMonoOn_neg :
    ¬ (∀ k : ℕ, ∀ᶠ n : ℕ in atTop, StrictMonoOn (minExtremalNumber n k) (Set.Ioc k (k ^ 2 / 4))) := by
  sorry

end Erdos766
