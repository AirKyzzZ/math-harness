import Mathlib

namespace Erdos379

open Filter

noncomputable def S (n : ℕ) : ℕ :=
  sSup {s | ∀ k ∈ Finset.Ico 1 n, ∃ p, p.Prime ∧ p^s ∣n.choose k}

theorem erdos_379 :
    atTop.limsup (fun n => (S n : ℕ∞)) = ⊤ := by
  sorry

end Erdos379
