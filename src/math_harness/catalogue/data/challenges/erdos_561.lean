import Mathlib

namespace Erdos561

open SimpleGraph

local notation "F(" s ", " n ")" =>

  fromRel (fun (u v : Σ i : Fin s, Fin (n i + 1)) ↦

    Sigma.fst u = Sigma.fst v ∧

      (Fin.val (Sigma.snd u) = 0 ∨ Fin.val (Sigma.snd v) = 0))

theorem erdos_561 :
    ∀ (s t : ℕ), 1 ≤ s → 1 ≤ t → ∀ (n : Fin s → ℕ) (m : Fin t → ℕ), Antitone n → Antitone m → (∀ i, 1 ≤ n i) → (∀ j, 1 ≤ m j) → sizeRamsey F(s, n) F(t, m) = ∑ k ∈ Finset.Icc 2 (s + t), ((Finset.univ : Finset (Fin s × Fin t)).filter (fun p ↦ (p.1.val + 1) + (p.2.val + 1) = k)).sup (fun p ↦ n p.1 + m p.2 - 1) := by
  sorry

end Erdos561
