import Mathlib

open Asymptotics Filter Topology

open scoped EuclideanGeometry

namespace Erdos507

noncomputable def minTriangleArea (S : Finset ℝ²) : ℝ :=
  sInf {abs (EuclideanGeometry.triangle_area (p 0) (p 1) (p 2)) |
    (p : Fin 3 → ℝ²) (_ : Function.Injective p) (_ : ∀ i, p i ∈ S)}

noncomputable def α (n : ℕ) : ℝ :=
  sSup (minTriangleArea '' { S : Finset ℝ² |
    S.card = n ∧ ↑S ⊆ Metric.closedBall (0 : ℝ²) 1 ∧ ¬ Collinear ℝ (S : Set ℝ²) })

noncomputable def lowerBest (n : ℕ) : ℝ := Real.log n / (n : ℝ) ^ 2

noncomputable def upperBarrier (n : ℕ) : ℝ := 1 / (n : ℝ) ^ ((7 : ℝ) / 6)

theorem erdos_507.variants.upper_trivial :
    α ≪ (fun n ↦ 1 / (n : ℝ)) := by
  sorry

end Erdos507
