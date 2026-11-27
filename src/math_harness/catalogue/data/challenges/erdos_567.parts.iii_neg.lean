import Mathlib

namespace Erdos567

open SimpleGraph

open scoped Finset

abbrev Q3 : SimpleGraph (Fin 3 → Bool) := hypercube 3

def K33 : SimpleGraph (Fin 3 ⊕ Fin 3) := completeBipartiteGraph (Fin 3) (Fin 3)

def H5 : SimpleGraph (Fin 5) :=
  .cycleGraph 5 ⊔ .edge 0 2 ⊔ .edge 1 3

theorem erdos_567.parts.iii_neg :
    ¬ (IsRamseySizeLinear H5) := by
  sorry

end Erdos567
