import Mathlib

namespace Erdos371

theorem erdos_371 :
    { n | Nat.maxPrimeFac (n + 1) > Nat.maxPrimeFac n }.HasDensity (1/2) := by
  sorry

-- TODO: add the statements from the additional material

end Erdos371
