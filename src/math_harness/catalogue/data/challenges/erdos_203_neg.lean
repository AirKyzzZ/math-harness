import Mathlib

namespace Erdos203

theorem erdos_203_neg :
    ¬ (∃ m, m.Coprime 6 ∧ ∀ k l, ¬ (2^k * 3^l * m + 1).Prime) := by
  sorry

-- TODO(rdivyanshu): add statements about covering system and odd integers `m` such that none of 2^k*m + 1 is prime

end Erdos203
