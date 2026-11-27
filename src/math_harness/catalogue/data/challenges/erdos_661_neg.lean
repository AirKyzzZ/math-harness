import Mathlib

open Filter Finset EuclideanGeometry

namespace Erdos661

variable {X : Type*} [MetricSpace X]

noncomputable def crossDistanceSet (A B : Finset X) : Finset ℝ :=
  (A ×ˢ B).image fun p : X × X => dist p.1 p.2

variable (X) in

noncomputable def minimalCrossDistances (n : ℕ) : ℕ :=
  sInf {m : ℕ | ∃ A B : Finset X, #A = n ∧ #B = n ∧ Disjoint A B ∧
    #(crossDistanceSet A B) = m}

theorem erdos_661_neg :
    ¬ ((fun n => (minimalCrossDistances ℝ² n : ℝ)) =o[atTop] (fun (n : ℕ) => (n : ℝ) / (n : ℝ).log.sqrt)) := by
  sorry

theorem erdos_661.variants.le_minimalDistinctDistances (n : ℕ) :
    minimalCrossDistances ℝ² n ≤ minimalDistinctDistances ℝ² (2 * n) := by
  obtain ⟨P, hP⟩ := Infinite.exists_subset_card_eq ℝ² (2 * n)
  obtain ⟨Q, hQ, hQm⟩ := Nat.sInf_mem (s := {m | ∃ points : Finset ℝ², #points = 2 * n ∧
    distinctDistances points = m}) ⟨_, P, hP, rfl⟩
  obtain ⟨A, hAQ, hA⟩ := Finset.exists_subset_card_eq (show n ≤ #Q by omega)
  have hB : #(Q \ A) = n := by
    rw [Finset.card_sdiff_of_subset hAQ]
    omega
  have h1 : minimalCrossDistances ℝ² n ≤ #(crossDistanceSet A (Q \ A)) :=
    Nat.sInf_le ⟨A, Q \ A, hA, hB, Finset.disjoint_sdiff, rfl⟩
  refine h1.trans (le_of_le_of_eq (Finset.card_le_card fun d hd => ?_) hQm)
  obtain ⟨⟨x, y⟩, hxy, rfl⟩ := Finset.mem_image.1 hd
  obtain ⟨hx, hy⟩ := Finset.mem_product.1 hxy
  obtain ⟨hyQ, hyA⟩ := Finset.mem_sdiff.1 hy
  exact Finset.mem_image.2 ⟨(x, y), Finset.mem_offDiag.2 ⟨hAQ hx, hyQ, fun h => hyA (h ▸ hx)⟩,
    rfl⟩

end Erdos661
