import Mathlib

open Filter Real

namespace Erdos158

def B2 (g : ℕ) (A : Set ℕ) : Prop :=
  ∀ n, {x : ℕ × ℕ | x.1 + x.2 = n ∧ x.1 ≤ x.2 ∧ x.1 ∈ A ∧ x.2 ∈ A}.encard ≤ g

@[simp]
lemma b2_one {A : Set ℕ} : B2 1 A ↔ IsSidon A where
  mp hA a₁ ha₁ a₂ ha₂ b₁ hb₁ b₂ hb₂ h := by
    wlog h₁ : a₁ ≤ b₁
    · have := this hA _ hb₁ _ ha₂ _ ha₁ _ hb₂
      grind
    wlog h₂ : a₂ ≤ b₂
    · have := this hA _ ha₁ _ hb₂ _ hb₁ _ ha₂
      clear ha₁ ha₂ hb₁ hb₂
      grind
    have := Set.encard_le_one_iff.1 (hA (a₁ + b₁)) ⟨a₁, b₁⟩ ⟨a₂, b₂⟩ (by simp [*]) (by simp [*])
    grind
  mpr hA n := by
    refine Set.encard_le_one_iff.2 fun x y ⟨h, p, q⟩ ⟨r, s, t⟩ => ?_
    have := hA x.1 q.1 y.1 t.1 x.2 q.2 y.2 t.2 (h.trans r.symm)
    grind

theorem erdos_158.variants.isSidon' {A : Set ℕ} (hAinf : A.Infinite) (hAsid : IsSidon A) :
    liminf (fun N ↦ ENNReal.ofReal ((A ∩ .Iio N).ncard * N ^ (- 1 / 2 : ℝ) * log N ^ (1 / 2 : ℝ))) atTop < ⊤ := by
  sorry

theorem erdos_158.variants.isSidon {A : Set ℕ} (hAinf : A.Infinite) (hAsid : IsSidon A) :
    liminf (fun N : ℕ => (A ∩ .Iio N).ncard * (N : ℝ) ^ (- 1 / 2 : ℝ)) atTop = 0 := by
  have := erdos_158.variants.isSidon' hAinf hAsid
  contrapose! this with h
  rw [Tendsto.liminf_eq]
  refine ENNReal.tendsto_ofReal_atTop.comp ?_
  obtain ⟨c, hc_pos, hc⟩ :
      ∃ c > (0 : ℝ), ∀ᶠ N in atTop, c ≤ (A ∩ .Iio N).ncard * N ^ (- 1 / 2 : ℝ) := by
    suffices
      ∃ a ∈ {a | ∃ c : ℕ, ∀ b ≥ c, a ≤ ↑(A ∩ .Iio b).ncard * (b : ℝ) ^ (-1 / 2 : ℝ)}, 0 < a by aesop
    by_contra! ha
    simp only [liminf_eq, eventually_atTop] at h
    exact h <| le_antisymm (csSup_le ⟨0, 0, fun n hn => by positivity⟩ ha) <|
      (le_csSup ⟨0, ha⟩ ⟨0, fun n hn => by positivity⟩)
  refine tendsto_atTop_mono' atTop (f₁ := fun N : ℕ => c * log N ^ (1 / 2 : ℝ)) ?_ ?_
  · filter_upwards [hc] with n hn
    grw [hn]
  · refine .const_mul_atTop hc_pos ?_
    simpa [Function.comp_def] using (tendsto_rpow_atTop (by linarith : 0 < 1 / (2 : ℝ))).comp
      (Real.tendsto_log_atTop.comp tendsto_natCast_atTop_atTop)

end Erdos158
