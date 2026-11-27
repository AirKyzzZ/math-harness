import Mathlib

open Filter Asymptotics

open scoped EuclideanGeometry

namespace Erdos1087

def HasRepeatedDistance (S : Finset ℝ²) : Prop :=
  distinctDistances S < S.card.choose 2

open scoped Classical in
noncomputable def degenerateCount (P : Finset ℝ²) : ℕ :=
  ((P.powersetCard 4).filter HasRepeatedDistance).card

noncomputable def f (n : ℕ) : ℕ :=
  sSup {m : ℕ | ∃ P : Finset ℝ², P.card = n ∧ degenerateCount P = m}

theorem degenerateCount_le (P : Finset ℝ²) : degenerateCount P ≤ P.card.choose 4 := by
  classical
  unfold degenerateCount
  exact (Finset.card_filter_le _ _).trans (Finset.card_powersetCard 4 P).le

theorem degenerateCount_le_f (P : Finset ℝ²) : degenerateCount P ≤ f P.card := by
  refine le_csSup ⟨P.card.choose 4, ?_⟩ ⟨P, rfl, rfl⟩
  rintro m ⟨Q, hQ, rfl⟩
  exact hQ ▸ degenerateCount_le Q

theorem erdos_1087 :
    ∀ ε > (0 : ℝ), (fun n : ℕ ↦ (f n : ℝ)) =O[atTop] fun n : ℕ ↦ (n : ℝ) ^ (3 + ε) := by
  sorry

end Erdos1087
