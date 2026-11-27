import Mathlib

open Filter

open Submonoid

open scoped Pointwise

namespace Erdos123

def IsDComplete (A : Set ℕ) : Prop :=
  ∀ᶠ n in atTop, ∃ s : Finset ℕ,
    -- The summands come from A
    (s : Set ℕ) ⊆ A ∧
    -- No summand divides another
    IsAntichain (· ∣ ·) (s : Set ℕ) ∧
    -- They sum to n
    s.sum id = n

def IsSnug (ε : ℝ) (A : Finset ℕ) : Prop :=
  ∃ hA : A.Nonempty, ∀ a ∈ A, a < (1 + ε) * A.min' hA

def PairwiseCoprime (a b c : ℕ) : Prop := Pairwise (Nat.Coprime.onFun ![a, b, c])

theorem erdos_123_neg :
    ¬ (∀ a > 1, ∀ b > 1, ∀ c > 1, PairwiseCoprime a b c → IsDComplete (↑(powers a) * ↑(powers b) * ↑(powers c))) := by
  sorry

theorem erdos_123.variants.powers_2_3 : IsDComplete (↑(powers 2) * ↑(powers 3)) := by
  refine Filter.Eventually.of_forall fun n => ?_
  obtain ⟨s, hs, hanti, hsum⟩ := Nat.exists_antichain_powers_two_three n
  refine ⟨s, fun x hx => ?_, hanti, hsum⟩
  obtain ⟨a, b, rfl⟩ := hs x hx
  exact Set.mem_mul.2 ⟨2 ^ a, Submonoid.pow_mem _ (Submonoid.mem_powers 2) a,
    3 ^ b, Submonoid.pow_mem _ (Submonoid.mem_powers 3) b, rfl⟩

end Erdos123
