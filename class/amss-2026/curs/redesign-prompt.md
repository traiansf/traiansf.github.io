I want to reframe all class lectures starting from the following ideas:
- the class is about analysis and design principles foremost; diagrams may or may not be used as helpers, diagram language is not important (very few companies rely on diagrams, even less on a particular language such as UML)
- to be able to efficiently use and steer AI agents, one should be knowledgeable about the problem they are trying to solve
  – ideally, they would be able to solve it themselves given time and resources
  - the AI just speeds things up
- It's understandable and even commendable to be skeptical and judge AI's every step
  - However, it's a very large volume of specs, implementation, comments
- How then can we keep up with the AI?
  - Think about it like managing a team. It's hard to keep track on everything they do, but
    - you can keep general pointers of where things stand
    - you can always ask for distilled versions of specs
    - you can always ask for detailed explanations on about anything
  - you should make sure that you follow good SW development practices
    - Waterfall seems to work fine:  specs -> plans -> implementation -> tests -> review
    - Maybe combined with TDD
    - Have separate agents do separate phases of the process (esp review)
- The problem with the waterfall pattern is that mistakes in the original specs become very costly as development flows
  - In the AMSS 2026/2027 class we want to lay the foundations for this
- Important AI pitfall to address
  - When working on existing code (which is almost always after the first development effort), it usually attempts to patch rather than abstract and think of a better design / more general solution

Get inspired from existing content and redesign the class along these lines.  We don't need to fully rewrite everything now, but redesign the structure of the classes / demos / labs and fully develop the materials for the first week