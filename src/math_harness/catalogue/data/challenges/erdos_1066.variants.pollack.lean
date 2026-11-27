import Mathlib

open Filter SimpleGraph

open scoped EuclideanGeometry Topology

namespace Erdos1066

noncomputable def g (n : ℕ) : ℕ :=
  sSup {m : ℕ | ∀ X : Finset ℝ², X.card = n →
    (X : Set ℝ²).Pairwise (fun x y ↦ 1 ≤ dist x y) →
      m ≤ (UnitDistancePlaneGraph (X : Set ℝ²)).indepNum}

theorem g_le (X : Finset ℝ²) (hX : (X : Set ℝ²).Pairwise (fun x y ↦ 1 ≤ dist x y)) :
    g X.card ≤ (UnitDistancePlaneGraph (X : Set ℝ²)).indepNum := by
  refine csSup_le ⟨0, fun _ _ _ => Nat.zero_le _⟩ ?_
  intro m hm
  exact hm X rfl hX

noncomputable def gDim (d n : ℕ) : ℕ :=
  sSup {m : ℕ | ∀ X : Finset (ℝ^d), X.card = n →
    (X : Set (ℝ^d)).Pairwise (fun x y ↦ 1 ≤ dist x y) →
      ∃ Y ⊆ X, m ≤ Y.card ∧ (Y : Set (ℝ^d)).Pairwise (fun x y ↦ 1 < dist x y)}

theorem erdos_1066.variants.pollack (n : ℕ) :
    (n : ℝ) / 4 ≤ (g n : ℝ) := by
  sorry

end Erdos1066
