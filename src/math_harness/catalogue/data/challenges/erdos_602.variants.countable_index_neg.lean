import Mathlib

open Set

namespace Erdos602

def IsMonochromatic {α : Type*} (f : α → Fin 2) (A : Set α) : Prop :=
  ∀ x ∈ A, ∀ y ∈ A, f x = f y

def HasPropertyB {α : Type*} (I : Type*) (A : I → Set α) : Prop :=
  ∃ f : α → Fin 2, ∀ i, ¬IsMonochromatic f (A i)

theorem erdos_602.variants.disjoint :
    ∀ {α : Type*} {I : Type*} (A : I → Set α),
      (∀ i, (A i).Infinite) →
      (∀ i j, i ≠ j → Disjoint (A i) (A j)) →
      HasPropertyB I A := by
  intro α I A hInfinite hDisjoint
  -- For each i, pick two distinct elements a_fn i, b_fn i ∈ A i.
  have ha_b : ∀ i, ∃ a b : α, a ∈ A i ∧ b ∈ A i ∧ a ≠ b := by
    intro i
    obtain ⟨a, ha⟩ := (hInfinite i).nonempty
    have hA2 : (A i \ {a}).Nonempty := by
      apply Set.Infinite.nonempty
      exact (hInfinite i).sdiff (Set.finite_singleton a)
    obtain ⟨b, hbA, hba⟩ := hA2
    simp only [Set.mem_singleton_iff] at hba
    exact ⟨a, b, ha, hbA, fun h => hba h.symm⟩
  choose a_fn b_fn ha_mem hb_mem hab_ne using ha_b
  -- Key property: a_fn i ≠ b_fn j for any j.
  have key : ∀ i j, a_fn i ≠ b_fn j := by
    intro i j haj
    by_cases hij : i = j
    · subst hij; exact hab_ne i haj
    · have hdisj := hDisjoint i j hij
      rw [Set.disjoint_left] at hdisj
      have hbj : b_fn j ∈ A j := hb_mem j
      rw [← haj] at hbj
      exact hdisj (ha_mem i) hbj
  -- Define colouring: f n = 1 iff n = b_fn i for some i, else 0.
  -- Use Classical.propDecidable for the existential over I.
  classical
  let f : α → Fin 2 := fun n => if ∃ i, n = b_fn i then 1 else 0
  refine ⟨f, fun i => ?_⟩
  -- Show A i is not monochromatic under f.
  intro hMono
  -- f (a_fn i) = 0: ¬ ∃ j, a_fn i = b_fn j.
  have hfa : f (a_fn i) = 0 := by
    simp only [f]
    rw [if_neg]
    rintro ⟨j, hj⟩
    exact key i j hj
  -- f (b_fn i) = 1: witnessed by i itself.
  have hfb : f (b_fn i) = 1 := by
    simp only [f]
    rw [if_pos ⟨i, rfl⟩]
  -- hMono says f is constant on A i, but f (a_fn i) = 0 ≠ 1 = f (b_fn i).
  have hne := hMono (a_fn i) (ha_mem i) (b_fn i) (hb_mem i)
  rw [hfa, hfb] at hne
  exact absurd hne (by decide)

theorem erdos_602.variants.countable_index_neg :
    ¬ (∀ {α : Type*} (A : ℕ → Set α), (∀ i, (A i).Countable ∧ (A i).Infinite) → (∀ i j, i ≠ j → (A i ∩ A j).Finite) → (∀ i j, i ≠ j → Set.ncard (A i ∩ A j) ≠ 1) → HasPropertyB ℕ A) := by
  sorry

theorem erdos_602.variants.single_set {α : Type*} (A : Set α) (hA : A.Infinite) :
    ∃ f : α → Fin 2, ¬IsMonochromatic f A := by
  classical
  -- A is infinite, so it has at least two distinct elements.
  obtain ⟨a, ha⟩ := hA.nonempty
  -- Pick a second element different from a.
  have hA2 : (A \ {a}).Nonempty := by
    apply Set.Infinite.nonempty
    exact hA.sdiff (Set.finite_singleton a)
  obtain ⟨b, hbA⟩ := hA2
  simp only [Set.mem_sdiff, Set.mem_singleton_iff] at hbA
  obtain ⟨hbA, hba⟩ := hbA
  -- Colour a with 0, b with 1, everything else with 0.
  refine ⟨fun n => if n = b then 1 else 0, ?_⟩
  -- The colouring is not monochromatic on A since f(a) = 0 ≠ 1 = f(b).
  intro hMono
  have h0 : (fun n => if n = b then (1 : Fin 2) else 0) a = 0 := by
    simp only [ite_eq_right_iff]
    intro h
    exact absurd h (Ne.symm hba)
  have h1 : (fun n => if n = b then (1 : Fin 2) else 0) b = 1 := by
    simp
  have := hMono a ha b hbA
  rw [h0, h1] at this
  exact absurd this (by decide)

theorem erdos_602.variants.empty_index {α : Type*} :
    ∀ (A : PEmpty → Set α),
      (∀ i, (A i).Infinite) →
      HasPropertyB PEmpty A := by
  intro A _hInfinite
  exact ⟨fun _ => 0, fun i => i.elim⟩

theorem erdos_602.variants.unique_index {α : Type*} (I : Type*) [Unique I]
    (A : I → Set α) (hInfinite : ∀ i, (A i).Infinite) :
    HasPropertyB I A := by
  -- Use single_set to get a colouring making A (default) non-monochromatic.
  obtain ⟨f, hf⟩ := erdos_602.variants.single_set (A default) (hInfinite default)
  refine ⟨f, fun i => ?_⟩
  -- Every i equals default by uniqueness.
  rw [Unique.eq_default i]
  exact hf

theorem erdos_602.variants.two_sets :
    ∀ {α : Type*} (A : Fin 2 → Set α),
      (∀ i, (A i).Infinite) →
      (A 0 ∩ A 1).Finite →
      Set.ncard (A 0 ∩ A 1) ≠ 1 →
      HasPropertyB (Fin 2) A := by
  intro α A hInfinite hFin hNcard
  classical
  -- Case split: intersection empty or size ≥ 2.
  by_cases hEmpty : (A 0 ∩ A 1) = ∅
  · -- Disjoint case: A 0 and A 1 are disjoint.
    -- Pick distinct a, b from A 0.
    obtain ⟨a, ha0⟩ := (hInfinite 0).nonempty
    have hA0' : (A 0 \ {a}).Nonempty :=
      Set.Infinite.nonempty ((hInfinite 0).sdiff (Set.finite_singleton a))
    obtain ⟨b, hbA0, hba⟩ := hA0'
    simp only [Set.mem_singleton_iff] at hba
    -- Pick distinct c, d from A 1.
    obtain ⟨c, hc1⟩ := (hInfinite 1).nonempty
    have hA1' : (A 1 \ {c}).Nonempty :=
      Set.Infinite.nonempty ((hInfinite 1).sdiff (Set.finite_singleton c))
    obtain ⟨d, hd1, hdc⟩ := hA1'
    simp only [Set.mem_singleton_iff] at hdc
    -- Disjointness facts: A 0 and A 1 are disjoint.
    have hDisj : ∀ x, x ∈ A 0 → x ∉ A 1 := by
      intro x hx0 hx1
      have hmem : x ∈ A 0 ∩ A 1 := ⟨hx0, hx1⟩
      rw [hEmpty] at hmem
      exact hmem
    have hb_ne_c : b ≠ c := fun h => hDisj b hbA0 (h ▸ hc1)
    have hb_ne_d : b ≠ d := fun h => hDisj b hbA0 (h ▸ hd1)
    have ha_ne_c : a ≠ c := fun h => hDisj a ha0 (h ▸ hc1)
    -- Colour b with 1, c with 1, everything else with 0.
    -- A 0: f(a) = 0 (a ≠ b, a ≠ c), f(b) = 1. Non-mono.
    -- A 1: f(c) = 1, f(d) = 0 (d ≠ b, d ≠ c). Non-mono.
    refine ⟨fun n => if n = b ∨ n = c then 1 else 0, fun i => ?_⟩
    fin_cases i
    · -- A 0 is not monochromatic: f(a) = 0 ≠ 1 = f(b).
      intro hMono
      have hfa : (fun n => if n = b ∨ n = c then (1 : Fin 2) else 0) a = 0 := by
        simp [show a ≠ b from fun h => hba h.symm, ha_ne_c]
      have hfb : (fun n => if n = b ∨ n = c then (1 : Fin 2) else 0) b = 1 := by simp
      have := hMono a ha0 b hbA0
      rw [hfa, hfb] at this; exact absurd this (by decide)
    · -- A 1 is not monochromatic: f(c) = 1 ≠ 0 = f(d).
      intro hMono
      have hfc : (fun n => if n = b ∨ n = c then (1 : Fin 2) else 0) c = 1 := by simp
      have hfd : (fun n => if n = b ∨ n = c then (1 : Fin 2) else 0) d = 0 := by
        simp [hb_ne_d.symm, hdc]
      have := hMono c hc1 d hd1
      rw [hfc, hfd] at this; exact absurd this (by decide)
  · -- Intersection has size ≥ 2.
    have hge2 : 1 < Set.ncard (A 0 ∩ A 1) := by
      have hpos : 0 < Set.ncard (A 0 ∩ A 1) := by
        rw [Set.ncard_pos hFin]
        exact Set.nonempty_iff_ne_empty.mpr hEmpty
      omega
    -- Get two distinct elements x, y in the intersection.
    obtain ⟨x, hxI, y, hyI, hxy⟩ := (Set.one_lt_ncard hFin).mp hge2
    -- Colour y with 1, everything else with 0.
    -- x ∈ A 0 ∩ A 1, y ∈ A 0 ∩ A 1, x ≠ y.
    refine ⟨fun n => if n = y then 1 else 0, fun i => ?_⟩
    fin_cases i
    · -- A 0: f(x) = 0 ≠ 1 = f(y), x ≠ y, both in A 0.
      intro hMono
      have hfx : (fun n => if n = y then (1 : Fin 2) else 0) x = 0 := by
        simp [show x ≠ y from hxy]
      have hfy : (fun n => if n = y then (1 : Fin 2) else 0) y = 1 := by simp
      have := hMono x hxI.1 y hyI.1
      rw [hfx, hfy] at this; exact absurd this (by decide)
    · -- A 1: f(x) = 0 ≠ 1 = f(y), both in A 1.
      intro hMono
      have hfx : (fun n => if n = y then (1 : Fin 2) else 0) x = 0 := by
        simp [show x ≠ y from hxy]
      have hfy : (fun n => if n = y then (1 : Fin 2) else 0) y = 1 := by simp
      have := hMono x hxI.2 y hyI.2
      rw [hfx, hfy] at this; exact absurd this (by decide)

private lemma evens_infinite : Set.Infinite {n : ℕ | Even n} :=
  Set.infinite_of_injective_forall_mem (f := fun n : ℕ => 2 * n)
    (by intro a b h; simp only at h; omega)
    (by intro n; simp only [Set.mem_ofPred_eq]; exact ⟨n, by ring⟩)

private lemma odds_infinite : Set.Infinite {n : ℕ | Odd n} :=
  Set.infinite_of_injective_forall_mem (f := fun n : ℕ => 2 * n + 1)
    (by intro a b h; simp only at h; omega)
    (by intro n; simp only [Set.mem_ofPred_eq]; exact ⟨n, by ring⟩)

private lemma evens_inter_odds_empty : {n : ℕ | Even n} ∩ {n : ℕ | Odd n} = ∅ := by
  ext x
  simp only [Set.mem_inter_iff, Set.mem_ofPred_eq, Set.mem_empty_iff_false, iff_false, not_and]
  intro ⟨k, hk⟩ ⟨m, hm⟩; omega

example : HasPropertyB PEmpty (fun (_ : PEmpty) => (Set.univ : Set ℕ)) :=
  erdos_602.variants.empty_index _ (fun _ => Set.infinite_univ)

example (A : Set ℕ) (hA : A.Infinite) :
    HasPropertyB Unit (fun _ => A) :=
  erdos_602.variants.unique_index Unit (fun _ => A) (fun _ => hA)

example :
    let A : Fin 2 → Set ℕ := ![{n | Even n}, {n | Odd n}]
    (∀ i, (A i).Countable ∧ (A i).Infinite) ∧
    (∀ i j, i ≠ j → (A i ∩ A j).Finite) ∧
    (∀ i j, i ≠ j → Set.ncard (A i ∩ A j) ≠ 1) := by
  refine ⟨?_, ?_, ?_⟩
  · intro i; fin_cases i
    · exact ⟨(Set.countable_univ).mono (Set.subset_univ _), evens_infinite⟩
    · exact ⟨(Set.countable_univ).mono (Set.subset_univ _), odds_infinite⟩
  · intro i j hij
    fin_cases i <;> fin_cases j
    all_goals first | exact absurd rfl hij | skip
    · show ({n : ℕ | Even n} ∩ {n | Odd n}).Finite
      rw [evens_inter_odds_empty]; exact Set.finite_empty
    · show ({n : ℕ | Odd n} ∩ {n | Even n}).Finite
      rw [Set.inter_comm, evens_inter_odds_empty]; exact Set.finite_empty
  · intro i j hij
    fin_cases i <;> fin_cases j
    all_goals first | exact absurd rfl hij | skip
    · show Set.ncard ({n : ℕ | Even n} ∩ {n | Odd n}) ≠ 1
      rw [evens_inter_odds_empty, Set.ncard_empty]; decide
    · show Set.ncard ({n : ℕ | Odd n} ∩ {n | Even n}) ≠ 1
      rw [Set.inter_comm, evens_inter_odds_empty, Set.ncard_empty]; decide

example : HasPropertyB (Fin 2) (![{n : ℕ | Even n}, {n | Odd n}] : Fin 2 → Set ℕ) := by
  classical
  refine ⟨fun n => if n = 2 ∨ n = 1 then 1 else 0, fun i hMono => ?_⟩
  fin_cases i
  · -- A 0 = evens: f(0) = 0 ≠ 1 = f(2)
    have h0 : (fun n : ℕ => if n = 2 ∨ n = 1 then (1 : Fin 2) else 0) 0 = 0 := by decide
    have h2 : (fun n : ℕ => if n = 2 ∨ n = 1 then (1 : Fin 2) else 0) 2 = 1 := by decide
    have hmem0 : (0 : ℕ) ∈ (![{n : ℕ | Even n}, {n | Odd n}] : Fin 2 → Set ℕ) 0 := by
      simp only [Matrix.cons_val_zero, Set.mem_ofPred_eq]; exact ⟨0, by ring⟩
    have hmem2 : (2 : ℕ) ∈ (![{n : ℕ | Even n}, {n | Odd n}] : Fin 2 → Set ℕ) 0 := by
      simp only [Matrix.cons_val_zero, Set.mem_ofPred_eq]; exact ⟨1, by ring⟩
    have := hMono 0 hmem0 2 hmem2
    rw [h0, h2] at this; exact absurd this (by decide)
  · -- A 1 = odds: f(1) = 1 ≠ 0 = f(3)
    have h1 : (fun n : ℕ => if n = 2 ∨ n = 1 then (1 : Fin 2) else 0) 1 = 1 := by decide
    have h3 : (fun n : ℕ => if n = 2 ∨ n = 1 then (1 : Fin 2) else 0) 3 = 0 := by decide
    have hmem1 : (1 : ℕ) ∈ (![{n : ℕ | Even n}, {n | Odd n}] : Fin 2 → Set ℕ) 1 := by
      simp only [Matrix.cons_val_one]; exact ⟨0, by ring⟩
    have hmem3 : (3 : ℕ) ∈ (![{n : ℕ | Even n}, {n | Odd n}] : Fin 2 → Set ℕ) 1 := by
      simp only [Matrix.cons_val_one]; exact ⟨1, by ring⟩
    have := hMono 1 hmem1 3 hmem3
    rw [h1, h3] at this; exact absurd this (by decide)

example : Set.ncard ({n : ℕ | Even n} ∩ {n : ℕ | n = 0 ∨ Odd n}) = 1 := by
  have heq : {n : ℕ | Even n} ∩ {n : ℕ | n = 0 ∨ Odd n} = {0} := by
    ext x
    simp only [Set.mem_inter_iff, Set.mem_ofPred_eq, Set.mem_singleton_iff]
    constructor
    · rintro ⟨⟨k, hk⟩, rfl | ⟨m, hm⟩⟩ <;> omega
    · rintro rfl; exact ⟨⟨0, by ring⟩, Or.inl rfl⟩
  rw [heq, Set.ncard_singleton]

def disjoint_without_infinite_claim : Prop :=
  ∀ {α : Type} {I : Type} (A : I → Set α),
    (∀ i j, i ≠ j → Disjoint (A i) (A j)) →
    HasPropertyB I A

theorem disjoint_without_infinite_claim.disproof :
    ¬ disjoint_without_infinite_claim := by
  -- We prove the negation by constructing an explicit counterexample.
  -- Specialize directly to α = ℕ, I = Fin 2, A k = if k = 0 then {0} else {1}.
  intro h
  -- Obtain a colouring from h applied to the concrete family.
  -- We need h to see it as a universally quantified statement.
  have hApp : HasPropertyB (Fin 2) (fun k : Fin 2 => if k = 0 then ({0} : Set ℕ) else {1}) :=
    h (fun k : Fin 2 => if k = 0 then ({0} : Set ℕ) else {1}) (by
      intro i j hij
      fin_cases i <;> fin_cases j <;> simp_all)
  obtain ⟨f, hf⟩ := hApp
  -- hf 0 : ¬ IsMonochromatic f ((fun k => if k = 0 then {0} else {1}) 0)
  -- (fun k => if k = 0 then {0} else {1}) 0 = {0}, a singleton.
  -- A singleton is monochromatic under any colouring. Contradiction.
  apply hf 0
  -- Goal: IsMonochromatic f ((fun k => if k = 0 then {0} else {1}) 0)
  -- which reduces to: IsMonochromatic f {0}
  simp only [Fin.isValue, ↓reduceIte]
  intro x hx y hy
  simp only [Set.mem_singleton_iff] at hx hy
  rw [hx, hy]

end Erdos602
