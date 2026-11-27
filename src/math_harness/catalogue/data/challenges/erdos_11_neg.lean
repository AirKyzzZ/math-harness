import Mathlib

open Filter

namespace Erdos11

theorem erdos_11_neg :
    ¬ (∀ᶠ n : ℕ in atTop, Odd n → ∃ k l : ℕ, Squarefree k ∧ n = k + 2 ^ l) := by
  sorry

theorem eventually_of_all_odd (H : type_of% erdos_11.variants.all_odd) :
    ∀ᶠ n : ℕ in atTop, Odd n → ∃ k l : ℕ, Squarefree k ∧ n = k + 2 ^ l :=
  eventually_atTop.2 ⟨2, fun n hn hodd => H n hodd (by omega)⟩

end Erdos11
