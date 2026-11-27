import Mathlib

open Filter Asymptotics

open scoped EuclideanGeometry

namespace Erdos1086

open scoped Classical in
noncomputable def triangleAreaCount (P : Finset ℝ²) (a : ℝ) : ℕ :=
  ((P.powersetCard 3).filter fun T =>
    ∃ p q r : ℝ², T = {p, q, r} ∧ |EuclideanGeometry.triangle_area p q r| = a).card

noncomputable def g (n : ℕ) : ℕ :=
  sSup {m : ℕ | ∃ (P : Finset ℝ²) (a : ℝ), P.card = n ∧ 0 < a ∧ triangleAreaCount P a = m}

theorem triangleAreaCount_le (P : Finset ℝ²) (a : ℝ) :
    triangleAreaCount P a ≤ P.card.choose 3 := by
  classical
  unfold triangleAreaCount
  exact (Finset.card_filter_le _ _).trans (Finset.card_powersetCard 3 P).le

theorem triangleAreaCount_le_g (P : Finset ℝ²) {a : ℝ} (ha : 0 < a) :
    triangleAreaCount P a ≤ g P.card := by
  refine le_csSup ⟨P.card.choose 3, ?_⟩ ⟨P, a, rfl, ha, rfl⟩
  rintro m ⟨Q, b, hQ, -, rfl⟩
  exact hQ ▸ triangleAreaCount_le Q b

theorem erdos_1086.variants.raz_sharir :
    (fun n : ℕ ↦ (g n : ℝ)) =O[atTop] fun n : ℕ ↦ (n : ℝ) ^ (20 / 9 : ℝ) := by
  sorry

end Erdos1086
