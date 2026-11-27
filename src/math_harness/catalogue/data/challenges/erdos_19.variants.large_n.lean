import Mathlib

open Filter

namespace Erdos19

open scoped Classical in
structure EFLConfig (V : Type*) (n : ℕ) where
  A : Fin n → Finset V
  card_eq : ∀ i, (A i).card = n
  inter_le : ∀ i j, i ≠ j → (A i ∩ A j).card ≤ 1
  cover : ∀ v, ∃ i, v ∈ A i

namespace EFLConfig

variable {V : Type*} {n : ℕ} (C : EFLConfig V n)

def graph : SimpleGraph V where
  Adj u v := u ≠ v ∧ ∃ i, u ∈ C.A i ∧ v ∈ C.A i
  symm := ⟨fun _ _ ⟨h, i, hu, hv⟩ => ⟨h.symm, i, hv, hu⟩⟩
  loopless := ⟨fun _ h => h.1 rfl⟩

def IsShared (v : V) : Prop := ∃ i j, i ≠ j ∧ v ∈ C.A i ∧ v ∈ C.A j

open scoped Classical in
noncomputable def sharedSet : Finset V :=
  ((Finset.univ : Finset (Fin n)).biUnion C.A).filter C.IsShared

theorem le_chromaticNumber : (n : ℕ∞) ≤ C.graph.chromaticNumber := by
  rcases Nat.eq_zero_or_pos n with rfl | hn
  · simp
  have hcl : C.graph.IsClique (C.A ⟨0, hn⟩ : Set V) := by
    intro u hu v hv huv
    exact ⟨huv, ⟨0, hn⟩, hu, hv⟩
  have := hcl.card_le_chromaticNumber
  rwa [C.card_eq] at this

lemma eq_of_not_shared {v : V} (hv : ¬ C.IsShared v) {i j : Fin n}
    (hi : v ∈ C.A i) (hj : v ∈ C.A j) : i = j := by
  by_contra h
  exact hv ⟨i, j, h, hi, hj⟩

open scoped Classical in
theorem colorable_of_sharedColoring (c : V → Fin n)
    (hc : ∀ i u v, u ∈ C.A i → v ∈ C.A i → C.IsShared u → C.IsShared v → c u = c v → u = v) :
    C.graph.Colorable n := by
  -- private vertices and free colours of each clique
  let P : Fin n → Finset V := fun i => (C.A i).filter (fun v => ¬ C.IsShared v)
  let U : Fin n → Finset V := fun i => (C.A i).filter C.IsShared
  let F : Fin n → Finset (Fin n) := fun i => Finset.univ \ (U i).image c
  have hcard : ∀ i, (P i).card ≤ (F i).card := by
    intro i
    have h1 : (U i).card + (P i).card = n := by
      rw [← C.card_eq i]; exact Finset.card_filter_add_card_filter_not _
    have h2 : ((U i).image c).card ≤ (U i).card := Finset.card_image_le
    have h3 : (F i).card = n - ((U i).image c).card := by
      simp [F, Finset.card_sdiff]
    omega
  have hne : ∀ i, Nonempty (P i ↪ F i) := fun i =>
    Function.Embedding.nonempty_of_card_le (by simpa using hcard i)
  let e : ∀ i, P i ↪ F i := fun i => Classical.choice (hne i)
  let idx : V → Fin n := fun v => Classical.choose (C.cover v)
  have hidx : ∀ v, v ∈ C.A (idx v) := fun v => Classical.choose_spec (C.cover v)
  let col : V → Fin n := fun v =>
    if h : C.IsShared v then c v
    else ((e (idx v) ⟨v, Finset.mem_filter.2 ⟨hidx v, h⟩⟩ : F (idx v)) : Fin n)
  have col_priv : ∀ v (hv : ¬ C.IsShared v) j (hj : v ∈ C.A j),
      col v = ((e j ⟨v, Finset.mem_filter.2 ⟨hj, hv⟩⟩ : F j) : Fin n) := by
    intro v hv j hj
    have key : ∀ i (hi : i = j) (p : v ∈ P i), ((e i ⟨v, p⟩ : F i) : Fin n) =
        ((e j ⟨v, Finset.mem_filter.2 ⟨hj, hv⟩⟩ : F j) : Fin n) := by
      rintro i rfl p; rfl
    simp only [col, dif_neg hv]
    exact key _ (C.eq_of_not_shared hv (hidx v) hj) _
  have col_free : ∀ v (hv : ¬ C.IsShared v) j (hj : v ∈ C.A j), col v ∈ F j := by
    intro v hv j hj
    rw [col_priv v hv j hj]; exact Subtype.property _
  refine ⟨SimpleGraph.Coloring.mk col ?_⟩
  rintro u v ⟨huv, j, hu, hv⟩ heq
  by_cases su : C.IsShared u <;> by_cases sv : C.IsShared v
  · have : col u = c u := dif_pos su
    have : col v = c v := dif_pos sv
    exact huv (hc j u v hu hv su sv (by simp_all))
  · have h1 := col_free v sv j hv
    have : col u = c u := dif_pos su
    simp only [F, Finset.mem_sdiff, Finset.mem_univ, true_and, Finset.mem_image] at h1
    exact h1 ⟨u, Finset.mem_filter.2 ⟨hu, su⟩, by rw [← this, heq]⟩
  · have h1 := col_free u su j hu
    have : col v = c v := dif_pos sv
    simp only [F, Finset.mem_sdiff, Finset.mem_univ, true_and, Finset.mem_image] at h1
    exact h1 ⟨v, Finset.mem_filter.2 ⟨hv, sv⟩, by rw [← this, ← heq]⟩
  · rw [col_priv u su j hu, col_priv v sv j hv] at heq
    have := (e j).injective (Subtype.ext heq)
    exact huv (congrArg Subtype.val this)

open scoped Classical in
theorem card_sharedSet_le : C.sharedSet.card ≤ n.choose 2 := by
  -- assign to each shared vertex a pair of cliques containing it
  let f : V → Finset (Fin n) := fun v =>
    if h : C.IsShared v then {Classical.choose h, Classical.choose (Classical.choose_spec h)}
    else ∅
  have hf : ∀ v ∈ C.sharedSet, f v ∈ (Finset.univ : Finset (Fin n)).powersetCard 2 ∧
      ∀ x ∈ f v, v ∈ C.A x := by
    intro v hv
    have hs : C.IsShared v := (Finset.mem_filter.1 hv).2
    obtain ⟨hij, hi, hj⟩ := Classical.choose_spec (Classical.choose_spec hs)
    simp only [f, dif_pos hs]
    refine ⟨Finset.mem_powersetCard.2 ⟨Finset.subset_univ _, Finset.card_pair hij⟩, ?_⟩
    intro x hx
    rcases Finset.mem_insert.1 hx with rfl | hx
    · exact hi
    · rw [Finset.mem_singleton.1 hx]; exact hj
  have hinj : Set.InjOn f C.sharedSet := by
    intro u hu v hv huv
    obtain ⟨hpu, hu'⟩ := hf u hu
    obtain ⟨hpv, hv'⟩ := hf v hv
    obtain ⟨a, b, hab, hfab⟩ := Finset.card_eq_two.1 (Finset.mem_powersetCard.1 hpu).2
    have ha : a ∈ f u := by rw [hfab]; simp
    have hb : b ∈ f u := by rw [hfab]; simp
    have hle := C.inter_le a b hab
    have hu2 : u ∈ C.A a ∩ C.A b := Finset.mem_inter.2 ⟨hu' a ha, hu' b hb⟩
    have hv2 : v ∈ C.A a ∩ C.A b :=
      Finset.mem_inter.2 ⟨hv' a (huv ▸ ha), hv' b (huv ▸ hb)⟩
    exact Finset.card_le_one.1 hle u hu2 v hv2
  have := Finset.card_le_card_of_injOn f (t := (Finset.univ : Finset (Fin n)).powersetCard 2)
    (fun v hv => (hf v hv).1) hinj
  simpa [Finset.card_powersetCard] using this

end EFLConfig

open EFLConfig

open scoped Classical in
theorem erdos_19.variants.le_three {V : Type*} {n : ℕ} (C : EFLConfig V n) (hn : n ≤ 3) :
    C.graph.chromaticNumber = n := by
  refine le_antisymm ?_ C.le_chromaticNumber
  apply SimpleGraph.Colorable.chromaticNumber_le
  have hS : C.sharedSet.card ≤ n := by
    have h1 := C.card_sharedSet_le
    have h2 : n.choose 2 ≤ n := by interval_cases n <;> decide
    omega
  -- colour the shared vertices injectively
  let c : V → Fin n := fun v =>
    if h : v ∈ C.sharedSet then Fin.castLE hS (C.sharedSet.equivFin ⟨v, h⟩)
    else ⟨0, by
      obtain ⟨i, hi⟩ := C.cover v
      rw [← C.card_eq i]; exact Finset.card_pos.2 ⟨v, hi⟩⟩
  refine C.colorable_of_sharedColoring c ?_
  intro i u v hu hv su sv huv
  have mu : u ∈ C.sharedSet := Finset.mem_filter.2 ⟨Finset.mem_biUnion.2 ⟨i, by simp, hu⟩, su⟩
  have mv : v ∈ C.sharedSet := Finset.mem_filter.2 ⟨Finset.mem_biUnion.2 ⟨i, by simp, hv⟩, sv⟩
  simp only [c, dif_pos mu, dif_pos mv] at huv
  have := C.sharedSet.equivFin.injective (Fin.castLE_injective hS huv)
  exact congrArg Subtype.val this

theorem erdos_19.variants.large_n :
    ∀ᶠ n in atTop, ∀ (V : Type) (C : EFLConfig V n), C.graph.chromaticNumber = n := by
  sorry

end Erdos19
