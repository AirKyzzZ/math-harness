import Mathlib

namespace Erdos1052

def properUnitaryDivisors (n : ℕ) : Finset ℕ :=
  {d ∈ Finset.Ico 1 n | d ∣ n ∧ d.Coprime (n / d)}

def IsUnitaryPerfect (n : ℕ) : Prop :=
  ∑ i ∈ properUnitaryDivisors n, i = n ∧ 0 < n

theorem erdos_1052 :
    {n | IsUnitaryPerfect n}.Finite := by
  sorry

theorem isUnitaryPerfect_6 : IsUnitaryPerfect 6 := by
  norm_num [IsUnitaryPerfect, properUnitaryDivisors]
  decide +kernel

theorem isUnitaryPerfect_60 : IsUnitaryPerfect 60 := by
  norm_num [IsUnitaryPerfect, properUnitaryDivisors]
  decide +kernel

theorem isUnitaryPerfect_90 : IsUnitaryPerfect 90 := by
  norm_num [IsUnitaryPerfect, properUnitaryDivisors]
  decide +kernel

theorem isUnitaryPerfect_87360 : IsUnitaryPerfect 87360 := by
  -- TODO: Find a quicker proof. This one is too slow.
  stop
  norm_num [IsUnitaryPerfect, properUnitaryDivisors]
  decide +kernel

end Erdos1052
