import Mathlib

open Filter Real

namespace Erdos202

noncomputable def f (N : ℕ) : ℕ :=
  sSup {r : ℕ | ∃ n : Fin r → ℕ, ∃ a : Fin r → ℤ,
    StrictMono n ∧ (∀ i, 0 < n i ∧ n i ≤ N) ∧
    ∀ m : ℤ, ∀ i j : Fin r, m ≡ a i [ZMOD (n i : ℤ)] → m ≡ a j [ZMOD (n j : ℤ)] → i = j}

theorem erdos_202.variants.erdos_szemeredi :
    (fun N => (f N : ℝ)) =o[atTop] (fun N : ℕ => (N : ℝ)) := by
  sorry

end Erdos202
