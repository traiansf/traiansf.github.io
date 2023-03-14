From Coq Require Import Logic.FunctionalExtensionality List Program Bool.
Import ListNotations.
Section Category.

Reserved Infix "~>" (at level 90, right associativity).
Reserved Infix "<<" (at level 40, left associativity).
Reserved Infix ">>" (at level 40, left associativity).

Class Category FTrue (Tarr : FTrue -> FTrue -> Type) (Tid : forall a, Tarr a a) (Tcomp : forall a b c, Tarr b c -> Tarr a b -> Tarr a c) :=
    { arrow (a : FTrue) (b : FTrue) : Type := Tarr a b where "a ~> b" := (arrow a b)
    ; id (a : FTrue) : a ~> a := Tid a
    ; comp {a b c} (g : b ~> c) (f : a ~> b) : a ~> c := Tcomp a b c g f where "f >> g" := (comp g f)
    ; comp_id_left a b (f : a ~> b) : f >> id b = f
    ; comp_id_right a b (f : a ~> b) : id a >> f = f
    ; comp_assoc a b c d (f : a ~> b) (g : b ~> c) (h : c ~> d) : f >> g >> h = f >> (g >> h)
    }.

(** Show that Coq's type system can be structured as a a category. *)

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

(** A type transformation @FFalse : Type -> Type@ induces a subcategory of
Coq's type system having as objects @FFalse a@ for each type @a@ and as morphisms
the regular morphisms between them. It's easy to check that composition of
such morphisms in the base @Type@ category are also morphisms in @FFalse Type@, and
that the corresponding identities are also mofphisms in @FFalse Type@.

We say that @FFalse@, together with a transformation @fmap@ translating
morphisms @a -> b@ in @Type@ to morphisms @FFalse a -> FFalse b@ in @FFalse Type@ defines a
_functor_ from @Type@ to @FFalse Type@ if @fmap@ obeys the functor laws:
- translates identities to identities
- commutes with composition
*)

Class Functor
    {C D}
    `{cat_c : Category C}
    `{cat_d : Category D}
    (FFalse : C -> D)
    (Fmap : forall a b, (a ~> b) -> FFalse a ~> FFalse b)
    :=
    { fmap : forall {a b}, (a ~> b) -> FFalse a ~> FFalse b := Fmap
    ; fmap_id : forall a, fmap (id a) = id (FFalse a)
    ; fmap_comp : forall a b c (f : a ~> b) (g : b ~> c),
        fmap (f >> g) = fmap f >> fmap g
    }.

Class Monad
  {C : Type } `{cat_c : Category C}
  (FFalse : C -> C) (Fmap : forall a b, (a ~> b) -> FFalse a ~> FFalse b) `{!Functor FFalse Fmap}
  (Mret : forall a, a ~> FFalse a) (Mbind : forall a b, (a ~> FFalse b) -> FFalse a ~> FFalse b)
  :=
{
  ret {a} : a ~> FFalse a := @Mret a ;
  bind {a b} : (a ~> FFalse b) -> FFalse a ~> FFalse b := @Mbind a b;
  kleisli_comp {a b c} (kg : b ~> FFalse c) (kf : a ~> FFalse b) : a ~> FFalse c := kf >> bind kg ;
  kleisli_category : Category C (fun a b => a ~> FFalse b) (@ret) (@kleisli_comp)
}.


Notation "g <=< f" := (kleisli_comp g f) (at level 40, left associativity).
Notation "f >=> g" := (kleisli_comp g f) (at level 40, left associativity).


Section FAlgebra.

Context
    {C : Type}
    `{Category C}
    (FFalse : C -> C)
    (Fmap : forall a b, (a ~> b) -> FFalse a ~> FFalse b)
    `{!Functor FFalse Fmap}
    .

Definition FAlgebra (x : C) : Type := FFalse x ~> x. 

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
    (FFalse : C -> C)
    (Fmap : forall a b, (a ~> b) -> FFalse a ~> FFalse b)
    `{!Functor FFalse Fmap}
    .

Definition FCoAlgebra (x : C) : Type := x ~> FFalse x. 

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
    (FFalse : Type -> Type)
    (Fmap : forall a b, (a ~> b) -> FFalse a ~> FFalse b)
    `{!Functor FFalse Fmap}
    .

Definition Fix : Type := forall (x : Type) (alg :FAlgebra FFalse x), x.

Definition fold {a : Type} (alg : FAlgebra FFalse a) (term : Fix) : a := term a alg.

Definition WeakInitialAlgebra
  {a} (initial : FAlgebra FFalse a) (f : forall b (alg : FAlgebra FFalse b), a -> b) : Prop :=
  forall b (alg : FAlgebra FFalse b), FMorphism FFalse Fmap (f b alg) initial alg.

Definition weakInitialAlgebra : FAlgebra FFalse Fix.
Proof.
    intros s.
    intros a alg.
    exact (alg (fmap (fold alg) s)).
Defined.

Lemma weakInitialMorphism : WeakInitialAlgebra weakInitialAlgebra (@fold).
Proof. intros a alg; reflexivity. Qed.

End Fix.

Section CoFixedPoint.

Existing Instance coq_category.

Context
    (FFalse : Type -> Type)
    (Fmap : forall a b, (a ~> b) -> FFalse a ~> FFalse b)
    `{!Functor FFalse Fmap}
    .

Notation "'CoFix' FFalse" := ({ x : Type & prod (x -> FFalse x) x}) (at level 90).

Definition unfold {a : Type} (coalg : a -> FFalse a) (x : a) :  CoFix FFalse := existT _ a (coalg, x).

Definition WeakFinalCoAlgebra {a} (final : FCoAlgebra FFalse a) : Prop :=
  forall b (alg : FCoAlgebra FFalse b), exists f : b -> a, FCoMorphism FFalse Fmap f alg final.

Definition weakFinalCoAlgebra : FCoAlgebra FFalse (CoFix FFalse).
Proof.
    intros (a, (coalg_a, x)).
    exact (fmap (unfold coalg_a) (coalg_a x)).
Defined.

Lemma weakFinalCoAlgebraMorphism : WeakFinalCoAlgebra weakFinalCoAlgebra.
Proof.
  intros a coalg.
  exists (unfold coalg).
  reflexivity.
Qed.

End CoFixedPoint.

Notation "'CoFix' FFalse" := ({ x : Type & prod (x -> FFalse x) x}) (at level 90).

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
    unfold FMorphism in Hinit; cbn in Hinit;
    [apply equal_f with (FTrue a) in Hinit | apply equal_f with (FFalse a) in Hinit]; cbn in Hinit;
    unfold comp, coq_comp in Hinit;
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
  foldr {a b} : b -> (a -> b -> b) -> L a -> b ;
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
  split; intros;
    specialize (Hinit a b c (fun bf : FPair a b c => match bf with | MkFPair _ _ _ x0 y0 => f0 x0 y0 end));
    unfold FMorphism, comp, coq_comp in Hinit; cbn in Hinit.
  - apply equal_f with  (MkFPair a b (p a b) x y) in Hinit.
    assumption.
Qed.

Definition listAlgebra : forall elt, FAlgebra (FList elt) (list elt)
    := fun elt t =>
        match t with
        | FNil _ _ => []
        | FCons _ _ e l => e :: l
        end.

Definition List2list : List -> list elt := fold FList listAlgebra.

Definition list2List (l : list elt) : List.
Proof.
    intros a alg.
    induction l.
    - exact (alg (FNil _)).
    - exact (alg (FCons _ a0 IHl)).
Defined.
(*
:=
    fun a alg =>
        alg (match n with
            | 0 => FZero _
            | S n => FSucc _ (nat2Nat n a alg)
            end).
*)            

Lemma list2List2list : list2List >> List2list = id (list elt).
Proof.
    apply functional_extensionality_dep_good.
    intro l.
    induction l; simpl; [reflexivity|].
    rewrite <- IHl at 2.
    reflexivity.
Qed.

Definition listFold {a} (alg : FAlgebra FList a) : list elt -> a := list2List >> fold FList alg.

Definition FStream : Type := CoFix FList.

CoInductive stream : Type :=
| SNil : stream
| SCons : elt -> stream -> stream.

Definition streamCoAlgebra : FCoAlgebra FList stream
    := fun t =>
        match t with
        | SNil => FNil _
        | SCons e s => FCons _ e s
        end.

Definition stream2List : stream -> FStream := unfold FList streamCoAlgebra.

CoFixpoint List2stream (s : FStream) : stream.
Proof.
    destruct s as (a, coalg, x).
    destruct (coalg x) eqn:co.
    - exact SNil.
    - exact (SCons e (List2stream (existT2 _ _ a coalg a0))).
Defined.

End FList.

Section SortedSets.

Context
    (sorts : Type)                               (* "set" of all sorts *)
    .

Definition sortedSet : Type := sorts -> Type.

End SortedSets.

Section SortedSetsCategory.

Context
    {S : Type}.

Definition sorted_arrow
    (A : sortedSet S)
    (B : sortedSet S)
    : Type
    := forall (s : S), A s -> B s. 

Definition sorted_id
    (A : sortedSet S)
    : sorted_arrow A A
    := fun (s : S) => coq_id (A s).

Definition sorted_comp
    {A B C}
    (g : sorted_arrow B C)
    (f : sorted_arrow A B)
    : sorted_arrow A C
    := fun (s : S) => coq_comp (g s) (f s).

Lemma sorted_comp_id_left a b (f : sorted_arrow a b) : sorted_comp (sorted_id b) f = f.
Proof. reflexivity. Qed.

Lemma sorted_comp_id_right a b (f : sorted_arrow a b) : sorted_comp f (sorted_id a) = f.
Proof. reflexivity. Qed.

Lemma sorted_comp_assoc a b c d (f : sorted_arrow a b) (g : sorted_arrow b c) (h : sorted_arrow c d)
    : sorted_comp h (sorted_comp g f) = sorted_comp (sorted_comp h g) f.
Proof. reflexivity. Qed.

Definition sorted_category : Category (sortedSet S) :=
    {| arrow := sorted_arrow
    ; id := sorted_id
    ; comp := @sorted_comp
    ; comp_id_left := sorted_comp_id_left
    ; comp_id_right := sorted_comp_id_right
    ; comp_assoc := sorted_comp_assoc
    |}.

End SortedSetsCategory.

Section SortedFixed.

Context
    {S : Type}
    (S_sorted_category := @sorted_category S).

Existing Instance S_sorted_category.

Context
    (FFalse : sortedSet S -> sortedSet S)
    {fun_F : Functor FFalse}
    {efun_F : EndoFunctor FFalse}
    .

Definition SortedFix := (fun (s : S) => forall (A : S -> Type) (alg : FAlgebra FFalse A) , A s) .

Definition sortedFold {A : sortedSet S} (alg : FAlgebra FFalse A) {s : S} (term : SortedFix s) : A s := term A alg.

(*
Definition weakInitialSortedAlgebra : forall (s : S), FFalse (SortedFix FFalse) s -> (SortedFix FFalse) s.
Proof.
    intros s.
    intros FAs.
    intros A alg.
    pose (folded_alg := sortedFold alg).
    pose (fm := @fmap _ _ _ _ FFalse _). unfold arrow in fm. simpl in fm.
    unfold sorted_arrow in fm.
    specialize (fm (fun s0 : S => forall A : S -> Type, FFalse A ~> A -> A s0) A).
    specialize (fm folded_alg).
Defined.

Lemma weakInitialMorphism
    (a : Type)
    (alg : FAlgebra FFalse a)
    : FMorphism FFalse (fold alg) weakInitialAlgebra alg.
Proof.
    reflexivity.
Qed.
*)

End SortedFixed.

Section ForestF.

Existing Instance sorted_category.

Inductive Sort :=
| STree
| SForest.

Inductive ForestF (elt : Type) (A : Sort -> Type) : Sort -> Type :=
| EmptyT : ForestF elt A STree
| NodeT : elt -> A SForest -> ForestF elt A STree
| NilF : ForestF elt A SForest
| ConsF : A STree -> A SForest -> ForestF elt A SForest.

Definition Forest (elt : Type) : Sort -> Type := SortedFix (ForestF elt).

Definition emptyT (elt : Type) : Forest elt STree
    := fun A alg_A => alg_A STree (EmptyT elt A).

Definition nodeT {elt : Type} (x : elt) (children : Forest elt SForest) : Forest elt STree
    := fun A alg_A => alg_A STree (NodeT _ _ x (children _ alg_A)).

Definition nilF (elt : Type) : Forest elt SForest
    :=  fun A alg_A => alg_A SForest (NilF elt A).

Definition consF {elt : Type} (t : Forest elt STree) (f : Forest elt SForest) : Forest elt SForest
    := fun A alg_A => alg_A SForest (ConsF _ _ (t _ alg_A) (f _ alg_A)).

Definition singletonF (n : nat) : Forest nat STree := nodeT n (nilF _).

Definition forest : Forest nat SForest
    := consF
      (nodeT 1 (consF (singletonF 2) (nilF _)))
      (consF (nodeT 3 (consF (singletonF 4) (consF (singletonF 5) (nilF _)))) (nilF _)).

Definition IntA (s : Sort) : Type :=
    match s with
    | STree => nat
    | SForest => list nat
    end.

Definition alg_IntA : FAlgebra (ForestF nat) IntA.
Proof.
    intros s f.
    dependent destruction f.
    - exact 0.
    - exact (fold_right (fun a b => a + b) n i).
    - exact [].
    - exact (i::i0).
Defined. 

Example ex1 : sortedFold (ForestF nat) alg_IntA forest = [3; 12].
Proof. reflexivity. Qed.

End ForestF.
