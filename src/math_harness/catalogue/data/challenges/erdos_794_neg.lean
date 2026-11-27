import Mathlib

open Filter

namespace Erdos794

def harrisHypergraph : Finset (Finset (Fin 9)) :=
  insert {0, 1, 2}
    (Finset.filter
      (fun e : Finset (Fin 9) =>
        (Finset.image (fun v : Fin 9 => (v : ℕ) / 3) e).card = 3)
      (Finset.powersetCard 3 Finset.univ))

theorem erdos_794_neg :
    ¬ (¬ ∀ n : ℕ, ∀ H : Finset (Finset (Fin (3 * n))), H.IsUniform 3 → n ^ 3 + 1 ≤ H.card → H.ContainsSubgraph 4 3 ∨ H.ContainsSubgraph 5 7) := by
  sorry

theorem erdos_794.variants.balogh {V : Type*} [DecidableEq V] (H : Finset (Finset V))
    (hH : H.IsUniform 3) (h : H.ContainsSubgraph 5 7) : H.ContainsSubgraph 4 3 := by
  obtain ⟨S, hS, hk⟩ := h
  by_contra hcon
  simp only [Finset.ContainsSubgraph, not_exists, not_and, not_le] at hcon
  -- Each of the five `4`-subsets of `S` spans at most `2` edges.
  have hub : ∑ T ∈ S.powersetCard 4, (H.filter (· ⊆ T)).card ≤ 10 := by
    calc ∑ T ∈ S.powersetCard 4, (H.filter (· ⊆ T)).card ≤ ∑ T ∈ S.powersetCard 4, 2 :=
          Finset.sum_le_sum fun T hT => by
            have := hcon T (Finset.mem_powersetCard.1 hT).2
            omega
      _ = 10 := by simp [Finset.card_powersetCard, hS]
  -- Each edge inside `S` lies in two of the `4`-subsets of `S`, so the double count is at
  -- least `2 * 7`.
  have hlb : 2 * (H.filter (· ⊆ S)).card ≤ ∑ T ∈ S.powersetCard 4, (H.filter (· ⊆ T)).card := by
    calc 2 * (H.filter (· ⊆ S)).card = ∑ e ∈ H.filter (· ⊆ S), 2 := by simp [mul_comm]
      _ ≤ ∑ e ∈ H.filter (· ⊆ S), ((S.powersetCard 4).filter (e ⊆ ·)).card := by
          refine Finset.sum_le_sum fun e he => ?_
          obtain ⟨heH, heS⟩ := Finset.mem_filter.1 he
          have he3 := hH e heH
          rw [show 4 = e.card + 1 by omega, Finset.card_filter_subset_powersetCard_card_add_one heS]
          omega
      _ = ∑ T ∈ S.powersetCard 4, (H.filter (· ⊆ T)).card := by
          simp only [Finset.card_filter]
          rw [Finset.sum_comm]
          refine Finset.sum_congr rfl fun T hT => ?_
          rw [Finset.sum_filter]
          refine Finset.sum_congr rfl fun e _ => ?_
          by_cases heT : e ⊆ T
          · simp [heT, heT.trans (Finset.mem_powersetCard.1 hT).1]
          · simp [heT]
  omega

theorem erdos_794.variants.harris :
    harrisHypergraph.IsUniform 3 ∧ harrisHypergraph.card = 28 ∧
      ¬ harrisHypergraph.ContainsSubgraph 4 3 ∧ ¬ harrisHypergraph.ContainsSubgraph 5 7 := by
  unfold Finset.IsUniform Finset.ContainsSubgraph
  decide +kernel

end Erdos794
