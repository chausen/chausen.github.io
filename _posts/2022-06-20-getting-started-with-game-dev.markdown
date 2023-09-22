---
layout: post
title:  "Getting started with game dev"
date:   2023-09-21 20:22:26 -0600
categories: game-dev 
---
I've been recently trying to get into game development, and I'm starting with the course CS50g on EdX. I'm currently on the 6th project (Angry Birds). So far, I think it's a great introduction. Each lecture, the instructor goes over the code for a simple game and introduces new topics along the way (sprite sheets, collision handling, tweens, etc.). Then, you add new features to the game that was covered. For example, the Zelda lecture had you add pots, along with the ability to pick them up and throw them at enemes.

So far, the course has used the Lua language with the `LÖVE` framework. My understanding is that it's pretty barebones, which makes it a good tool for teaching. However, Love2 is more than just a teaching tool--it's commonly used for prototyping games and has also been used to build some published titles. The lecture on Angry Birds was the first one to introduce a major library in `Box2d`, a popular 2D physics framework. Some simple ones were introduced earlier:
- [push](https://github.com/Ulydev/push/blob/master/push.lua)
- [hump (really just class.lua)](https://github.com/vrld/hump/blob/master/class.lua)
- [knife](https://github.com/airstruck/knife)

It feels exciting moving from doing everything manually to something that easily provides very interesting mechanics. Colton (the instructor) says as much in the lecture; I couldn't help but laugh at this quote 😂:
> It's a good like sort of segway from the...sort of abstract, for lack of a better word example that we used earlier, and sort of merges it into the realm of, 'how can we make something fun with this?'



The game, lecture, and assignment all seem to be pretty simple/short in this one, because Box2d is introduced as something big and new--but the usage is really simple. I've watched the lecture and am going to begin the assignment. Here are some notes I took:

# Box2d
A C++ library that is used all over (Unity uses it). Lua provides a wrapper for it.
https://www.iforce2d.net/b2dtut/introduction

- Main concept is the "World", which is the container for simulation
- The world keeps track of "Bodies" and applies all the physics to them (gravity, collisions, etc.)
  - Has position, velocity
- Fixtures allow you attach a shape to a body, allowing interaction with other bodies
  - influences collisions
  - have densities, friction, restitution (bounciness)

## World
- Top-level container Box2d exposes to be populated with bodies/fixtures, and then run the simulation

## Bodies

### Types
- Static: cannot be moved, but can influence other dynamic bodies
- Dynamic: influenced by other bodies
- Kinematic: can move and influence other bodies, but is not influenced itself

## Fixtures
- Several shapes a provided

## Collision Callbacks
- You pass your functions for the different callbacks to the world
- The collisions happen between the fixtures; not the bodies
- That means there is a single entry point; you have to check which fixtures collided to get different behavior
- The way we can distinguish between fixtures is with UserData, which we set on the fixtures and then can get in the callback
- Don't delete or destroy anything in your collision callbacks; mark it as destroyed and wait until the callback completes

### 4 types
- `beginContact`
- `endContact`
- `preSolve`
- `postSolve`

You register them like this:
{% highlight lua %}
self.world:setCallbacks(beginContact, endContact, preSolve, postSolve
{% endhighlight %}