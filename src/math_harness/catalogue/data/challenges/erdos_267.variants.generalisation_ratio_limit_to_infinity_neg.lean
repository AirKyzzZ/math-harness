import Mathlib

namespace Erdos267

theorem erdos_267.variants.generalisation_ratio_limit_to_infinity_neg :
    ¬ (∀ (n : ℕ → ℕ), StrictMono n → Filter.Tendsto (fun k => (n (k+1) / k.succ : ℝ)) Filter.atTop Filter.atTop → Irrational (∑' k, 1 / (Nat.fib <| n k))) := by
  sorry

end Erdos267
