---
title: Consensus in Distributed Systems
subtitle: Formalizing Correct by Construction Protocols
author: Traian Florin Șerbănuță (based on work by Vlad Zamfir)
institute: Runtime Verification & LOS @ FMI @ UNIBUC
abstract: |
---

# The Consensus Problem

## What is a consensus protocol?

Consensus protocols: distributed systems making consistent decisions about a 
predefined domain of consensus values

### Example: consensus on a bit

The goal of the consensus protocol is to have nodes all output “0” or all output “1.”

## More interesting examples

- Deciding on an integer

  + which can be used to encode a transaction metadata, e.g.

- Deciding on the (global) state of a blockchain

  + In which order should transactions be comitted?

## Consistent Decisions

### Decisions on (consensus) values

- each node in the protocol has to output a value

- decisions are consistent if output values are equal

### Decisions on predicates (over consensus values)

- each node in the protocol has to output a predicate

- decisions are consistent if there is a value satisfying all predicates

- decisions on values as decisions on the equality predicate


## Desirable properties for consensus

### Safety : Don't make inconsistent decisions

If (protocol-following) nodes do decide, then their decision should be consistent.

### Liveness : Eventually reach a decision

Any (protocol-following) node will eventually reach a decision that accepts or rejects any given value.

## What is the problem?

- Some of the processes (agents) may fail or be unreliable in other ways

- Communication is unreliable: messages can be delayed, reordered, or lost

### Fault tolerance

- Protocols that solve consensus problems are designed to deal with limited numbers of faulty processes.

  + communication failure can be attributed to originating process

Asynchonously safe

: Safety is guaranteed regardless of timing assumptions

Byzantine fault tolerant (for t faults)

: If it tolerates t nodes behaving arbitrarily rather than following the protocol

## Why Byzantine?

Lamport, L.; Shostak, R.; Pease, M. (1982). "The Byzantine Generals Problem" (PDF). ACM Transactions on Programming Languages and Systems. 4 (3): 387–389.

- A number of generals are approaching a fortress
- They must decide whether to attack or retreat.
- Some generals may prefer to attack, while others prefer to retreat.
- The important thing is that all generals agree on a common decision.

## Byzantine Complications

- The generals are physically separated and need to communicate through messages
  - messengers who may fail to deliver votes
  - messengers may forge false votes
- Some generals are treacherous
  - they might tell somes they want to attack and others they want to retreat

## Solutions to the Byzantine Generals Problem

Let $n$ be the number of generals out of which $t$ are treacherous.

### Oral communication

Assumptions

: unsigned messages, bounded delay (synchronous communication)

Result

: there must be less than a third treacherous generals

### Written communication

Assumptions

: unforgeable signatures, bounded delay (synchronous communication)

Result

: can be solved (with enough rounds) if there are at least two non-treacherous generals

## FLP impossibility result
 
Fischer, M. J.; Lynch, N. A.; Paterson, M. S. (1985). "Impossibility of distributed consensus with one faulty process" (PDF). Journal of the ACM. 32 (2): 374–382.

It is impossible for a deterministic protocol to be guaranteed to be safe and live in asynchrony, in the context of any faults.

### What we can hope for

- Deterministic protocols
- which are guaranteed to be safe under asynchronous assumptions
  - they cannot be guaranteed to also be live due to FLP impossibility
- which are live under partial-synchronicity assumptions

## The Correct-by-Construction approach

### Current status quo

- Define a (consensus) protocol
- Formalize safety and liveness for that protocol
- Prove that they are satisfied by the protocol
  - under certain assumptions

### Correct-by-construction (CBC) promise

- Define an abstract class of consensus protocols
- Prove (once) general safety and liveness results for protocols belonging to that class
  - assuming protocols satisfy some generic abstract properties  
- Construct CBC protocols from those requirements by refinement
  - Alternatively, prove that concrete protocols satisfy those requirements

## Traditional vs. CBC

### Traditional

Protocol first, analysis second

### CBC

Analysis first, protocol second

  
# Correct-by-Construction (CBC) Consensus Protocols

## Basic agent assumptions

Each agent participating in the protocol

- has states ($\sigma$)
- can transition between states ($\sigma\rightarrow\sigma'$)
  $\rightarrow$ is reflexive and transitive
- can propose (estimate) consensus values based on current state
  ($E(\sigma,c)$ ::= node can propose $c$ if in state $\sigma$)

## Basic safety

Let $p$ be a (decidable) predicate on consensus values

We denote with $p(c)$ the fact that $p$ holds for consensus value $c$ 

We say that $p$ holds for $\sigma$, (written $\sigma\models p$) iff for all $c$ such that $E(\sigma,c)$, we have $p(c)$.

We say that $p$ is safe at $\sigma$ (written $\sigma\models^\ast{p}$) iff it holds for all future states of $\sigma$, i.e., if $\sigma\rightarrow\sigma'$ then $\sigma'\models p$.

We say that states $\sigma_1$ and $\sigma_2$ are estimator-equivalent (written $\sigma_1\equiv_E\sigma_2$) iff they estimate the same values, i.e., for any $c$, $E(\sigma_1,c) \leftrightarrow E(\sigma_2,c)$

## Basic safety results

If $\sigma\models^\ast{p}$ and $\sigma\rightarrow\sigma'$, then

- $\sigma'\models^\ast{p}$ (forward safety)
- $\sigma'\not\models^\ast\neg{p}$ (backwards consistency)

### Distributed consistency

If $\sigma_1\rightarrow\sigma'$ and $\sigma_2\rightarrow\sigma'$, then either

$$\sigma_1\not\models^\ast{p}\textrm{ or }\sigma_1\not\models^\ast{\neg{p}}$$

For any $\sigma_1$ and $\sigma_2$ with a common future state, and any predicate $p$, it's not possible for $p$ to be safe at $\sigma_1$ and $\neg{p}$ to be safe at $\sigma_2$.

## Requirements for Consensus safety 

Decisions are final

: if a node makes a decision in state $\sigma$, it would make the same decision in all future states.

Decisions are estimator-dependent

: If a node makes a decision in a state $\sigma$ then any node in any state with the same estimator as $\sigma$ will make the same decision

Common future estimator

: Given protocol states $\sigma_1$ and $\sigma_2$ belonging to distinct nodes there are states $\sigma'_1$ such that $\sigma_1\rightarrow\sigma'_1$ and $\sigma'_2$ such that $\sigma_2\rightarrow\sigma'_2$, and $\sigma'_1\equiv_E\sigma'_2$

## Byzantine faults challenges to consensus safety

- A byzantine needs not obey the final decisions requirement

- Byzantine node messages might influence the future of non-byzantine nodes

- Reason: byzantine nodes behave in an arbitrary manner

- Hence, we would like consensus safety for non-faulty nodes guarantees

## Requirements for Consensus safety of non-faulty nodes

Decisions are final

: if a non-faulty node makes a decision in state $\sigma$, it would make the same decision in all future states.

Decisions are estimator-dependent

: If a non-faulty node makes a decision in a state $\sigma$ then any non-faulty node in any state with the same estimator as $\sigma$ will make the same decision

Common future estimator

: Given protocol states $\sigma_1$ and $\sigma_2$ belonging to non-faulty distinct nodes there are states $\sigma'_1$ such that $\sigma_1\rightarrow\sigma'_1$ and $\sigma'_2$ such that $\sigma_2\rightarrow\sigma'_2$, and $\sigma'_1\equiv_E\sigma'_2$

## Replacing byzantine faults with equivocation

- Equivocation is behaviour exhibited by a node that can't be produced by a single execution of the protocol, but could be produced by more than one protocol execution.

- i.e., an equivocating node behaves as-if running multiple copies of the protocol

- This is more easy to analyze behaviour than that of a byzantine node which can behave completely erratic

- Moreover, _validating_ protocols might be able to ensure that received messages are protocol (although they might not belong to the observed run of the protocol)

## Consensus safety for non-equivocating nodes

Goal

: ensure that nodes have common future estimators under limited-equivocation assumptions

# Formalization

## Current Status

### Done

- an abstract model for nodes (VLSM)
- asynchronous composition of nodes
- State equivocation: notion of equivocating based on equivocating nodes (running multiple copies of same node)
- Message equivocation: notion of equivocation based on messages being received but not previously sent
- Equivalence of state and message notions of equivocation

### In Progress

- Equivalence between byzantine nodes and equivocating nodes under input-validating assumptions
- Common futures estimators for non-equivocating nodes under limited-equivocation assumptions
- Liveness under partial synchrony and limited equivocation assumptions

## Valid Labeled State-Transition and Message-Production (VLSM) Systems 

- A set $M$ of _messages_, used for communication (shared between nodes)
  - with a distinguised subset $M_0$ of initial messages
  - Let $M^\bot$ be $M\cup\{\bot\}$ be the option-set of $M$
- A set $S$ of _states_
   - with a non-empty distinguished subset $S_0$ of initial states
- A set of _labels_ denoting transition types
- A _transition_ function $\tau: {L \times S \times M^\bot}\rightarrow{S\times{M^\bot}}$
  - $\tau(l, \sigma, oin) = (\sigma', oout)$: if machine is in state $\sigma$ and receives
    message $oin$, then it can transition with label $l$ in state $\sigma'$ sending message $oout$
- A predicate $V : L \times S \times M^\bot$ describing the _valid_ inputs for the transition function.

Resemblance to I/O Automata used in distributed systems research


## VLSM protocol transitions traces, states, messages

Transition relation

: $\sigma\xrightarrow[l]{oin\mid{oout}}\sigma'$ if $\tau(l,\sigma,oin) = (\sigma',oout)$

Valid transition

: $\sigma\xrightarrow[l]{oin\mid{oout}}\sigma'$ such that $V(l,\sigma,oin)$

(Valid) finite trace

: Succession of (valid) transitions $\sigma_0\xrightarrow[l_1]{oin_1\mid{oout_1}}\sigma'_1\xrightarrow[l_2]{oin_2\mid{oout_2}}\cdots\xrightarrow[l_n]{oin_n\mid{oout_n}}\sigma_n$

Protocol traces

: A valid trace starting in an initial state $\sigma_0$, $\sigma_0\xrightarrow[l_1]{oin_1\mid{oout_1}}\sigma'_1\xrightarrow[l_2]{oin_2\mid{oout_2}}\cdots\xrightarrow[l_n]{oin_n\mid{oout_n}}\sigma_n$ such that all input messages $oin_i$ are _protocol_

Protocol message

: initial message or output of some protocol trace

Protocol state

: any state in a protocol trace

## Free VLSM compositions (asynchronous product)

Given a indexed set of VLSMs $(\mathcal{V}_i = (M, M^i_0, S^i, S^i_0, L^i, \tau^i, V^i))_{i\in{I}}$ over the same set of messages, define their free composition $Free((\mathcal{V}_i)_{i\in{I}} = (M, M_0, S, S_0, L, \tau, V))$ as follows

$M_0$

: ${}= \bigcup_{i\in{I}} M^i_0$ is the union of all initial messages

$S$

: ${}= \prod_{i\in{I}} S^i$ is the product of states ($S_0 = \prod_{i\in{I}} S^i_0$)

$L$

: ${} = \bigoplus_{i\in{I}} L^i$ is the disjoint union of labels

$V$

: $(l^k, (\sigma_i)_{i\in{I}}, oim) = V^k(l^k, \sigma_k, oim)$ (component-wise, guided by labels)

$\tau$

: $(l^k, (\sigma_i)_{i\in{I}}, oim) = ((\sigma_i)_{i\in{I}}[k \leftarrow\sigma'_k], oom))$, where $\tau^k(l_k,\sigma_k,oim) = (\sigma'_k, oom)$ (component-wise, guided by labels)

## Pre-loaded, constrained VLSM compositions

Given a indexed set of VLSMs $(\mathcal{V}_i = (M, M^i_0, S^i, S^i_0, L^i, \tau^i, V^i))_{i\in{I}}$ over the same set of messages, define their composition constrained by global validity $\gamma$ and pre-loaded with messages $M_{pre}$ as $Composed((\mathcal{V}_i)_{i\in{I}}, \gamma, M_{pre}) = (M, M_0, S, S_0, L, \tau, V))$ as follows

$M_0$

: $= M^{Free}_0 \cup{M_{pre}}$ free initial messages extended by pre-loaded ones

$S$

: ${}= S^{Free}$

$L$

: ${} = L^{Free}$

$V$

: $(l, \sigma, oim) = V^{Free}(l, \sigma, oim) \wedge\gamma(l, \sigma, oim)$ free validity further constrained by $\gamma$

$\tau$

: $= \tau^{Free}$

## Interesting requirements

- valid states can be interogated about messages being sent/received in traces leading to that state
- The sender of a message can be identified
  - a message can only be sent by its sender
- Message dependencies (full-node condition): each message depends on a set of messages
  - A message cannot be received before its dependencies have been observed
  - A message can be sent whenever all its dependencies have been observed

## VLSM embeddings

$\mathcal{V}^1 \xrightarrow{\pi_L, \pi_S} \mathcal{V}^2$ is a VLSM embedding where

- $\mathcal{V}^i = (M, M^i_0, S^i, S^i_0, L^i, \tau^i, V^i)$ share the same set of messages
- $\pi_L : L^1 \xrightarrow{\circ} L^2$ is a partial map between labels
- $\pi_S : S^1 \rightarrow{S^2}$ is a (total) map between states

whenever 

- $\pi_S$ preserves initial states
- if $s^1$, $iom$ are protocol for $\mathcal{V}^1$,
  - if $\pi_L(l^1) = l^2$ and $V^1(l^1, s^1, iom)$, $iom$ is protocol for $\mathcal{V}^2$
- if, in addition, $\pi_S(s^1)$ is protocol for $\mathcal{V}^2$, 
  - if $\pi_L(l^1) = l^2$ and $V^1(l^1, s^1, iom)$, then $V^2(l^2, \pi_S(s^1), iom)$
  - if $\pi_L(l^1) = l^2$ and $\tau^1(l^1, s^1, iom) = (s'^1, oom)$, then $\tau^2(l^2, \pi_S(s^1), iom) = (\pi_S(s'^1), oom)$
  - if $\pi_L(l^1) = \bot$ and $\tau^1(l^1, s^1, iom) = (s'^1, oom)$ then $\pi_S(s'^1) = \pi_S(s^1)$

## VLSM embedding properties

- VLSM embeddings induce trace embeddings
  - select only transitions for which $\pi_L$ is defined $\pi_S(\sigma) \xrightarrow[\pi_L(l)]{oim\mid{oom}} \pi_S(\sigma')$
- The protocolness of traces is preserved through embeddings
- The observance of messages is reflected by embeddings

### Full VLSM embeddings

- Special case when the label embedding is total
- replacing the requirement for protocol message preservation with:
  _initial messages of $\mathcal{V^1}$ are protocol in $\mathcal{V^2}$_
- Have all properties of VLSM embeddings
- Additionally, they preserve the observance of messages
  - because transitions are not lost, just embedded

