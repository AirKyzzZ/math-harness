import Mathlib

namespace Erdos231

def ContainsAbelianSquare {α : Type*} (S : List α) : Prop :=
  ∃ x y : List α, x ≠ [] ∧ x.Perm y ∧ x ++ y <:+: S

theorem containsAbelianSquare_iff {α : Type*} (S : List α) :
    ContainsAbelianSquare S ↔ ∃ i < S.length, ∃ L < S.length, 0 < L ∧ i + 2 * L ≤ S.length ∧
      ((S.drop i).take L).Perm ((S.drop (i + L)).take L) := by
  constructor
  · rintro ⟨x, y, hx, hxy, s, t, hS⟩
    have hlen : x.length = y.length := hxy.length_eq
    have hxpos : 0 < x.length := List.length_pos_of_ne_nil hx
    refine ⟨s.length, ?_, x.length, ?_, hxpos, ?_, ?_⟩
    · rw [← hS]; simp; omega
    · rw [← hS]; simp; omega
    · rw [← hS]; simp; omega
    · have h1 : (S.drop s.length).take x.length = x := by
        rw [← hS, List.append_assoc, List.drop_left, List.append_assoc, List.take_left]
      have h2 : (S.drop (s.length + x.length)).take x.length = y := by
        rw [← hS, ← List.length_append, show s ++ (x ++ y) ++ t = (s ++ x) ++ (y ++ t) by
          simp only [List.append_assoc], List.drop_left, List.take_left' hlen.symm]
      rw [h1, h2]
      exact hxy
  · rintro ⟨i, -, L, -, hL, hle, hperm⟩
    refine ⟨(S.drop i).take L, (S.drop (i + L)).take L, ?_, hperm, ?_⟩
    · intro h
      have := congrArg List.length h
      simp only [List.length_take, List.length_drop, List.length_nil] at this
      omega
    · have : (S.drop i).take L ++ (S.drop (i + L)).take L = (S.drop i).take (L + L) := by
        rw [List.take_add, List.drop_drop]
      rw [this]
      exact (List.take_prefix _ _).isInfix.trans (List.drop_suffix _ _).isInfix

instance {α : Type*} [DecidableEq α] (S : List α) : Decidable (ContainsAbelianSquare S) :=
  decidable_of_iff _ (containsAbelianSquare_iff S).symm

theorem not_containsAbelianSquare_example :
    ¬ ContainsAbelianSquare ([0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 1, 0, 1, 3] : List (Fin 4)) := by
  decide +kernel

theorem containsAbelianSquare_of_length_four (f : Fin 4 → Fin 2) :
    ContainsAbelianSquare (List.ofFn f) := by
  revert f
  decide +kernel

set_option maxRecDepth 200000 in
theorem containsAbelianSquare_of_length_eight (f : Fin 8 → Fin 3) :
    ContainsAbelianSquare (List.ofFn f) := by
  revert f
  decide +kernel

theorem erdos_231 :
    ¬ ∀ k : ℕ, 2 ≤ k → ∀ S : List (Fin k), S.length = 2 ^ k - 1 → ContainsAbelianSquare S := by
  sorry

theorem erdos_231.variants.two_pow :
    ¬ ∀ k : ℕ, 2 ≤ k → ∀ S : List (Fin k), S.length = 2 ^ k → ContainsAbelianSquare S := by
  intro h
  exact not_containsAbelianSquare_example (h 4 (by norm_num) _ rfl)

theorem erdos_231.variants.two_pow_small (k : ℕ) (hk : k = 2 ∨ k = 3) (S : List (Fin k))
    (hS : S.length = 2 ^ k) : ContainsAbelianSquare S := by
  have key : ∀ {α : Type} (S : List α) {n : ℕ}, S.length = n → ∃ f : Fin n → α, S = List.ofFn f :=
    fun S n h => by subst h; exact ⟨S.get, (List.ofFn_get S).symm⟩
  rcases hk with rfl | rfl
  · obtain ⟨f, rfl⟩ := key S hS
    exact containsAbelianSquare_of_length_four f
  · obtain ⟨f, rfl⟩ := key S hS
    exact containsAbelianSquare_of_length_eight f

end Erdos231
