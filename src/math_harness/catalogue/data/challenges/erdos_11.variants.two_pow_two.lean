import Mathlib

open Filter

namespace Erdos11

theorem eventually_of_all_odd (H : type_of% erdos_11.variants.all_odd) :
    ∀ᶠ n : ℕ in atTop, Odd n → ∃ k l : ℕ, Squarefree k ∧ n = k + 2 ^ l :=
  eventually_atTop.2 ⟨2, fun n hn hodd => H n hodd (by omega)⟩

theorem erdos_11.variants.two_pow_two (n : ℕ) (hn : Odd n) (hn' : 1 < n) :
    ∃ k l m : ℕ , Squarefree k ∧ n = k + 2^l + 2^m := by
  sorry

end Erdos11
