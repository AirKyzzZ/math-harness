import Mathlib

namespace Erdos376

theorem erdos_376.variants.prime {p q : ℕ} (h₁ : p.Prime) (h₂ : Odd p) (h₃ : q.Prime) (h₄ : Odd q) :
    { (n : ℕ) | n.centralBinom.Coprime (p * q) }.Infinite := by
  sorry

end Erdos376
