import Mathlib

open Filter

open scoped EuclideanGeometry

namespace Erdos668

open Erdos90

theorem erdos_668.parts.i :
    ∀ m : ℕ, ∀ᶠ n in atTop, ∃ A : Fin m → Finset ℝ², (∀ i, (A i).card = n ∧ unitDistNum (A i) = maxUnitDistances n) ∧ ∀ i j, i ≠ j → ¬ ∃ f : ℝ² ≃ᵢ ℝ², f '' A i = A j := by
  sorry

theorem erdos_668.variants.four_points_implies_parts_ii :
    type_of% erdos_668.variants.four_points → type_of% erdos_668.parts.ii := by
  rintro ⟨a, b, c, d, -, -, -, -, -, -, h⟩
  intro H
  obtain ⟨A, B, hA, hB, hAm, hBm, hAB⟩ := H 4 (by norm_num)
  obtain ⟨f, hf⟩ := (h A hA).1 hAm
  obtain ⟨g, hg⟩ := (h B hB).1 hBm
  exact hAB ⟨f.symm.trans g, by rw [← hf, ← hg, Set.image_image]; simp⟩

end Erdos668
