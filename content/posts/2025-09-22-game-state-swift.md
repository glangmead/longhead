---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "Game state in Swift"
subtitle: ""
summary: ""
authors: []
tags: []
categories: []
date: 2025-09-22T16:42:32-04:00
lastmod: 2025-09-22T16:42:32-04:00
featured: false
draft: false
params:
  math: true

# Featured image
# To use, add an image named `featured.jpg/png` to your page's folder.
# Focal points: Smart, Center, TopLeft, Top, TopRight, Left, Right, BottomLeft, Bottom, BottomRight.
image:
  caption: ""
  focal_point: ""
  preview_only: false

# Projects (optional).
#   Associate this post with one or more of your projects.
#   Simply enter your project's folder or file name without extension.
#   E.g. `projects = ["internal-project"]` references `content/project/deep-learning/index.md`.
#   Otherwise, set `projects = []`.
projects: []
---
I'm working towards a goal of having a strongly typed, functional (as in programming) engine for board game logic. This should enable a game to be built up in composable pieces. I don't yet have a compelling pitch for why this is a good thing, but my intuition tells me it will for example allow a game to be playable after any subset of its components and rules are defined. Imagine reading a rulebook and you get to page 10 where it says "oh and if a blue piece captures a red piece then advance the morale track". Before reaching page 10 you, the reader, already have a game in your head. Then you "add one more rule" to that game and get a new, slightly larger game. I want to make some sort of game editor that supports this way of thinking.

I'm going to start by exploring what types would be appropriate to represent game _state_ and game _actions_. Then later on in some future post I'll talk about the category theory of lenses and dynamical systems, which provide a compositional pattern for the runtime of applying actions, i.e. advancing the state of a game. That's for future posts.

Another way to describe the context of this work is to say that I'm trying to improve on game engine research such as [Ludii](http://ludii.games), [TAG](https://gaigresearch.github.io/projects/TAG), and the ancient [GDL](http://logic.stanford.edu/ggp/notes/gdl.html). These are cool and inspiring (especially TAG) but they are tuned for their own specific tradeoffs, none of which is making it user-friendly to input the rules for a new game (and TAG, cool at it is, specifically and emphatically discards this goal).

My insight today is how we might _decompose_ the state of the game into the state of each of its _components_. For example if a game has _pieces_, each piece might be in some space on the board, or off the board in a pile of pieces not yet deployed to the board. The game may also have an overall state of whose turn it is, and what phase of their turn it is. I'll call those components as well. After all, some games have literal tokens that you move around to track the player and phase. Call the type of components $C$.

Each component has its own specific (private but not programming-language-private) space of states. By "has" I mean we have a _type family_ $f:C\to\mathsf{Type}$, i.e. a type of possible values for each game component. A complete game state is a choice of state for each component, i.e. a section of the type family $f$. A section is denoted $S:\prod_{c:C}f(c)$,  and the type $\prod_{c:C}f(c)$ is often called a _pi-type_. I think it's neat that these arise here.

But it gets neater! What is an action? I think a pure atomic action is a change of the state of one component. Such an action may have side-effects, or it might be illegal, and those need to be modeled in this system at some point. But a would-be action without its side effects is a choice of a component $c:C$ and a new value $n$ in its fiber, i.e. $n:f(c)$. Pairs like $(c,n)$ are points in the total space of the type family, i.e. terms $a:\sum_{c:C}f(c)$. This total space $\sum_{c:C}f(c)$ is called a _sigma-type_. It's the other standard construction given a type family!

So the paradigm I'm working towards is that states are dependent functions, and actions are atomic tweaks to the function. Let's look at an example.

## States and actions in Swift

In the game ["Can't Stop"](https://en.wikipedia.org/wiki/Can%27t_Stop_(board_game)) there are 2-4 players who take turns, and on their turn they keep alternating between two phases: whether to roll or pass, and then rolling and deciding what pieces to move. We'll assume there are two players in this post.

I'm determined to stick with Swift's value types for these. The `enum` is a coproduct/disjoint union, and `struct` is a product. Like we said, the base of the type family consists of the components. First there are the pieces:

```swift
enum Piece {
  case white1, white2, white3
  case red2, red3, red4, red5, red6, red7, red8, red9, red10, red11, red12
  case blue2, blue3, blue4, blue5, blue6, blue7, blue8, blue9, blue10, blue11, blue12
}
```

Players and phases are enums as well:

```swift
enum PlayerAmongTwo {
  case player1
  case player2
}

enum Phase {
  case notRolled
  case rolled
}
```

A component is either a piece, a player, or a phase:

```swift
enum Component {
  case piece(Piece)
  case player
  case phase
}
```

Now for the type family. The board has columns numbered 2-12 and a variable height for each column (making a stop sign). I'll use "column 0" to be the off-board pile where the unused pieces are:

```swift
enum Column: Int {
  case none = 0
  case two = 2, three, four, five, six, seven, eight, nine, ten, eleven, twelve
}

let colHeights: [Column: Int] = [
  .two:    3,
  .three:  5,
  .four:   7,
  .five:   9,
  .six:    11,
  .seven:  13,
  .eight:  11,
  .nine:   9,
  .ten:    7,
  .eleven: 5,
  .twelve: 3,
]

typealias Board = [Column: [Int]]

let board: Board = [
  Column.two:    [Int](repeating: 0, count: colHeights[Column.two]!),
  Column.three:  [Int](repeating: 0, count: colHeights[Column.three]!),
  Column.four:   [Int](repeating: 0, count: colHeights[Column.four]!),
  Column.five:   [Int](repeating: 0, count: colHeights[Column.five]!),
  Column.six:    [Int](repeating: 0, count: colHeights[Column.six]!),
  Column.seven:  [Int](repeating: 0, count: colHeights[Column.seven]!),
  Column.eight:  [Int](repeating: 0, count: colHeights[Column.eight]!),
  Column.nine:   [Int](repeating: 0, count: colHeights[Column.nine]!),
  Column.ten:    [Int](repeating: 0, count: colHeights[Column.ten]!),
  Column.eleven: [Int](repeating: 0, count: colHeights[Column.eleven]!),
  Column.twelve: [Int](repeating: 0, count: colHeights[Column.twelve]!)
]
```

The columns are fixed-size arrays containing zeros. I don't care what they contain, I don't think we'll look at the data inside the board at all.

Now for some payoff. In Swift there is no type-of-types such as `Type` in Agda, but we won't miss it. A state is a choice of board space for _every_ piece, plus a choice of player and phase:


```swift
// the pi type of the family, i.e. a type of sections of the family
struct State {
  var piece: (Piece) -> Board
  var player: Player
  var phase: Phase
}
```

It's a struct because a map out of a disjoint union is a product of maps on each component. Actions will be dual to this: an action will again be an `enum`, holding both a component and its value:

```swift
// the sigma type of the type family: pairs of (component, value)
enum Action {
  // the state of one piece
  struct PiecePosition {
    var piece: Piece
    var position: Board
  }

  case piecePosition(PiecePosition)
  case player(Player)
  case phase(Phase)
}
```

I wanted to use a tuple for `piecePosition`, i.e. `case piecePosition((Piece, Board))`, since it's a pair after all, but I need to use types that conform to `Hashable` (to put them in sets-of-actions) and tuples don't conform, so fine we'll use a helper struct `PiecePosition`.

That's where I am so far. I'll keep implementing "Can't Stop" and some lenses for it next.
