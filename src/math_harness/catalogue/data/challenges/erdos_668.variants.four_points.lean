import Mathlib

open Filter

open scoped EuclideanGeometry

namespace Erdos668

open Erdos90

theorem erdos_668.variants.four_points :
    ∃ a b c d : ℝ², dist a b = 1 ∧ dist a c = 1 ∧ dist b c = 1 ∧ dist b d = 1 ∧ dist c d = 1 ∧ ({a, b, c, d} : Finset ℝ²).card = 4 ∧ ∀ B : Finset ℝ², B.card = 4 → (unitDistNum B = maxUnitDistances 4 ↔ ∃ f : ℝ² ≃ᵢ ℝ², f '' {a, b, c, d} = B) := by
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
