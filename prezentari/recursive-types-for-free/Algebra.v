From Coq Require Import Logic.FunctionalExtensionality List Program Bool.
Import ListNotations.
Section Category.

Reserved Infix "~>" (at level 90, right associativity).
Reserved Infix "<<" (at level 40, left associativity).
Reserved Infix ">>" (at level 40, left associativity).

(** * Category theory

  A category consists of A category consists of objects (of a base type <<T>>)
  and [arrow]s that go between them.
  Arrows [comp]ose with the composition being associative [comp_assoc],
  and have [id]entities which act as unit for the composition
  ([comp_id_left] and [comp_id_right]).
*)
Class Category T (Tarr : T -> T -> Type) (Tid : forall a, Tarr a a) (Tcomp : forall a b c, Tarr b c -> Tarr a b -> Tarr a c) :=
    { arrow (a : T) (b : T) : Type := Tarr a b where "a ~> b" := (arrow a b)
    ; id (a : T) : a ~> a := Tid a
    ; comp {a b c} (g : b ~> c) (f : a ~> b) : a ~> c := Tcomp a b c g f where "f >> g" := (comp g f)
    ; comp_id_left a b (f : a ~> b) : f >> id b = f
    ; comp_id_right a b (f : a ~> b) : id a >> f = f
    ; comp_assoc a b c d (f : a ~> b) (g : b ~> c) (h : c ~> d) : f >> g >> h = f >> (g >> h)
    }.

(** ** Coq/Haskell type system as a category

Let's show that Coq's type system can be structured as a category.
*)

Definition coq_arrow a b := a -> b.
Definition coq_id a : a -> a := fun (x : a) => x.
Definition coq_comp {a b c} (g : b -> c) (f : a -> b) : a -> c := fun x => g (f x).

Lemma coq_comp_id_left a b (f : a -> b) : coq_comp (coq_id b) f = f.
Proof. reflexivity. Qed.

Lemma coq_comp_id_right a b (f : a -> b) : coq_comp f (coq_id a) = f.
Proof. reflexivity. Qed.

Lemma coq_comp_assoc a b c d (f : a -> b) (g : b -> c) (h : c -> d)
    : coq_comp h (coq_comp g f) = coq_comp (coq_comp h g) f.
Proof. reflexivity. Qed.

Definition coq_category : Category Type coq_arrow coq_id (@coq_comp) :=
{|
  comp_id_left := coq_comp_id_left
; comp_id_right := coq_comp_id_right
; comp_assoc := coq_comp_assoc
|}.

End Category.

Notation "a ~> b" := (arrow a b) (at level 90, right associativity).
Notation "g << f" := (comp g f) (at level 40, left associativity).
Notation "f >> g" := (comp g f) (at level 40, left associativity).

(** ** Mappings between categories: functors

*** Intuition: functors induced by type constructors (like in Haskell)

A type transformation <<F : Type -> Type>> induces a subcategory of
Coq's type system having as objects <<F a>> for each type <<a>> and as morphisms
the regular morphisms between them. It's easy to check that composition of
such morphisms in the base <<Type>> category are also morphisms in <<F Type>>, and
that the corresponding identities are also mofphisms in <<F Type>>.

We say that <<F>>, together with a transformation <<fmap>> translating
morphisms <<a -> b>> in <<Type>> to morphisms <<F a -> F b>> in <<F Type>> defines a
_functor_ from <<Type>> to <<F Type>> if <<fmap>> obeys the functor laws:

- translates identities into identities
- commutes with composition.

*** Functors --- an abstract definition

Below we give the more abstract definition of a <<Functor>> between two
categories.
*)

Class Functor
    {C D}
    `{cat_c : Category C}
    `{cat_d : Category D}
    (F : C -> D)
    (Fmap : forall a b, (a ~> b) -> F a ~> F b)
    :=
    { fmap : forall {a b}, (a ~> b) -> F a ~> F b := Fmap
    ; fmap_id : forall a, fmap (id a) = id (F a)
    ; fmap_comp : forall a b c (f : a ~> b) (g : b ~> c),
        fmap (f >> g) = fmap f >> fmap g
    }.

(** ** Monads *)

Class Monad
  {C : Type } `{cat_c : Category C}
  (F : C -> C) (Fmap : forall a b, (a ~> b) -> F a ~> F b) `{!Functor F Fmap}
  (Mret : forall a, a ~> F a) (Mbind : forall a b, (a ~> F b) -> F a ~> F b)
  :=
{
  ret {a} : a ~> F a := @Mret a ;
  bind {a b} : (a ~> F b) -> F a ~> F b := @Mbind a b;
  kleisli_comp {a b c} (kg : b ~> F c) (kf : a ~> F b) : a ~> F c := kf >> bind kg ;
  kleisli_category : Category C (fun a b => a ~> F b) (@ret) (@kleisli_comp)
}.

Notation "g <=< f" := (kleisli_comp g f) (at level 40, left associativity).
Notation "f >=> g" := (kleisli_comp g f) (at level 40, left associativity).

Section FAlgebra.

Context
    {C : Type}
    `{Category C}
    (F : C -> C)
    (Fmap : forall a b, (a ~> b) -> F a ~> F b)
    `{!Functor F Fmap}
    .

Definition FAlgebra (x : C) : Type := F x ~> x. 

Definition FMorphism
    {a b : C}
    (f : a ~> b)
    (alg_a : FAlgebra a)
    (alg_b : FAlgebra b)
    : Prop :=
    alg_a >> f = fmap f >> alg_b.

End FAlgebra.

Section CoAlgebra.

Context
    {C}
    `{Category C}
    (F : C -> C)
    (Fmap : forall a b, (a ~> b) -> F a ~> F b)
    `{!Functor F Fmap}
    .

Definition FCoAlgebra (x : C) : Type := x ~> F x. 

Definition FCoMorphism
    {a b : C}
    (f : a ~> b)
    (coalg_a : FCoAlgebra a)
    (coalg_b : FCoAlgebra b)
    : Prop :=
    coalg_a >> fmap f = f >> coalg_b.

End CoAlgebra.

Section Fix.

Existing Instance coq_category.

Context
    (F : Type -> Type)
    (Fmap : forall a b, (a ~> b) -> F a ~> F b)
    `{!Functor F Fmap}
    .

Definition WeakInitialAlgebra
  {a} (initial : FAlgebra F a) (f : forall b (alg : FAlgebra F b), a -> b) : Prop :=
  forall b (alg : FAlgebra F b), FMorphism F Fmap (f b alg) initial alg.

Definition Fix : Type := forall (x : Type) (alg :FAlgebra F x), x.

Definition foldF {a : Type} (alg : FAlgebra F a) (term : Fix) : a := term a alg.

Definition FixAlgebra : FAlgebra F Fix :=
  fun s a alg => (alg (fmap (foldF alg) s)).

Lemma FixAlgebra_initial : WeakInitialAlgebra FixAlgebra (@foldF).
Proof. intros a alg; reflexivity. Qed.

End Fix.

Class Boolean (t : Type) (Btrue : t) (Bfalse : t) (Bbool : forall a, a -> a -> t -> a) : Prop :=
{
  true : t := Btrue ;
  false : t := Bfalse ;
  bool {a} : a -> a -> t -> a := Bbool a ;
  bool_true : forall a (x y : a), @bool a x y true = x ;
  bool_false : forall a (x y : a), @bool a x y false = y ;
}.

Section Boolean_fns.

Context {t : Type} `{Boolean t}.

Definition ite {a} (b : t) (x y : a) := bool x y b.
Definition andb (b1 b2 : t) : t := bool b1 b2 true.
Definition orb (b1 b2 : t) : t := bool b1 true b2.
Definition negb (b : t) : t := bool b false true.

End Boolean_fns.

Section FBool.

Existing Instance coq_category.

Inductive FBool (a : Type) : Type :=
| FTrue : FBool a
| FFalse : FBool a.

Definition fmapFBool {a b} (f : a -> b) (x : FBool a) : FBool b :=
  match x with
  | FTrue _ => FTrue _
  | FFalse _ => FFalse _
  end.

#[export] Instance BoolF_functor : Functor (cat_d := coq_category) FBool (@fmapFBool).
Proof.
  split; intros; extensionality x; destruct x; reflexivity.
Qed.

Definition FBool_Boolean
  {a} (initial : FAlgebra FBool a) (f : forall b (alg : FAlgebra FBool b), a -> b)
  (Hinit : WeakInitialAlgebra FBool (@fmapFBool) initial f)
  : Boolean a (initial (FTrue _)) (initial (FFalse _))
      (fun (t : Type) (x y : t) => 
          f t (fun bf : FBool t => match bf with | FTrue _ => x | FFalse _ => y end)).
Proof.
  split; intros;
    specialize (Hinit a0 (fun bf => match bf with | FTrue _ => x | FFalse _ => y end));
    unfold FMorphism, comp, coq_comp in Hinit; cbn in Hinit;
    [apply equal_f with (FTrue a) in Hinit | apply equal_f with (FFalse a) in Hinit]; cbn in Hinit;
    rewrite <- Hinit;
    f_equal;
    rewrite Hinit;
    extensionality bf;
    destruct bf; reflexivity.
Qed.

Definition BoolAlgebra : FAlgebra FBool Datatypes.bool :=
  fun b => match b with
  | FFalse _ => Datatypes.false
  | FTrue _ => Datatypes.true
  end.

Definition boolF {b} (B : FAlgebra FBool b) : Datatypes.bool -> b :=
  fun b => match b with
  | Datatypes.true => B (FTrue _)
  | Datatypes.false => B (FFalse _)
  end.

Lemma BoolAlgebra_initial : WeakInitialAlgebra FBool (@fmapFBool) BoolAlgebra (@boolF).
Proof.
  intros b B.
  unfold FMorphism.
  extensionality bl; cbn.
  destruct bl; reflexivity.
Qed.

Definition Bool_Boolean : Boolean Datatypes.bool Datatypes.true Datatypes.false (fun a t f b => if b then t else f) := 
  FBool_Boolean BoolAlgebra (@boolF) BoolAlgebra_initial.

Definition CBool : Type := forall a, a -> a -> a.

Definition CBoolAlgebra : FAlgebra FBool CBool :=
  fun b => match b with
  | FFalse _ => fun _ t f => f
  | FTrue _ => fun _ t f => t
  end.

Definition CboolF {b} (B : FAlgebra FBool b) : CBool -> b :=
  fun f => f b (B (FTrue _)) (B (FFalse _)).

Lemma CBoolAlgebra_initial : WeakInitialAlgebra FBool (@fmapFBool) CBoolAlgebra (@CboolF).
Proof.
  intros b B.
  unfold FMorphism.
  extensionality bl; cbn.
  destruct bl; reflexivity.
Qed.

Definition CBool_Boolean : Boolean CBool (fun a t f => t) (fun a t f => f) (fun a t f b => b a t f) :=
  FBool_Boolean CBoolAlgebra (@CboolF) CBoolAlgebra_initial.

End FBool.

Class Optional (m : Type -> Type)
  (Onothing : forall a, m a) (Ojust : forall a, a -> m a) (Omaybe : forall a b, b -> (a -> b) -> m a -> b)
  : Prop :=
{
  nothing {a} : m a := Onothing a ;
  just {a} : a -> m a := Ojust a ;
  maybe {a b} : b -> (a -> b) -> m a -> b := Omaybe a b ;
  maybe_nothing : forall a b n j, @maybe a b n j nothing = n ;
  maybe_just : forall a b n j x, @maybe a b n j (just x) = j x ;
}.

Section Optional_fns.

Context {m : Type -> Type} {b : Type} `{Optional m} `{Boolean b} .

Definition isNothing {a} : m a -> b := maybe true (const false).
Definition isJust {a} : m a -> b := maybe false (const true).

Definition mapMaybe {a b} (f : a -> b) (ma : m a) : m b :=
  maybe nothing (coq_comp just f) ma.
  
Definition bindMaybe {a b} (ma : m a) (f : a -> m b) : m b :=
  maybe nothing f ma.

End Optional_fns.

Section FMaybe.

Existing Instance coq_category.

Inductive FMaybe (a maybe : Type) : Type :=
| FNothing : FMaybe a maybe
| FJust : a -> FMaybe a maybe.

Definition fmapFMaybe {a ma mb} (f : ma -> mb) (x : FMaybe a ma) : FMaybe a mb :=
  match x with
  | FNothing _ _ => FNothing _ _
  | FJust _ _ a => FJust _ _ a
  end.

#[export] Instance FMaybe_functor : forall a, Functor (FMaybe a) (@fmapFMaybe a).
Proof.
  intros; split; intros; extensionality x; destruct x; reflexivity.
Qed.

Definition FMaybe_Optional
  {m : Type -> Type}
  (initial : forall a, FAlgebra (FMaybe a) (m a))
  (f : forall a b (alg : FAlgebra (FMaybe a) b), m a -> b)
  (Hinit : forall a, WeakInitialAlgebra (FMaybe a) (@fmapFMaybe a) (initial a) (f a))
  : Optional m (fun a => initial a (FNothing _ _)) (fun a x => initial a (FJust _ _ x))
      (fun a (t : Type) (n : t) (j : a -> t) => 
          f a t (fun bf : FMaybe a t => match bf with | FNothing _ _ => n | FJust _ _ x => j x end)).
Proof.
  split; intros;
    specialize (Hinit a b (fun bf : FMaybe a b => match bf with | FNothing _ _ => n | FJust _ _ x => j x end));
    unfold FMorphism, comp, coq_comp in Hinit; cbn in Hinit;
    [apply equal_f with (FNothing a (m a)) in Hinit | apply equal_f with (FJust a (m a) x) in Hinit];
    assumption.
Qed.

Definition MaybeAlgebra : forall a, FAlgebra (FMaybe a) (option a) :=
  fun a b => match b with
  | FNothing _ _ => None
  | FJust _ _ x => Some x
  end.

Definition maybeF {a b} (B : FAlgebra (FMaybe a) b) : option a -> b :=
  fun ma => match ma with
  | None => B (FNothing _ _)
  | Some x => B (FJust _ _ x)
  end.

Lemma MaybeAlgebra_initial : forall a, WeakInitialAlgebra (FMaybe a) (@fmapFMaybe a) (MaybeAlgebra a) (@maybeF a).
Proof.
  intros a b B.
  unfold FMorphism.
  extensionality bl; cbn.
  destruct bl; reflexivity.
Qed.

Definition Maybe_Optional : Optional option (@None) (@Some)
  (fun a t n j m => match m with None => n | Some x => j x end) := 
  FMaybe_Optional MaybeAlgebra (@maybeF) MaybeAlgebra_initial.

Definition CMaybe (m : Type) : Type := forall a, a -> (m -> a) -> a.

Definition CMaybeAlgebra (m : Type) : FAlgebra (FMaybe m) (CMaybe m) :=
  fun m => match m with
  | FNothing _ _ => fun _ n j => n
  | FJust _ _ x => fun _ n j => j x
  end.

Definition CmaybeF {m b} (B : FAlgebra (FMaybe m) b) : CMaybe m -> b :=
  fun f => f b (B (FNothing _ _)) (fun m => B (FJust _ _ m)).

Lemma CMaybeAlgebra_initial m : WeakInitialAlgebra (FMaybe m) (@fmapFMaybe m) (CMaybeAlgebra m) (@CmaybeF m).
Proof.
  intros b B.
  unfold FMorphism.
  extensionality bl; cbn.
  destruct bl; reflexivity.
Qed.

Definition CMaybe_Optional : Optional CMaybe
  (fun m => fun a n j => n) (fun m x => fun a n j => j x) (fun m a n j x => x a n j) :=
  FMaybe_Optional CMaybeAlgebra (@CmaybeF) CMaybeAlgebra_initial.

End FMaybe.

Class Natural (T : Type) (Tzero : T) (Tsucc : T -> T) (Titerate : forall a, a -> (a -> a) -> T -> a) : Prop :=
{
  zero : T := Tzero ;
  succ : T -> T := Tsucc ;
  iterate {a} : a -> (a -> a) -> T -> a := Titerate a ;
  iterate_zero : forall a z s, @iterate a z s zero = z ;
  iterate_succ : forall a z s n, @iterate a z s (succ n) = s (@iterate a z s n) ;
}.

Section Natural_fns.

Context {T} `{Natural T} {B} `{Boolean B} {M} `{Optional M}.

Definition one : T := succ zero.
Definition isZero : T -> B := iterate true (const false).
Definition add (m : T) : T -> T := iterate m succ.
Definition mul (m : T) : T -> T := iterate zero (add m).
Definition exp (m : T) : T -> T := iterate one (mul m).
Definition pred : T -> M T := iterate nothing (coq_comp just (maybe zero succ)).
Definition sub (m : T) : T -> M T := iterate (just m) (flip bindMaybe pred).
Definition lte (m n : T) : B := maybe true (const false) (sub m n).
Definition gte : T -> T -> B := flip lte.
Definition equal (m n : T) : B := andb (lte m n) (gte m n).
Definition gt (m n : T) : B := negb (lte m n).
Definition lt : T -> T -> B := flip gt.
Definition max (m n : T) : T := ite (lte m n) n m.

End Natural_fns.

Section FNat.

Existing Instance coq_category.

Inductive FNat (a : Type) : Type :=
    | FZero : FNat a
    | FSucc : a -> FNat a.

Definition fmapFNat {a b} (f : a -> b) (n : FNat a) : FNat b :=
    match n with
    | FZero _ => FZero _
    | FSucc _ n' => FSucc _ (f n')
    end.

#[export] Instance FNat_functor : Functor FNat (@fmapFNat).
Proof.
  split; intros; extensionality x; destruct x; reflexivity.
Qed.

Definition FNat_Natural
  {a} (initial : FAlgebra FNat a) (f : forall b (alg : FAlgebra FNat b), a -> b)
  (Hinit : WeakInitialAlgebra FNat (@fmapFNat) initial f)
  (iter : forall b, b -> (b -> b) -> a -> b)
  (Hiter : iter = (fun (t : Type) (z: t) (s : t -> t) => 
    f t (fun bf : FNat t => match bf with | FZero _ => z | FSucc _ n => s n end)))
  : Natural a (initial (FZero _)) (fun x => initial (FSucc _ x)) iter.
Proof.
  split; intros; subst iter;
    specialize (Hinit a0 (fun bf : FNat a0 => match bf with | FZero _ => z | FSucc _ n => s n end));
    unfold FMorphism, comp, coq_comp in Hinit; cbn in Hinit.
    - apply equal_f with (FZero a) in Hinit; assumption.
    - apply equal_f with (FSucc a n) in Hinit; assumption.
Qed.

Definition NatAlgebra : FAlgebra FNat nat :=
  fun b => match b with
  | FZero _ => 0
  | FSucc _ n => S n
  end.

Fixpoint natF {b} (B : FAlgebra FNat b) (n : nat) : b :=
  match n with
  | 0 => B (FZero _)
  | S n => B (FSucc _ (natF B n))
  end.

Lemma NatAlgebra_initial : WeakInitialAlgebra FNat (@fmapFNat) NatAlgebra (@natF).
Proof.
  intros b B.
  unfold FMorphism.
  extensionality bl; cbn.
  destruct bl; reflexivity.
Qed.

Fixpoint nat_iterate {a} (z : a) (s : a -> a) (n : nat) :=
  match n with
  | 0 => z
  | S n => s (nat_iterate z s n)
  end.

Program Definition Nat_Natural : Natural nat 0 S (@nat_iterate) :=
  FNat_Natural NatAlgebra (@natF) NatAlgebra_initial (@nat_iterate) _.
Next Obligation.
  extensionality t; extensionality z; extensionality s; extensionality n.
  induction n; [reflexivity |].
  cbn; rewrite IHn; reflexivity.
Qed.

Definition CNat : Type := forall a, a -> (a -> a) -> a.

Definition CNatAlgebra : FAlgebra FNat CNat :=
  fun b => match b with
  | FZero _ => fun _ z s => z
  | FSucc _ n => fun a z s => s (n a z s)
  end.

Definition CnatF {b} (B : FAlgebra FNat b) : CNat -> b :=
  fun f => f b (B (FZero _)) (fun n => B (FSucc _ n)).

Lemma CNatAlgebra_initial : WeakInitialAlgebra FNat (@fmapFNat) CNatAlgebra (@CnatF).
Proof.
  intros b B.
  unfold FMorphism.
  extensionality bl; cbn.
  destruct bl; reflexivity.
Qed.

Definition CNat_Natural : Natural CNat (fun a z s => z) (fun n a z s => s (n a z s)) (fun a z s n => n a z s) :=
  FNat_Natural CNatAlgebra (@CnatF) CNatAlgebra_initial (fun a z s n => n a z s) eq_refl.

End FNat.

Class Pair (p : Type -> Type -> Type)
  (Ppair : forall a b, a -> b -> p a b)
  (Punpair : forall a b c, (a -> b -> c) -> p a b -> c) :=
{
  pair {a b} : a -> b -> p a b := Ppair a b;
  unpair {a b c} :(a -> b -> c) -> p a b -> c := Punpair a b c;
  unpair_pair : forall a b c x y f, @unpair a b c f (@pair a b x y) = f x y ;
}.

Section Pair_fns.

Context {P} `{Pair P}.

Definition fst {a b} : P a b -> a := unpair (fun x y => x).
Definition snd {a b} : P a b -> b := unpair (fun x y => y).

End Pair_fns.

Section FPair.

Existing Instance coq_category.

Inductive FPair (a b p : Type) : Type :=
| MkFPair : a -> b -> FPair a b p.

Definition fmapFPair {a b p q} (f : p -> q) (x : FPair a b p) : FPair a b q :=
  match x with
  | MkFPair _ _ _ x y => MkFPair _ _ _ x y
  end.

#[export] Instance FPair_functor : forall a b, Functor (cat_d := coq_category) (FPair a b) (@fmapFPair a b).
Proof.
  split; intros; extensionality x; destruct x; reflexivity.
Qed.

Definition FPair_Pair
  {p}
  (initial : forall a b, FAlgebra (FPair a b) (p a b))
  (f : forall a b, forall q (alg : FAlgebra (FPair a b) q), p a b -> q)
  (Hinit : forall a b, WeakInitialAlgebra (FPair a b) (@fmapFPair a b) (initial a b) (f a b))
  : Pair p (fun a b x y => initial a b (MkFPair _ _ _ x y))
      (fun a b c agg => 
          f a b c (fun bf : FPair a b c => match bf with | MkFPair _ _ _ x y => agg x y end)).
Proof.
  split; intros;
    specialize (Hinit a b c (fun bf : FPair a b c => match bf with | MkFPair _ _ _ x0 y0 => f0 x0 y0 end));
    unfold FMorphism, comp, coq_comp in Hinit; cbn in Hinit.
  - apply equal_f with  (MkFPair a b (p a b) x y) in Hinit.
    assumption.
Qed.

Definition PairAlgebra : forall a b, FAlgebra (FPair a b) (prod a b) :=
  fun a b p => match p with
  MkFPair _ _ _ x y => (x, y)
  end.

Definition pairF {a b c} (B : FAlgebra (FPair a b) c) : prod a b -> c :=
  fun b => match b with
  | (x, y) => B (MkFPair _ _ _ x y)
  end.

Lemma PairAlgebra_initial : forall a b, WeakInitialAlgebra (FPair a b) (@fmapFPair a b) (PairAlgebra a b) (@pairF a b).
Proof.
  intros a b c B.
  unfold FMorphism.
  extensionality bl; cbn.
  destruct bl; reflexivity.
Qed.

Definition Pair_Pair : Pair prod
  (fun a b x y => (x, y)) (fun a b c f p => match p with (x, y) => f x y end) := 
  FPair_Pair PairAlgebra (@pairF) PairAlgebra_initial.

Definition CPair (a b : Type) : Type := forall c, (a -> b -> c) -> c.

Definition CPairAlgebra : forall a b, FAlgebra (FPair a b) (CPair a b) :=
  fun a b p => match p with
  | MkFPair _ _ _ x y => fun _ f => f x y
  end.

Definition CpairF {a b c} (B : FAlgebra (FPair a b) c) : CPair a b -> c :=
  fun p => p c (fun x y => B (MkFPair _ _ _ x y)).

Lemma CPairAlgebra_initial : forall a b, WeakInitialAlgebra (FPair a b) (@fmapFPair a b) (CPairAlgebra a b) (@CpairF a b).
Proof.
  intros a b c B.
  unfold FMorphism.
  extensionality bl; cbn.
  destruct bl; reflexivity.
Qed.

Definition CPair_Pair : Pair CPair (fun a b x y => fun c f => f x y) (fun a b c f p => p c f) :=
  FPair_Pair CPairAlgebra (@CpairF) CPairAlgebra_initial.

End FPair.

Class List (L : Type -> Type)
  (Lnil : forall a, L a) (Lcons : forall a, a -> L a -> L a) (Lfoldr : forall a b, b -> (a -> b -> b) -> L a -> b) :=
{
  nil {a} : L a := Lnil a ;
  cons {a} : a -> L a -> L a := Lcons a ;
  foldr {a b} : b -> (a -> b -> b) -> L a -> b := Lfoldr a b ;
  foldr_nil : forall a b n c, @foldr a b n c nil = n ; 
  foldr_cons : forall a b n c x l, @foldr a b n c (cons x l) = c x (foldr n c l); 
}.

Section List_fns.

Context B `{Boolean B} N `{Natural N} P `{Pair P} L `{List L} M `{Optional M}.

Definition null {a} : L a -> B := foldr true (const (const false)).
Definition app {a} (l1 l2 : L a) : L a := foldr l2 cons l1.
Definition map {a b} (f : a -> b) : L a -> L b :=
  foldr nil (coq_comp cons f).
Definition filter {a} (f : a -> B) : L a -> L a :=
  foldr nil (fun a l => bool (cons a l) l (f a)).
Definition uncons {a} : L a -> M (P a (L a)) :=
  foldr nothing (fun a => coq_comp (coq_comp just (pair a)) (maybe nil (unpair cons))).
Definition head {a} : L a -> M a := coq_comp (mapMaybe fst) uncons.
Definition tail {a} : L a -> M (L a) := coq_comp (mapMaybe snd) uncons.
Definition length {a} : L a -> N := foldr zero (const succ).
Definition foldl {a b} (n : b) (c : b -> a -> b) (l : L a) : b :=
  foldr Datatypes.id (fun a f acc => f (c acc a)) l n.
Definition reverse {a} : L a -> L a := foldl nil (flip cons).

Definition natToList : N -> L N :=
  iterate nil (fun l => maybe (cons one nil) (fun k => cons (succ k) l) (head l)).

Definition sum : L N -> N := foldr zero add.
Definition product : L N -> N := foldr one mul.
Definition maximum : L N -> N := foldr zero max.

Definition factorial : N -> N := coq_comp product natToList.

End List_fns.

Section FList.

Inductive FList (elt a : Type) : Type :=
| FNil : FList elt a
| FCons : elt -> a -> FList elt a.

Definition fmapFList {elt a b} (f : a -> b) (n : FList elt a) : FList elt b :=
  match n with
  | FNil _ _ => FNil _ _
  | FCons _ _ e l => FCons _ _ e (f l)
  end.

Existing Instance coq_category.
#[export] Instance FList_functor : forall elt, Functor (FList elt) (@fmapFList elt).
Proof.
  split; intros; extensionality x; destruct x; reflexivity.
Qed.

Definition FList_List
  {L}
  (initial : forall a, FAlgebra (FList a) (L a))
  (f : forall a, forall q (alg : FAlgebra (FList a) q), L a -> q)
  (Hinit : forall a, WeakInitialAlgebra (FList a) (@fmapFList a) (initial a) (f a))
  (fold : forall a b, b -> (a -> b -> b) -> L a -> b)
  (Hiter : fold = (fun (a b : Type) (n : b) (c : a -> b -> b) => 
    f a b (fun bf : FList a b => match bf with | FNil _ _ => n | FCons _ _ x l => c x l end)))
  : List L (fun a => initial a (FNil _ _)) (fun a x l => initial a (FCons _ _ x l)) fold.
Proof.
  split; intros; subst;
    specialize (Hinit a b (fun bf : FList a b => match bf with | FNil _ _ => n | FCons _ _ x l => c x l end));
    unfold FMorphism, comp, coq_comp in Hinit; cbn in Hinit.
  - apply equal_f with (FNil a (L a)) in Hinit.
    assumption.
  - apply equal_f with (FCons a (L a) x l) in Hinit.
    assumption.
Qed.

Definition ListAlgebra : forall elt, FAlgebra (FList elt) (list elt) :=
  fun elt t =>
    match t with
    | FNil _ _ => []
    | FCons _ _ e l => e :: l
    end.

Fixpoint listF {elt b} (B : FAlgebra (FList elt) b) (l : list elt) : b :=
  match l with
  | [] => B (FNil _ _)
  | e :: l => B (FCons _ _ e (listF B l))
  end.

Lemma ListAlgebra_initial : forall elt, WeakInitialAlgebra (FList elt) (@fmapFList elt) (ListAlgebra elt) (@listF elt).
Proof.
  intros elt b B.
  unfold FMorphism.
  extensionality bl; cbn.
  destruct bl; reflexivity.
Qed.

Definition list_foldr {elt a} : a -> (elt -> a -> a) -> list elt -> a :=
  flip (@fold_right a elt).

Program Definition List_List
  : List list (@Datatypes.nil) (@Datatypes.cons) (@list_foldr) :=
  FList_List ListAlgebra (@listF) ListAlgebra_initial (@list_foldr) _.
Next Obligation.
  extensionality elt; extensionality a; extensionality n; extensionality c.
  extensionality l; induction l; [reflexivity |].
  cbn; rewrite IHl; reflexivity.
Qed.

Definition CList (elt : Type) : Type := forall a, a -> (elt -> a -> a) -> a.

Definition CListAlgebra : forall elt, FAlgebra (FList elt) (CList elt) :=
  fun elt b => match b with
  | FNil _ _ => fun _ n c => n
  | FCons _ _ x l => fun a n c => c x (l a n c)
  end.

Definition ClistF {elt b} (B : FAlgebra (FList elt) b) : CList elt -> b :=
  fun f => f b (B (FNil _ _)) (fun x l => B (FCons _ _ x l)).

Lemma CListAlgebra_initial : forall elt, WeakInitialAlgebra (FList elt) (@fmapFList elt) (CListAlgebra elt) (@ClistF elt).
Proof.
  intros elt b B.
  unfold FMorphism.
  extensionality bl; cbn.
  destruct bl; reflexivity.
Qed.

Definition CList_Natural : List CList (fun a => fun a n c => n) (fun a => fun e l a n c => c e (l a n c)) (fun elt a n c l => l a n c) :=
  FList_List CListAlgebra (@ClistF) CListAlgebra_initial (fun elt a n c l => l a n c) eq_refl.

End FList.

Section CoFixedPoint.

Existing Instance coq_category.

Context
    (F : Type -> Type)
    (Fmap : forall a b, (a ~> b) -> F a ~> F b)
    `{!Functor F Fmap}
    .

Definition WeakFinalCoAlgebra {a} (final : FCoAlgebra F a) : Prop :=
  forall b (alg : FCoAlgebra F b), exists f : b -> a, FCoMorphism F Fmap f alg final.

Notation "'CoFix' F" := ({ x : Type & prod (x -> F x) x}) (at level 90).

Definition unfoldF {a : Type} (coalg : a -> F a) (x : a) :  CoFix F :=
  existT _ a (coalg, x).

Definition CoFixCoAlgebra : FCoAlgebra F (CoFix F) :=
  fun x => match x with
  | existT _ a (coalg_a, x) => fmap (unfoldF coalg_a) (coalg_a x)
  end.

Lemma CoFixCoAlgebra_final : WeakFinalCoAlgebra CoFixCoAlgebra.
Proof.
  intros a coalg.
  exists (unfoldF coalg).
  reflexivity.
Qed.

End CoFixedPoint.

Notation "'CoFix' F" := ({ x : Type & prod (x -> F x) x}) (at level 90).
