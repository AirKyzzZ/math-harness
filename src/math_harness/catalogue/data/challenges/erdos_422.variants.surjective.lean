import Mathlib

namespace Erdos422

open Filter

open scoped Topology

def IsHofstadterQ (f : ℕ+ → ℕ+) : Prop :=
  f 1 = 1 ∧ f 2 = 1 ∧
  ∀ n : ℕ+, 2 < n →
    f (n - 1) < n ∧ f (n - 2) < n ∧ f n = f (n - f (n - 1)) + f (n - f (n - 2))

theorem erdos_422.test.f3 : ∀ f : ℕ+ → ℕ+, IsHofstadterQ f → f 3 = 2 := by
  intro f ⟨h1, h2, h⟩
  obtain ⟨-, -, h3⟩ := h 3 (by decide)
  simp only [h3, show (3 : ℕ+) - 1 = 2 from rfl, show (3 : ℕ+) - 2 = 1 from rfl, h1, h2]
  rfl

theorem erdos_422.test.f4 : ∀ f : ℕ+ → ℕ+, IsHofstadterQ f → f 4 = 3 := by
  intro f hf
  have h3 := erdos_422.test.f3 f hf
  obtain ⟨h1, h2, h⟩ := hf
  obtain ⟨-, -, h4⟩ := h 4 (by decide)
  simp only [h4, show (4 : ℕ+) - 1 = 3 from rfl, show (4 : ℕ+) - 2 = 2 from rfl, h2, h3]
  rfl

theorem erdos_422.variants.surjective :
    ∀ f : ℕ+ → ℕ+, IsHofstadterQ f → f.Surjective := by
  sorry

theorem IsHofstadterQ.not_eventuallyConst {f : ℕ+ → ℕ+} (hf : IsHofstadterQ f) :
    ¬ EventuallyConst f atTop := by
  obtain ⟨-, -, hf⟩ := hf
  intro h
  obtain ⟨c, hc⟩ := eventuallyConst_iff_exists_eventuallyEq.mp h
  obtain ⟨N, hN⟩ := eventually_atTop.mp hc
  have hc0 := c.pos
  -- Subtracting `k ≤ c + 1` from `n = N + c + 2` leaves an index that is still at least `N`.
  have key (k : ℕ+) (hk : (k : ℕ) ≤ c + 1) : f (N + c + 2 - k) = c := hN _ <| by
    have hlt : k < N + c + 2 := by
      rw [← PNat.coe_lt_coe]; push_cast; omega
    rw [← PNat.coe_le_coe, PNat.sub_coe, if_pos hlt]
    push_cast; omega
  have hn : f (N + c + 2) = c := hN _ <| by
    rw [← PNat.coe_le_coe]; push_cast; omega
  obtain ⟨-, -, hrec⟩ := hf (N + c + 2) (PNat.lt_add_left 2 (N + c))
  -- The recurrence at `n` now reads `c = c + c`.
  rw [hn, key 1 (Nat.le_add_left 1 c), key 2 (by push_cast; omega), key c (by omega)] at hrec
  exact (PNat.lt_add_right c c).ne hrec

theorem erdos_422.variants.eventually_const :
    ¬ ∃ f : ℕ+ → ℕ+, IsHofstadterQ f ∧ EventuallyConst f atTop :=
  fun ⟨_, hf, h⟩ ↦ hf.not_eventuallyConst h

end Erdos422
