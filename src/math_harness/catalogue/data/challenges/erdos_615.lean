import Mathlib

open Filter SimpleGraph

namespace Erdos615

open scoped Classical in
theorem erdos_615 :
    ¬ ∃ c : ℝ, 0 < c ∧ ∀ᶠ (n : ℕ) in atTop, ∀ G : SimpleGraph (Fin n), (1 / 8 - c) * n ^ 2 ≤ G.edgeFinset.card → ¬ G.CliqueFree 4 ∨ (n : ℝ) / Real.log n ≤ G.indepNum := by
  sorry

theorem erdos_615.variants.test_bot (n : ℕ) (hn : 3 ≤ n) :
    (n : ℝ) / Real.log n ≤ (⊥ : SimpleGraph (Fin n)).indepNum := by
  have hn' : (3 : ℝ) ≤ n := by exact_mod_cast hn
  have h1 : (1 : ℝ) ≤ Real.log n := by
    rw [Real.le_log_iff_exp_le (by linarith)]
    calc Real.exp 1 ≤ 3 := by
          have := Real.exp_one_lt_d9
          linarith
      _ ≤ n := hn'
  have h2 : (n : ℝ) / Real.log n ≤ n := div_le_self (by positivity) h1
  have h3 : (Finset.univ : Finset (Fin n)).card ≤ (⊥ : SimpleGraph (Fin n)).indepNum :=
    SimpleGraph.IsIndepSet.card_le_indepNum (by simp [SimpleGraph.isIndepSet_iff, Set.Pairwise])
  have h4 : (n : ℝ) ≤ (⊥ : SimpleGraph (Fin n)).indepNum := by exact_mod_cast by simpa using h3
  exact h2.trans h4

end Erdos615
