---
layout: post
title: "ME:: tl;dr-ing: You have to constrain LLMs with software that tests software and assures correctness and then they might be useful ; John Regehr:: zero_dof_programming"
---
[Discovered](http://rolandtanglao.com/2020/07/29/p1-blogthis-checkvist-list-links-to-blog/): Mar 27, 2026 14:39 (UTC) [ME:: tl;dr-ing: You have to constrain LLMs with software that tests software and assures correctness and then they might be useful ; John Regehr:: zero_dof_programming](https://john.regehr.org/writing/zero_dof_programming.html)

## QUOTE

* Read the whole thing: [John Regehr:: zero_dof_programming](https://john.regehr.org/writing/zero_dof_programming.html)

>When I teach software testing to CS students, one aspect that I emphasize is that testing is a creative activity, not a mindless pinning down of input->output mappings. When I look at the best software testing efforts out there, there’s invariably something creative and interesting hiding inside. I feel like a lot of projects leave easy testing wins sitting on the floor because nobody has carefully thought about what test oracles might be used. Finding executable oracles for LLMs feels the same to me: with a little effort and critical thinking, we can often find a programmatic way to pin down some degree of freedom that would otherwise be available to the LLM to screw up.

>Next let’s look at some specific examples.

>Correctness oracles abound. We have test suites, fuzzers and property-based testers, runtime sanitizers, static analyzers, linters, strong type systems, and formal verifiers. Any time such a tool can be made available to the LLM, we’ll reap the benefits in terms of not dealing with bugs the hard way, later on.

>Performance oracles are also abundant. We have compiler-inserted instrumentation, runtime instrumentation, heap profilers, hardware performance counters, performance regression test suites, and more. Again, any and all of these tools should be made available to the LLM, although perhaps not right at the beginning of a project. It may work better to have a feature+correctness LLM loop that runs for a while, and then optimize performance in a later phase.

>LLMs love to write weirdly excessive defensive code, and even when they don’t do this, they don’t seem to notice and remove code that becomes dead as they work. The obvious automated oracle is code coverage tools, which we should be using anyhow, to detect deficiencies in our test suites. On the other hand, simply asking an LLM to improve code coverage is an absolutely classic example of How to Misuse Code Coverage.
