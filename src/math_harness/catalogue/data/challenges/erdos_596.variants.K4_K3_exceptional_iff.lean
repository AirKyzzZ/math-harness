import Mathlib

open SimpleGraph

namespace Erdos596

theorem erdos_596.variants.C4_C6_is_exceptional :
    IsErdosHajnalExceptional (cycleGraph 4) (cycleGraph 6) :=
  ⟨erdos_596.variants.C4_C6_finite_ramsey, erdos_596.variants.C4_free_countable_escape⟩

theorem erdos_596.variants.K4_K3_exceptional_iff :
    IsErdosHajnalExceptional (completeGraph (Fin 4)) (completeGraph (Fin 3)) := by
  sorry

theorem erdos_596.test.empty_is_free :
    (cycleGraph 4).Free (⊥ : SimpleGraph (Fin 0)) :=
  fun ⟨f⟩ => Fin.elim0 (f.toEmbedding 0)

end Erdos596
