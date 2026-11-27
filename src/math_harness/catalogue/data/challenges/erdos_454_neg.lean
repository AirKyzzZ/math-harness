import Mathlib

open Filter

namespace Erdos454

noncomputable def f (n : ℕ) : ℕ :=
  if n ≤ 1 then 0 else ⨅ i : {i : Fin n // 0 < (i : ℕ)}, (n + i).nth Prime + (n - i).nth Prime

theorem erdos_454_neg :
    ¬ (limsup (fun n => (f n - 2 * n.nth Prime : ℕ∞)) atTop = ⊤) := by
  sorry

end Erdos454
