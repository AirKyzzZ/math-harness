import Mathlib

open Filter SimpleGraph

namespace Erdos743

def IsPacking (n : ℕ) (S : Set ℕ) (T : (k : ℕ) → SimpleGraph (Fin k)) : Prop :=
  ∃ f : (k : S) → Fin k → Fin n, (∀ k : S, Function.Injective (f k)) ∧
    ∀ k l : S, (k : ℕ) < (l : ℕ) →
      Disjoint ((T k).map (f k)).edgeSet ((T l).map (f l)).edgeSet

theorem IsPacking.mono {n : ℕ} {S S' : Set ℕ} {T : (k : ℕ) → SimpleGraph (Fin k)}
    (h : IsPacking n S T) (hS : S' ⊆ S) : IsPacking n S' T := by
  obtain ⟨f, hinj, hdisj⟩ := h
  exact ⟨fun k => f ⟨k, hS k.2⟩, fun k => hinj ⟨k, hS k.2⟩,
    fun k l hkl => hdisj ⟨k, hS k.2⟩ ⟨l, hS l.2⟩ hkl⟩

theorem sum_Icc_two_sub_one (n : ℕ) : ∑ k ∈ Finset.Icc 2 n, (k - 1) = n.choose 2 := by
  induction n with
  | zero => simp
  | succ n ih =>
    rcases Nat.lt_or_ge n 1 with h | h
    · interval_cases n
      simp
    · rw [Finset.sum_Icc_succ_top (by omega), ih,
        show (n + 1).choose 2 = n.choose 1 + n.choose 2 from Nat.choose_succ_succ n 1,
        Nat.choose_one_right]
      omega

theorem erdos_743.variants.bollobas (n : ℕ) (T : (k : ℕ) → SimpleGraph (Fin k)) (hT : ∀ k ∈ Set.Icc 2 ⌊(n : ℝ) / Real.sqrt 2⌋₊, (T k).IsTree) :
    IsPacking n (Set.Icc 2 ⌊(n : ℝ) / Real.sqrt 2⌋₊) T := by
  sorry

end Erdos743
