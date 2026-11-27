import Mathlib

open Filter Asymptotics

namespace Erdos648

noncomputable def g (n : ℕ) : ℕ :=
  sSup {t | ∃ a : Fin t → ℕ, StrictMono a ∧ (∀ i, a i ∈ Set.Ico 2 n) ∧
    StrictAnti fun i => (a i).maxPrimeFac}

theorem erdos_648 :
    (fun n => (g n : ℝ)) =Θ[atTop] fun n => Real.sqrt ((n : ℝ) / Real.log (n : ℝ)) := by
  sorry

end Erdos648
