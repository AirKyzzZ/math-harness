import Mathlib

namespace Erdos598

open Cardinal

noncomputable def κ : Cardinal := Order.succ (2 ^ ℵ₀)

theorem erdos_598_neg :
    ¬ (∀ (m : Type*) [Infinite m], ∃ c : { s : Set m // s.Countable } → κ.out, ∀ X : Set m, #X = κ → c '' { s : { sub : Set m // sub.Countable } | s.1 ⊆ X } = Set.univ) := by
  sorry

end Erdos598
