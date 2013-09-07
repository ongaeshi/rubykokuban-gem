# rubykokuban-gem

RubyKokuban installer and executer.

### RubyKokuban?

You can write interactive applications be simplified by RubyKokuban.

```ruby
def draw
  text 'Hello, rubykokuban!', 100, 100
  circle 300, 100, 50
end
```

![hello-demo](https://raw.github.com/ongaeshi/rubykokuban-gem/data/images/demo-01.png)

To move the circle is very simple.

```ruby
def setup
  @x = 0
end

def update
  @x += 1
end

def draw
  text 'Hello, rubykokuban!', 100, 100
  circle @x, 100, 50
end
```

![move-demo](https://raw.github.com/ongaeshi/rubykokuban-gem/data/images/demo-02.gif)

Sample code of [drawing](https://github.com/ongaeshi/rubykokuban-sample/blob/master/drawing.rb) and [shooting](https://github.com/ongaeshi/rubykokuban-sample/blob/master/mouse_shooting.rb).

![drawing-demo](https://raw.github.com/ongaeshi/rubykokuban-gem/data/images/demo-03.png)

## Installation

    $ gem install kokuban

## Usage

### Install RubyKokuban.app

    $ kokuban install --latest
    
### Installed?

    $ kokuban list
    osx (0.0.3)
    
### Write a code

```ruby
def draw
  text 'Hello, rubykokuban!', 100, 100
  circle 300, 100, 50
end
```

### Execute script

    $ kokuban exec hello.rb
    
### Very, Very, Useful Hotkey

- **Ctrl+R** (Be careful, not ⌘+R) - Reload script

## Sample Code

[rubykokuban-sample](https://github.com/ongaeshi/rubykokuban-sample)

    $ git clone https://github.com/ongaeshi/rubykokuban-sample
    $ cd rubykokuban-sample
    $ kokuban exec mouse-shooting.rb

## Platform

- [osx](https://github.com/ongaeshi/rubykokuban-osx)
- win
- linux
- ios
- android

## Features

- It's made width mruby + openFrameworks.
  - Not a library. It's an application that move independently.
- Benefits that can be expected.
  - Run on multiple platforms the same code
  - Run in the mobile device as well as PC
  - Hide the code together in the binary file

## Special Thanks

- [mruby](https://github.com/mruby/mruby)
- [openFrameworks](http://www.openframeworks.cc)
