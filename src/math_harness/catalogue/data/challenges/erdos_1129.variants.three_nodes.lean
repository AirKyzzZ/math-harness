import Mathlib

namespace Erdos1129

def IsNodeSet {n : ℕ} (x : Fin n → ℝ) : Prop :=
  StrictMono x ∧ ∀ i, x i ∈ Set.Icc (-1 : ℝ) 1

noncomputable def lebesgueFunction {n : ℕ} (x : Fin n → ℝ) (t : ℝ) : ℝ :=
  ∑ k, |(Lagrange.basis Finset.univ x k).eval t|

theorem lebesgueFunction_eq {n : ℕ} (x : Fin n → ℝ) (t : ℝ) :
    lebesgueFunction x t = ∑ k, |∏ i ∈ Finset.univ.erase k, (t - x i) / (x k - x i)| := by
  simp only [lebesgueFunction, Lagrange.basis, Lagrange.basisDivisor, Polynomial.eval_prod,
    Polynomial.eval_mul, Polynomial.eval_C, Polynomial.eval_sub, Polynomial.eval_X]
  refine Finset.sum_congr rfl fun k _ => ?_
  congr 1
  refine Finset.prod_congr rfl fun i _ => ?_
  rw [div_eq_inv_mul]

noncomputable def lebesgueConstant {n : ℕ} (x : Fin n → ℝ) : ℝ :=
  sSup (lebesgueFunction x '' Set.Icc (-1 : ℝ) 1)

noncomputable def extendedNodes {n : ℕ} (x : Fin n → ℝ) (i : ℕ) : ℝ :=
  if h : 1 ≤ i ∧ i ≤ n then x ⟨i - 1, by omega⟩ else if i = 0 then -1 else 1

noncomputable def gapMax {n : ℕ} (x : Fin n → ℝ) (i : ℕ) : ℝ :=
  sSup (lebesgueFunction x '' Set.Icc (extendedNodes x i) (extendedNodes x (i + 1)))

def IsCanonical {n : ℕ} (x : Fin n → ℝ) : Prop :=
  IsNodeSet x ∧ (-1 : ℝ) ∈ Set.range x ∧ (1 : ℝ) ∈ Set.range x

def IsMinimiser {n : ℕ} (x : Fin n → ℝ) : Prop :=
  IsNodeSet x ∧ ∀ y : Fin n → ℝ, IsNodeSet y → lebesgueConstant x ≤ lebesgueConstant y

def Equioscillates {n : ℕ} (x : Fin n → ℝ) : Prop :=
  ∀ i ∈ Finset.Icc 1 (n - 1), ∀ j ∈ Finset.Icc 1 (n - 1), gapMax x i = gapMax x j

def IsChebyshevNodes {n : ℕ} (x : Fin n → ℝ) : Prop :=
  IsNodeSet x ∧ ∀ j, (Polynomial.Chebyshev.T ℝ (n : ℤ)).eval (x j) = 0

def erdos_1129.answer (n : ℕ) : Set (Fin n → ℝ) :=
  {x | IsNodeSet x ∧ Equioscillates x ∧
    lebesgueFunction x (-1) ≤ gapMax x 1 ∧ lebesgueFunction x 1 ≤ gapMax x 1}

theorem erdos_1129.variants.three_nodes :
    {x : Fin 3 → ℝ | IsCanonical x ∧ IsMinimiser x} = ({![(-1 : ℝ), 0, 1]} : Set (Fin 3 → ℝ)) ∧ lebesgueConstant (![(-1 : ℝ), 0, 1] : Fin 3 → ℝ) = 5 / 4 := by
  sorry

end Erdos1129
