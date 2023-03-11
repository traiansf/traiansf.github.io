From Coq Require Import Logic.FunctionalExtensionality List Program.
Import ListNotations.
Section Category.

Reserved Infix "~>" (at level 90, right associativity).
Reserved Infix "<<" (at level 40, left associativity).
Reserved Infix ">>" (at level 40, left associativity).

Class Category T :=
    { arrow (a : T) (b : T) : Type where "a ~> b" := (arrow a b)
    ; id (a : T) : a ~> a
    ; comp {a b c} (g : b ~> c) (f : a ~> b) : a ~> c where "f >> g" := (comp g f)
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

Definition coq_category : Category Type :=
    {| arrow := coq_arrow
    ; id := coq_id
    ; comp := @coq_comp
    ; comp_id_left := coq_comp_id_left
    ; comp_id_right := coq_comp_id_right
    ; comp_assoc := coq_comp_assoc
    |}.

End Category.

Notation "a ~> b" := (arrow a b) (at level 90, right associativity).
Notation "g << f" := (comp g f) (at level 40, left associativity).
Notation "f >> g" := (comp g f) (at level 40, left associativity).

Section Functor.

(** A type transformation @F : Type -> Type@ induces a subcategory of
Coq's type system having as objects @F a@ for each type @a@ and as morphisms
the regular morphisms between them. It's easy to check that composition of
such morphisms in the base @Type@ category are also morphisms in @F Type@, and
that the corresponding identities are also mofphisms in @F Type@.

We say that @F@, together with a transformation @fmap@ translating
morphisms @a -> b@ in @Type@ to morphisms @F a -> F b@ in @F Type@ defines a
_functor_ from @Type@ to @F Type@ if @fmap@ obeys the functor laws:
- translates identities to identities
- commutes with composition
*)

Class Functor
    {C D}
    {cat_c : Category C}
    {cat_d : Category D}
    (F : C -> D)
    :=
    { fmap : forall {a b}, (a ~> b) -> F a ~> F b
    ; fmap_id : forall a, fmap (id a) = id (F a)
    ; fmap_comp : forall a b c (f : a ~> b) (g : b ~> c),
        fmap (f >> g) = fmap f >> fmap g
    }.

Class EndoFunctor {C} {cat_c : Category C} (F : C -> C) {fun_F : Functor F}.

End Functor.

Section FAlgebra.

Context
    {C}
    (F : C -> C)
    `{EndoFunctor C F}
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
    (F : C -> C)
    `{EndoFunctor C F}
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
    {fun_F : Functor F}
    {efun_F : EndoFunctor F}
    .

Definition Fix : Type := forall (x : Type) (alg :FAlgebra F x), x.

Definition fold {a : Type} (alg : FAlgebra F a) (term : Fix) : a := term a alg.

Definition WeakInitialAlgebra {a} (initial : FAlgebra F a) : Prop :=
  forall b (alg : FAlgebra F b), exists f : a -> b, FMorphism F f initial alg.

Definition weakInitialAlgebra : FAlgebra F Fix.
Proof.
    intros s.
    intros a alg.
    exact (alg (fmap (fold alg) s)).
Defined.

Lemma weakInitialMorphism : WeakInitialAlgebra weakInitialAlgebra.
Proof.
  intros a alg.
  exists (fold alg).
  reflexivity.
Qed.

End Fix.

Section CoFixedPoint.

Existing Instance coq_category.

Context
    (F : Type -> Type)
    {fun_F : Functor F}
    {efun_F : EndoFunctor F}
    .

Notation "'CoFix' F" := ({ x : Type & prod (x -> F x) x}) (at level 90).

Definition unfold {a : Type} (coalg : a -> F a) (x : a) :  CoFix F := existT _ a (coalg, x).

Definition WeakFinalCoAlgebra {a} (final : FCoAlgebra F a) : Prop :=
  forall b (alg : FCoAlgebra F b), exists f : b -> a, FCoMorphism F f alg final.

Definition weakFinalCoAlgebra : FCoAlgebra F (CoFix F).
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

Notation "'CoFix' F" := ({ x : Type & prod (x -> F x) x}) (at level 90).

Section BoolF.

Existing Instance coq_category.

Inductive BoolF (a : Type) : Type :=
| T : BoolF a
| F : BoolF a.

Definition fmapBoolF {a b} (f : a -> b) (x : BoolF a) : BoolF b :=
  match x with
  | T _ => T _
  | F _ => F _
  end.

Program Instance boolf_functor : @Functor Type Type _ _ BoolF :=
  { fmap := @fmapBoolF }.
Next Obligation.
    apply functional_extensionality_dep_good.
    destruct x; reflexivity.
Qed.
Next Obligation.
    apply functional_extensionality_dep_good.
    destruct x; reflexivity.
Qed.

Definition Bool := Fix BoolF.

Definition BoolC : FAlgebra BoolF (forall a, a -> a -> a) :=
  fun b => match b with
  | F _ => fun _ t f => f
  | T _ => fun _ t f => t
  end.

Definition foldC {b} (B : FAlgebra BoolF b) : (forall a, a -> a -> a) -> b :=
  fun f => f b (B (T _)) (B (F _)).

Lemma foldC_morphism : forall b (B : FAlgebra BoolF b),
  FMorphism BoolF (foldC B) BoolC B.
Proof.
  intros.
  unfold FMorphism.
  extensionality bl; cbn.
  destruct bl; reflexivity.
Qed.

Definition boolF {a} := fold BoolF (a := a).

Definition trueF : Bool := weakInitialAlgebra BoolF (T _).
Definition trueC {a} : a -> a -> a := BoolC (T _) a.

Lemma trueF_trueC : forall a (A :FAlgebra BoolF a),
  trueF a A = trueC (A (T _)) (A (F _)).
Proof.
  reflexivity.
Qed.

Lemma trueC_trueF : forall a (t f : a),
  trueC t f = trueF a (fun b => match b with | T _ => t | F _ => f end).
Proof.
  reflexivity.
Qed.

Definition falseF : Bool := weakInitialAlgebra BoolF (F _).
Definition falseC {a} (t f : a) := f.

Lemma falseF_falseC : forall a (A :FAlgebra BoolF a),
  falseF a A = falseC (A (T _)) (A (F _)).
Proof.
  reflexivity.
Qed.

Lemma falseC_falseF : forall a (t f : a),
  falseC t f = falseF a (fun b => match b with | T _ => t | F _ => f end).
Proof.
  reflexivity.
Qed.

Definition boolC {a} (t f : a) (b : a -> a -> a) := b t f.



Section NatF.

Existing Instance coq_category.

Inductive NatF (a : Type) : Type :=
    | Zero : NatF a
    | Succ : a -> NatF a.

Definition fmapNatF {a b} (f : a -> b) (n : NatF a) : NatF b :=
    match n with
    | Zero _ => Zero _
    | Succ _ n' => Succ _ (f n')
    end.

Program Instance natf_functor : Functor NatF :=
    { fmap := @fmapNatF }.
Next Obligation.
    apply functional_extensionality_dep_good.
    destruct x; reflexivity.
Qed.
Next Obligation.
    apply functional_extensionality_dep_good.
    destruct x; reflexivity.
Qed.

Definition Nat : Type := Fix NatF.

Definition zero : Nat := weakInitialAlgebra NatF (Zero _).

Definition succ (n : Nat) : Nat := weakInitialAlgebra NatF (Succ _ n).

Definition one : Nat := succ zero.

Definition natEmbed : FAlgebra NatF nat
    := fun t =>
        match t with
        | Zero _ => 0
        | Succ _ n => S n
        end.

Definition Nat2nat : Nat -> nat := fold NatF natEmbed.

Definition natProject : FCoAlgebra NatF nat
    := fun n =>
        match n with
        | 0 => Zero _
        | S n => Succ _ n
        end.

Definition nat2CoNat : nat -> CoFix NatF := unfold NatF natProject. 

Lemma nat_embed_project
    : natProject >> natEmbed = @id Type _ nat.
Proof.
    apply functional_extensionality_dep_good.
    intros [|n]; reflexivity.
Qed.

Lemma nat_project_embed
    : natEmbed >> natProject = @id Type _ (NatF nat).
Proof.
    apply functional_extensionality_dep_good.
    intros [|n]; reflexivity.
Qed.

Definition nat2Nat (n : nat) : Nat.
Proof.
    intros a alg.
    induction n.
    - exact (alg (Zero _)).
    - exact (alg (Succ _ IHn)).
Defined.
(*
:=
    fun a alg =>
        alg (match n with
            | 0 => Zero _
            | S n => Succ _ (nat2Nat n a alg)
            end).
*)            

Lemma nat2Nat2nat : nat2Nat >> Nat2nat = @id Type _ nat.
Proof.
    apply functional_extensionality_dep_good.
    intro n.
    induction n; simpl; [reflexivity|].
    rewrite <- IHn at 2.
    reflexivity.
Qed.

Definition natFold {a} (alg : FAlgebra NatF a) : nat -> a := nat2Nat >> fold NatF alg.

End NatF.

Section ListF.

Context (elt : Type).

Inductive ListF (a : Type) : Type :=
    | Nil : ListF a
    | Cons : elt -> a -> ListF a.

Definition fmapListF {a b} (f : a -> b) (n : ListF a) : ListF b :=
    match n with
    | Nil _ => Nil _
    | Cons _ e l => Cons _ e (f l)
    end.

Existing Instance coq_category.
Program Instance listf_functor : Functor ListF :=
    { fmap := @fmapListF }.
Next Obligation.
    apply functional_extensionality_dep_good.
    destruct x; reflexivity.
Qed.
Next Obligation.
    apply functional_extensionality_dep_good.
    destruct x; reflexivity.
Qed.

Definition List : Type := Fix ListF.

Definition nil : List := weakInitialAlgebra ListF (Nil _).

Definition cons (e : elt) (l : List) : List := weakInitialAlgebra ListF (Cons _ e l).

Definition singleton (e : elt) : List := cons e nil.

Definition listAlgebra : FAlgebra ListF (list elt)
    := fun t =>
        match t with
        | Nil _ => []
        | Cons _ e l => e :: l
        end.

Definition List2list : List -> list elt := fold ListF listAlgebra.

Definition list2List (l : list elt) : List.
Proof.
    intros a alg.
    induction l.
    - exact (alg (Nil _)).
    - exact (alg (Cons _ a0 IHl)).
Defined.
(*
:=
    fun a alg =>
        alg (match n with
            | 0 => Zero _
            | S n => Succ _ (nat2Nat n a alg)
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

Definition listFold {a} (alg : FAlgebra ListF a) : list elt -> a := list2List >> fold ListF alg.

Definition FStream : Type := CoFix ListF.

CoInductive stream : Type :=
| SNil : stream
| SCons : elt -> stream -> stream.

Definition streamCoAlgebra : FCoAlgebra ListF stream
    := fun t =>
        match t with
        | SNil => Nil _
        | SCons e s => Cons _ e s
        end.

Definition stream2List : stream -> FStream := unfold ListF streamCoAlgebra.

CoFixpoint List2stream (s : FStream) : stream.
Proof.
    destruct s as (a, coalg, x).
    destruct (coalg x) eqn:co.
    - exact SNil.
    - exact (SCons e (List2stream (existT2 _ _ a coalg a0))).
Defined.

End ListF.

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
    (F : sortedSet S -> sortedSet S)
    {fun_F : Functor F}
    {efun_F : EndoFunctor F}
    .

Definition SortedFix := (fun (s : S) => forall (A : S -> Type) (alg : FAlgebra F A) , A s) .

Definition sortedFold {A : sortedSet S} (alg : FAlgebra F A) {s : S} (term : SortedFix s) : A s := term A alg.

(*
Definition weakInitialSortedAlgebra : forall (s : S), F (SortedFix F) s -> (SortedFix F) s.
Proof.
    intros s.
    intros FAs.
    intros A alg.
    pose (folded_alg := sortedFold alg).
    pose (fm := @fmap _ _ _ _ F _). unfold arrow in fm. simpl in fm.
    unfold sorted_arrow in fm.
    specialize (fm (fun s0 : S => forall A : S -> Type, F A ~> A -> A s0) A).
    specialize (fm folded_alg).
Defined.

Lemma weakInitialMorphism
    (a : Type)
    (alg : FAlgebra F a)
    : FMorphism F (fold alg) weakInitialAlgebra alg.
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
