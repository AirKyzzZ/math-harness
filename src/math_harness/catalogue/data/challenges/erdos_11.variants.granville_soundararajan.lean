import Mathlib

open Filter

namespace Erdos11

theorem eventually_of_all_odd (H : type_of% erdos_11.variants.all_odd) :
    ∀ᶠ n : ℕ in atTop, Odd n → ∃ k l : ℕ, Squarefree k ∧ n = k + 2 ^ l :=
  eventually_atTop.2 ⟨2, fun n hn hodd => H n hodd (by omega)⟩

theorem erdos_11.variants.granville_soundararajan (H : type_of% erdos_11.variants.all_odd) :
    {p : ℕ | p.Prime ∧ ¬ 2 ^ p ≡ 2 [MOD p ^ 2]}.Infinite := by
  sorry

end Erdos11
