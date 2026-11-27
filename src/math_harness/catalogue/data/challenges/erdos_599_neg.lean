import Mathlib

open SimpleGraph

namespace Erdos599

theorem erdos_599_neg :
    ¬ (∀ (V : Type) (G : SimpleGraph V) (A B : Set V), Disjoint A B → G.IsIndepSet A → G.IsIndepSet B → ∃ (ι : Type) (a b : ι → V) (p : ∀ i, G.Walk (a i) (b i)) (S : Set V), (∀ i, a i ∈ A) ∧ (∀ i, b i ∈ B) ∧ (∀ i, (p i).IsPath) ∧ (Pairwise fun i j => Disjoint {v | v ∈ (p i).support} {v | v ∈ (p j).support}) ∧ S ⊆ {v | ∃ i, v ∈ (p i).support} ∧ (∀ i, ∃! v, v ∈ S ∧ v ∈ (p i).support) ∧ (∀ a' ∈ A, ∀ b' ∈ B, ∀ q : G.Walk a' b', q.IsPath → ∃ v ∈ q.support, v ∈ S)) := by
  sorry

theorem erdos_599.test.empty_A (V : Type) (G : SimpleGraph V) (B : Set V) :
    ∃ (ι : Type) (a b : ι → V) (p : ∀ i, G.Walk (a i) (b i)) (S : Set V),
      (∀ i, a i ∈ (∅ : Set V)) ∧ (∀ i, b i ∈ B) ∧ (∀ i, (p i).IsPath) ∧
      (Pairwise fun i j => Disjoint {v | v ∈ (p i).support} {v | v ∈ (p j).support}) ∧
      S ⊆ {v | ∃ i, v ∈ (p i).support} ∧
      (∀ i, ∃! v, v ∈ S ∧ v ∈ (p i).support) ∧
      (∀ a' ∈ (∅ : Set V), ∀ b' ∈ B, ∀ q : G.Walk a' b', q.IsPath →
        ∃ v ∈ q.support, v ∈ S) := by
  refine ⟨Empty, Empty.elim, Empty.elim, fun i => i.elim, ∅,
    fun i => i.elim, fun i => i.elim, fun i => i.elim, fun i => i.elim,
    fun v hv => hv.elim, fun i => i.elim, fun a' ha' => absurd ha' (Set.notMem_empty _)⟩

end Erdos599
