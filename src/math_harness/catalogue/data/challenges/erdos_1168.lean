import Mathlib

open Cardinal Ordinal SimpleGraph

namespace Erdos1168

theorem erdos_1168 :
    ¬ CardinalCountableColorRamsey (ℵ_ (ω + 1)) := by
  sorry

namespace erdos_1168.variants

example : ℵ₀ < ℵ_ (ω + 1) := by
  rw [← aleph_zero]
  apply aleph_lt_aleph.mpr
  exact omega0_pos.trans_le le_self_add

example : ℵ_ ω < ℵ_ (ω + 1) := by
  exact aleph_lt_aleph.mpr (lt_add_one ω)

theorem GCH_implies_power_aleph_omega (hGCH : GCH) :
    (2 : Cardinal.{0}) ^ ℵ_ ω = ℵ_ (ω + 1) := by
  have h := hGCH ω
  rwa [show Order.succ (ω : Ordinal.{0}) = ω + 1 from (Order.succ_eq_add_one ω)] at h

theorem aleph_omega_succ_is_successor : ℵ_ (ω + 1) = Order.succ (ℵ_ ω) := by
  exact (succ_aleph ω).symm

end erdos_1168.variants

end Erdos1168
