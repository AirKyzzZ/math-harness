import Mathlib

open Filter

open scoped Topology

namespace Erdos136

def Is45Coloring {n k : ℕ} (C : SimpleGraph.TopEdgeLabeling (Fin n) (Fin k)) : Prop :=
  open scoped Classical in
  ∀ v : Fin 4 ↪ Fin n, 5 ≤ (Finset.univ.image (C.pullback v)).card

def Colorable (n k : ℕ) : Prop :=
  ∃ C : SimpleGraph.TopEdgeLabeling (Fin n) (Fin k), Is45Coloring C

noncomputable def f (n : ℕ) : ℕ :=
  sInf {k | Colorable n k}

theorem erdos_136 :
    Tendsto (fun n : ℕ ↦ (f n : ℝ) / (n : ℝ)) atTop (𝓝 (5 / 6 : ℝ)) := by
  sorry

end Erdos136
