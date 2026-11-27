import Mathlib

open SimpleGraph

namespace Erdos816

open scoped Classical in
def HasEqualDegreePathThree {V : Type*} [Fintype V] (G : SimpleGraph V) : Prop :=
  ∃ u v : V, u ≠ v ∧ G.degree u = G.degree v ∧ ∃ p : G.Walk u v, p.IsPath ∧ p.length = 3

open scoped Classical in
theorem erdos_816 :
    ∀ n : ℕ, 2 ≤ n → ∀ G : SimpleGraph (Fin (2 * n + 1)), G.edgeFinset.card = n ^ 2 + n + 1 → HasEqualDegreePathThree G := by
  sorry

open scoped Classical in
theorem erdos_816.degree_inl (n : ℕ) (a : Fin n) :
    (completeBipartiteGraph (Fin n) (Fin (n + 1))).degree (Sum.inl a) = n + 1 := by
  rw [← card_neighborFinset_eq_degree, neighborFinset_eq_filter]
  have : (Finset.univ.filter ((completeBipartiteGraph (Fin n) (Fin (n + 1))).Adj (Sum.inl a)))
      = Finset.univ.map Function.Embedding.inr := by
    ext x
    cases x <;> simp
  rw [this, Finset.card_map]
  simp

open scoped Classical in
theorem erdos_816.degree_inr (n : ℕ) (b : Fin (n + 1)) :
    (completeBipartiteGraph (Fin n) (Fin (n + 1))).degree (Sum.inr b) = n := by
  rw [← card_neighborFinset_eq_degree, neighborFinset_eq_filter]
  have : (Finset.univ.filter ((completeBipartiteGraph (Fin n) (Fin (n + 1))).Adj (Sum.inr b)))
      = Finset.univ.map Function.Embedding.inl := by
    ext x
    cases x <;> simp
  rw [this, Finset.card_map]
  simp

open scoped Classical in
theorem erdos_816.variants.complete_bipartite : ∀ n : ℕ,
    (completeBipartiteGraph (Fin n) (Fin (n + 1))).edgeFinset.card = n ^ 2 + n ∧
      ¬ HasEqualDegreePathThree (completeBipartiteGraph (Fin n) (Fin (n + 1))) := by
  classical
  intro n
  refine ⟨?_, ?_⟩
  · have h := sum_degrees_eq_twice_card_edges (completeBipartiteGraph (Fin n) (Fin (n + 1)))
    rw [Fintype.sum_sum_type] at h
    simp only [erdos_816.degree_inl, erdos_816.degree_inr, Finset.sum_const, Finset.card_univ,
      Fintype.card_fin, smul_eq_mul] at h
    nlinarith
  · rintro ⟨u, v, -, hdeg, p, -, hlen⟩
    cases p with
    | nil => simp at hlen
    | cons h1 p =>
      cases p with
      | nil => simp at hlen
      | cons h2 p =>
        cases p with
        | nil => simp at hlen
        | cons h3 p =>
          cases p with
          | nil =>
            rename_i a b
            rcases u with x | x <;> rcases a with y | y <;> rcases b with z | z <;>
              rcases v with w | w <;>
              simp [completeBipartiteGraph_adj, erdos_816.degree_inl,
                erdos_816.degree_inr] at h1 h2 h3 hdeg
          | cons _ _ => simp at hlen

end Erdos816
