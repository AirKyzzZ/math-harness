import Mathlib

open Filter Asymptotics

open scoped Finset Pointwise

namespace Erdos840

def IsQuasiSidonConstant (c : ℝ) : Prop :=
  ∃ A : ℕ → Finset ℕ, (∀ N, A N ⊆ Finset.Icc 1 N) ∧
    (fun N ↦ (#(A N) : ℝ)) ~[atTop] (fun N ↦ c * Real.sqrt N) ∧
    (fun N ↦ (#(A N + A N) : ℝ)) ~[atTop] (fun N ↦ ((#(A N)).choose 2 : ℝ))

theorem isQuasiSidonConstant_zero : IsQuasiSidonConstant 0 := by
  refine ⟨fun _ ↦ ∅, fun _ ↦ Finset.empty_subset _, ?_, ?_⟩
  · simpa using (IsEquivalent.refl : (fun _ : ℕ ↦ (0 : ℝ)) ~[atTop] fun _ ↦ 0)
  · simpa using (IsEquivalent.refl : (fun _ : ℕ ↦ (0 : ℝ)) ~[atTop] fun _ ↦ 0)

theorem erdos_840.variants.erdos_freud_upper (c : ℝ) (hc : IsQuasiSidonConstant c) : c ≤ 2 := by
  by_contra! hlt
  have hc0 : 0 < c := by linarith
  obtain ⟨A, hAsub, hk, hs⟩ := hc
  -- $cN^{1/2} \to \infty$, so the constant $1$ is negligible: $|A_N| - 1 \sim cN^{1/2}$.
  have hsqrt : Tendsto (fun N : ℕ ↦ c * Real.sqrt N) atTop atTop :=
    Tendsto.const_mul_atTop hc0 (Real.tendsto_sqrt_atTop.comp tendsto_natCast_atTop_atTop)
  have hk1 := hk.sub_isLittleO (w := fun _ ↦ (1 : ℝ))
    (isLittleO_const_left.2 (Or.inr (tendsto_norm_atTop_atTop.comp hsqrt)))
  -- $\binom{|A_N|}{2} = |A_N|(|A_N|-1)/2 \sim (cN^{1/2})^2/2$.
  have hC := ((hk.mul hk1).div (IsEquivalent.refl (u := fun _ : ℕ ↦ (2 : ℝ)))).congr_left
    (w := fun N ↦ ((#(A N)).choose 2 : ℝ))
    (Eventually.of_forall fun N ↦ by simp only [Pi.mul_apply, Pi.sub_apply, Pi.div_apply,
      Nat.cast_choose_two])
  -- Hence $|A_N + A_N|/N \to c^2/2$.
  have hlim : Tendsto (fun N : ℕ ↦ (#(A N + A N) : ℝ) / N) atTop (nhds (c ^ 2 / 2)) := by
    refine (((hs.trans hC).div (IsEquivalent.refl (u := fun N : ℕ ↦ (N : ℝ)))).congr_right
      (w := fun _ ↦ c ^ 2 / 2) ?_).tendsto_const
    filter_upwards [eventually_gt_atTop 0] with N hN
    have hN' : (N : ℝ) ≠ 0 := by exact_mod_cast hN.ne'
    have hsq : Real.sqrt N * Real.sqrt N = N := Real.mul_self_sqrt (Nat.cast_nonneg N)
    simp only [Pi.mul_apply, Pi.div_apply]
    rw [show c * Real.sqrt N * (c * Real.sqrt N) = c ^ 2 * (Real.sqrt N * Real.sqrt N) by ring,
      hsq]
    field_simp
  -- But $A_N + A_N \subseteq [2, 2N]$, so $|A_N + A_N|/N \leq 2$.
  have hbound : ∀ᶠ N : ℕ in atTop, (#(A N + A N) : ℝ) / N ≤ 2 := by
    filter_upwards [eventually_gt_atTop 0] with N hN
    have hsub : A N + A N ⊆ Finset.Icc 2 (2 * N) := by
      intro x hx
      obtain ⟨a, ha, b, hb, rfl⟩ := Finset.mem_add.1 hx
      have ha' := Finset.mem_Icc.1 (hAsub N ha)
      have hb' := Finset.mem_Icc.1 (hAsub N hb)
      exact Finset.mem_Icc.2 ⟨by omega, by omega⟩
    have hcard : #(A N + A N) ≤ 2 * N := by
      have := Finset.card_le_card hsub
      rw [Nat.card_Icc] at this
      omega
    rw [div_le_iff₀ (by exact_mod_cast hN)]
    exact_mod_cast hcard
  have := le_of_tendsto hlim hbound
  nlinarith

theorem erdos_840.variants.pikhurko (c : ℝ) (hc : IsQuasiSidonConstant c) :
    c ≤ (1 / 4 + 1 / (Real.pi + 2) ^ 2) ^ (-(1 : ℝ) / 2) := by
  sorry

end Erdos840
