import Mathlib

open Filter

namespace Erdos639

def uncoveredEdges {n : ℕ} (C : Sym2 (Fin n) → Fin 2) : Set (Sym2 (Fin n)) :=
  {e | ¬e.IsDiag ∧ ∀ x y : Fin n, e = s(x, y) →
    ¬∃ z, z ≠ x ∧ z ≠ y ∧ C s(x, z) = C e ∧ C s(y, z) = C e}

theorem erdos_639.variants.ten_le :
    ∀ n : ℕ, 10 ≤ n → ∀ C : Sym2 (Fin n) → Fin 2, (uncoveredEdges C).ncard ≤ n ^ 2 / 4 := by
  sorry

private def sixColoring (e : Sym2 (Fin 6)) : Fin 2 :=
  if e ∈ ({s(0, 1), s(1, 2), s(2, 3), s(3, 4), s(4, 0),
      s(5, 1), s(5, 4), s(0, 5)} : Finset (Sym2 (Fin 6))) then 0 else 1

private def sixUncovered : Finset (Sym2 (Fin 6)) :=
  {s(0, 2), s(0, 3), s(1, 2), s(1, 3), s(1, 4),
    s(2, 3), s(2, 4), s(2, 5), s(3, 4), s(3, 5)}

theorem erdos_639.variants.six_vertices :
    ∃ C : Sym2 (Fin 6) → Fin 2, (uncoveredEdges C).ncard = 10 ∧
      6 ^ 2 / 4 < (uncoveredEdges C).ncard := by
  have h : (uncoveredEdges sixColoring).ncard = 10 := by
    have hs : uncoveredEdges sixColoring = (sixUncovered : Set (Sym2 (Fin 6))) := by
      unfold uncoveredEdges
      apply Set.ext
      simp only [Set.mem_ofPred_eq]
      decide
    rw [hs, Set.ncard_coe_finset]
    decide
  refine ⟨sixColoring, h, ?_⟩
  rw [h]
  decide

end Erdos639
