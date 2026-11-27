import Mathlib

open Filter

namespace Erdos872

noncomputable section

def IsPrimitive (n : ℕ) (A : Finset ℕ) : Prop :=
  A ⊆ Finset.Icc 2 n ∧ ∀ a ∈ A, ∀ b ∈ A, a ≠ b → ¬ a ∣ b

structure GamePos (n : ℕ) where
  claimed : Finset ℕ
  pool : Finset ℕ

def legalMoves {n : ℕ} (p : GamePos n) : Finset ℕ :=
  open scoped Classical in
  p.pool.filter fun x => IsPrimitive n (insert x p.claimed)

lemma mem_legalMoves {n : ℕ} {p : GamePos n} {x : ℕ} :
    x ∈ legalMoves p ↔ x ∈ p.pool ∧ IsPrimitive n (insert x p.claimed) := by
  classical
  simp [legalMoves]

def applyMove {n : ℕ} (p : GamePos n) (x : ℕ) : GamePos n where
  claimed := insert x p.claimed
  pool := p.pool.erase x

def startPos (n : ℕ) : GamePos n where
  claimed := ∅
  pool := Finset.Icc 2 n

def gameValueAux {n : ℕ} : ℕ → Bool → GamePos n → ℕ
  | 0, _turn, p => p.claimed.card
  | fuel + 1, turn, p =>
      let moves := legalMoves p
      let f := fun x => gameValueAux fuel (!turn) (applyMove p x)
      let vals := moves.image f
      if h : moves.Nonempty then
        let hvals : vals.Nonempty := h.image f
        if turn then vals.max' hvals else vals.min' hvals
      else
        p.claimed.card

lemma gameValueAux_le {n : ℕ} (fuel : ℕ) (turn : Bool) (p : GamePos n) :
    gameValueAux fuel turn p ≤ p.claimed.card + p.pool.card := by
  induction fuel generalizing turn p with
  | zero =>
    simp only [gameValueAux]
    exact Nat.le_add_right _ _
  | succ fuel ih =>
    have key : ∀ x ∈ legalMoves p,
        gameValueAux fuel (!turn) (applyMove p x) ≤ p.claimed.card + p.pool.card := by
      intro x hx
      have hxpool : x ∈ p.pool := (mem_legalMoves.mp hx).1
      have h1 : (insert x p.claimed).card ≤ p.claimed.card + 1 := Finset.card_insert_le _ _
      have h2 : (p.pool.erase x).card = p.pool.card - 1 := Finset.card_erase_of_mem hxpool
      have h3 : 0 < p.pool.card := Finset.card_pos.mpr ⟨x, hxpool⟩
      have h4 : gameValueAux fuel (!turn) (applyMove p x) ≤
          (insert x p.claimed).card + (p.pool.erase x).card := ih (!turn) (applyMove p x)
      omega
    have key' : ∀ v ∈ (legalMoves p).image
        (fun x => gameValueAux fuel (!turn) (applyMove p x)),
        v ≤ p.claimed.card + p.pool.card := by
      intro v hv
      obtain ⟨x, hx, rfl⟩ := Finset.mem_image.mp hv
      exact key x hx
    simp only [gameValueAux]
    split_ifs with h ht
    · exact Finset.max'_le _ _ _ key'
    · exact key' _ (Finset.min'_mem _ _)
    · exact Nat.le_add_right _ _

def gameLength {n : ℕ} : GamePos n → ℕ := fun p =>
  gameValueAux p.pool.card true p

def L (n : ℕ) : ℕ := gameLength (startPos n)

theorem erdos_872.parts.ii_neg :
    ¬ (¬ ∀ ε > (0 : ℝ), ∀ᶠ n in atTop, (L n : ℝ) ≥ (1 - ε) * n / 2) := by
  sorry

theorem erdos_872.trivial_upper_bound (n : ℕ) (hn : 2 ≤ n) :
    L n ≤ n - 1 := by
  calc L n ≤ (startPos n).claimed.card + (startPos n).pool.card :=
        gameValueAux_le (startPos n).pool.card true (startPos n)
    _ = n - 1 := by
        simp only [startPos, Finset.card_empty, Nat.card_Icc]
        omega

end

end Erdos872
