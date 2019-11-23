## Tips for Solving Whiteboard problems

### Why Whiteboard Problems?
Things the interviewer will be looking for:

Can you think algorithmically? Can you think about efficiency?
Are you a good communicator? Are you someone I want to think through a new feature with?
Can you code? Can you code neatly and correctly?

### Before you start
Ask questions. Don't rush, it's a problem-solving demo, not a speed-coding test.

What are we optimizing for? Time? Space?
Are there any constraints on the input set?
If you draw a blank

Make up a sample input and compute it. Do this two or three times aloud.
Find a naive solution, any solution, to get started. Then you can optimize.
Come up with a simpler version of the problem, solve it, then progressively add complexity.
Think aloud about the likely bounds on efficiency for your solution.
This is an easy way to score points.
"What's sure is I'll have to iterate through all the points, so it's at least linear time."
"The problem is trivial when the set is sorted. So it can definitely be done in nLOGn time. Let's see if we can do better than n Log n."

### During the Problem
The nice thing about white boards is you and the interviewer are facing the same direction.
Convince yourself that you are solving the problem together. Say "we" instead of "I".
Don't stop until they tell you to.

#### Style
Be confident; even if you don't know the answer, try to engage the problem, don't give up. If you keep telling an interviewer you don't know how to do something, they'll start to believe you.
Talk through the problem; they want to see the process going on in your head. If you don't talk, the interviewer doesn't learn how you break-down and analyze a problem.
The interviewer may give you hints. They will ask questions to keep you on track. Don't be flustered or think you're failing; this is normal.
If they ask you "does this work", take a moment to think. Walk through the steps; out loud is fine. If you say yes, say it like you believe it; interviewers don't like to think people are just praying they'll get the answer right.
Listen to the interviewer. They are trying to help you. No one likes someone who doesn't listen.
Keep a mental list of general strategies you can turn to. Here are a few:

Bucketizing with a hash: If the input set is bounded, try organizing it into a hash.
Ex: Sort an array of 100,000 integers that are all in the range 1-100
Dynamic programming, or "divide and conquer": Divide into smaller and smaller but equal subproblems.
Ex: See this solution for a Google interview question.
Look for useful mathematical properties.
Sometimes you have individual values when really what you care about is their sums.
Ex: For an array of integers 1 - 100 where all elements appear once except one that appears twice, find the repeat.
Amortized analysis: it's ok to do something memory- or space-intensive if you can prove that this cost comes with a greater payoff.
Ex: Implement a queue using two stacks.
Keep a stack or a queue on the side to track values as your algorithm goes through the problem.
Keep two pointers for the same iteration.
Ex: Reverse a string in place (ie. using no more memory space than the length of the string).
Perform an operation twice.
Ex: Reverse the word order of a string, but not the letters within the words.
Sort the input.
Ex: Finding anagrams.
Approach the problem from the other end.
Ex: see this solution for a Fog Creek interview question.
Use binary numbers instead of decimal numbers.
Ex: see the famous Bad King problem.
For efficiency, use binary search instead of incrementation. Esp. good for implementing math operators.
Ex: Implement division without using "/", in less than O(n) time.

### Don't be Sly
If you don't understand the problem, ask for clarification. A well-formulated question
is as impressive as a good answer. If you don't know something, don't make it up
. Tell the interviewer you don't know and then try your best guess. Many interiewers
will really like this. Same thing when you hit a snag. Don't try to cover things
up and make it look like you were on the right track. Explain to the interviewer
why you think the current hypothesis actually won't work.