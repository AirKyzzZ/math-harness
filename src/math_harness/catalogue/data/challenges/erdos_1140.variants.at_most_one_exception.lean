import Mathlib

namespace Erdos1140

def Erdos1140Prop (n : ℕ) : Prop :=
  0 < n ∧ ∀ x : ℕ, 2 * x ^ 2 < n → (n - 2 * x ^ 2).Prime

instance (n : ℕ) : Decidable (Erdos1140Prop n) :=
  decidable_of_iff (0 < n ∧ ∀ x < n, 2 * x ^ 2 < n → (n - 2 * x ^ 2).Prime) <| by
    unfold Erdos1140Prop
    refine and_congr_right fun _ => ⟨fun h x hx => h x ?_ hx, fun h x _ hx => h x hx⟩
    have := Nat.le_self_pow two_ne_zero x
    omega

theorem known_examples :
    ∀ n ∈ ([2, 5, 7, 13, 31, 61, 181, 199] : List ℕ), Erdos1140Prop n := by
  decide +kernel

theorem not_four : ¬ Erdos1140Prop 4 := by
  decide +kernel

theorem erdos_1140.variants.at_most_one_exception :
    ({n : ℕ | Erdos1140Prop n} \ {2, 5, 7, 13, 31, 61, 181, 199}).Subsingleton := by
  sorry

end Erdos1140
