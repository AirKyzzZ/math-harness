import Mathlib

namespace Erdos313

def erdos313Solutions : Set (ℕ × Finset ℕ) :=
  {(m, P) | 2 ≤ m ∧ P.Nonempty ∧ (∀ p ∈ P, p.Prime) ∧ ∑ p ∈ P, (1 : ℚ) / p = 1 - 1 / m}

theorem erdos_313 :
    erdos313Solutions.Infinite := by
  sorry

theorem erdos_313.variants.solution_6_2_3 : (6, {2, 3}) ∈ erdos313Solutions := by
  norm_num [erdos313Solutions]

theorem erdos_313.variants.solution_42_2_3_7 : (42, {2, 3, 7}) ∈ erdos313Solutions := by
  norm_num [erdos313Solutions]

def IsPrimaryPseudoperfect (n : ℕ) : Prop := ∃ P, (n, P) ∈ erdos313Solutions

theorem erdos_313.variants.exists_at_least_eight_primary_pseudoperfect :
    8 ≤ (Set.encard {n | IsPrimaryPseudoperfect n}) := by
  let S : Finset ℕ :=
    {2, 6, 42, 1806, 47058, 2214502422, 52495396602,
      8490421583559688410706771261086}
  have hS : (↑S : Set ℕ) ⊆ {n | IsPrimaryPseudoperfect n} := by
    intro x hx
    simp only [S, Finset.coe_insert, Finset.coe_singleton, Set.mem_insert_iff,
      Set.mem_singleton_iff] at hx
    rcases hx with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
    · exact ⟨{2}, by norm_num [erdos313Solutions]⟩
    · exact ⟨{2, 3}, by norm_num [erdos313Solutions]⟩
    · exact ⟨{2, 3, 7}, by norm_num [erdos313Solutions]⟩
    · exact ⟨{2, 3, 7, 43}, by norm_num [erdos313Solutions]⟩
    · exact ⟨{2, 3, 11, 23, 31}, by norm_num [erdos313Solutions]⟩
    · exact ⟨{2, 3, 11, 23, 31, 47059}, by norm_num [erdos313Solutions]⟩
    · exact ⟨{2, 3, 11, 17, 101, 149, 3109}, by norm_num [erdos313Solutions]⟩
    · exact ⟨{2, 3, 11, 23, 31, 47059, 2217342227, 1729101023519}, by
        refine ⟨by decide, by decide, ?_, ?_⟩
        · intro p hp
          fin_cases hp <;> native_decide
        · native_decide⟩
  calc (8 : ℕ∞)
      = ((S.card : ℕ) : ℕ∞) := by decide
    _ = (↑S : Set ℕ).encard := (Set.encard_coe_eq_coe_finsetCard S).symm
    _ ≤ Set.encard {n | IsPrimaryPseudoperfect n} := Set.encard_le_encard hS

end Erdos313
