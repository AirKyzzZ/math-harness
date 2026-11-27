import Mathlib

namespace Erdos385

open Filter

noncomputable def F (n : ℕ) : ℕ := sSup {m + m.minFac | (m < n) (_ : m.Composite)}

theorem trivial_ub (n : ℕ) : F n ≤ n + √n := by
  have hkey : F n ≤ n + n.sqrt := by
    apply csSup_le'
    rintro x ⟨m, hm, hcomp, rfl⟩
    have h1 : 0 < m := by have := hcomp.1; omega
    have hsq : m.minFac ^ 2 ≤ m := Nat.minFac_sq_le_self h1 hcomp.2
    have hmf : m.minFac ≤ m.sqrt := Nat.le_sqrt.mpr (by rw [← sq]; exact hsq)
    have hmn : m.sqrt ≤ n.sqrt := Nat.sqrt_le_sqrt hm.le
    omega
  calc (F n : ℝ) ≤ ((n + n.sqrt : ℕ) : ℝ) := by exact_mod_cast hkey
    _ = n + (n.sqrt : ℝ) := by push_cast; ring
    _ ≤ n + √n := by
        gcongr
        rw [show ((n.sqrt : ℕ) : ℝ) = √((n.sqrt ^ 2 : ℕ) : ℝ) from by
          push_cast; rw [Real.sqrt_sq (Nat.cast_nonneg _)]]
        exact Real.sqrt_le_sqrt (by exact_mod_cast Nat.sqrt_le' n)

theorem erdos_385.parts.i_neg :
    ¬ (∀ᶠ n in atTop, n < F n) := by
  sorry

end Erdos385
