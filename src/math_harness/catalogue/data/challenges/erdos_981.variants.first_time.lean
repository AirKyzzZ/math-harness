import Mathlib

open Filter Real

open scoped Topology

namespace Erdos981

def Erdos981Property (ε : ℝ) (p : ℕ) (N : ℕ) : Prop :=
   (∑ n ≤ N, jacobiSym n p) < ε * N

noncomputable def f (ε : ℝ) (p : ℕ) : ℕ :=
  sInf { m | ∀ N ≥ m, Erdos981Property ε p N }

noncomputable def f' (ε : ℝ) (p : ℕ) : ℕ :=
  sInf { m | Erdos981Property ε p m }

theorem erdos_981.variants.first_time (ε : ℝ) (hε : 0 < ε) :
    ∃ c > (0 : ℝ), Tendsto (fun x ↦ (∑ p : Nat.primesBelow ⌈x⌉₊, f' ε p) * log x / x) atTop (𝓝 c) := by
  sorry

end Erdos981
